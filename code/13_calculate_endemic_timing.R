## 13_calculate_endemic_timing.R ----
##
## This file goes through each simulation and calculates the time to
## endemicity using a few different definitions. The results are saved in
## ./data.

## Imports ----
library(tidyverse)
library(here)
library(fs)
library(doParallel)
library(foreach)
library(duckdb)
library(arrow)
library(furrr)
source(here::here("code", "utils.R"))

## CONSTANTS ---
VERBOSE <- TRUE
N_CORES_MAX <- 12
FORCE_REFRESH <- FALSE
DELETE_TEMP_FILES <- FALSE

## Calculate endemic timing at the national level ----
if (!fs::file_exists(here::here("data", "endemic_timing_full_results.RDS")) |
    FORCE_REFRESH) {
    pathogen_grid <- tidyr::expand_grid(
        pathogen = c("measles", "rubella", "polio", "diphtheria"),
        vaccine_coverage = return_vaccine_coverage(all = TRUE)
    ) |>
        dplyr::mutate(f_path = here::here(
            "temp_endemic_timing",
            sprintf(
                ifelse(vaccine_coverage < 0,
                    "%s_endemic_timing_fixed_vaccine%03d.RDS",
                    "%s_endemic_timing_vaccine%03d.RDS"),
                pathogen,
                ifelse(vaccine_coverage < 0,
                    round(-100 * vaccine_coverage),
                    round(100 * vaccine_coverage))
            )
        )) |>
        dplyr::arrange(pathogen, f_path)

    for (i in 1:NROW(pathogen_grid)) {
        f_path <- pathogen_grid$f_path[i]
        pathogen_x <- pathogen_grid$pathogen[i]
        vaccine_coverage_x <- pathogen_grid$vaccine_coverage[i]

        ## Lower number of cores because of higher memory requirement for
        ## polio (every time step) and rubella (age stratified).
        if (pathogen_x %in% c("rubella", "polio")) {
            N_CORES <- floor(N_CORES_MAX / 2)
        } else {
            N_CORES <- N_CORES_MAX
        }

        if (fs::file_exists(f_path) && !FORCE_REFRESH) {
            if (VERBOSE) {
                print(
                    sprintf(
                        "Skipping %s at %s (%s of %s; %s)",
                        pathogen_x,
                        vaccine_coverage_x,
                        i,
                        NROW(pathogen_grid),
                        round(Sys.time())
                    )
                )
            }
            next
        }

        if (VERBOSE) {
            print(sprintf(
                "Processing %s at %s (%s of %s; %s)",
                pathogen_x,
                vaccine_coverage_x,
                i,
                NROW(pathogen_grid),
                round(Sys.time())
            ))
        }

        ## Pull full simulation data
        full_temp_x <- pull_raw_simulations(
            pathogen_x = pathogen_x,
            vaccine_x = vaccine_coverage_x,
            state_x = "US",
            time_max = 365 * 25,
            return_all = TRUE
        )

        ## Collapse over age and subset to just columns we need
        temp_x <- full_temp_x |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen, state, time) |>
            dplyr::summarize(dplyr::across(susceptible:cume_imported_infectious, sum), .groups = "drop")

        rm(full_temp_x)
        gc()

        temp_x <- temp_x |>
            dplyr::mutate(prop_susceptible = (susceptible - vrt_vaccinated) /
                (susceptible + exposed + infectious + recovered)) |>
            dplyr::select(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                time,
                prop_susceptible,
                new_infectious,
                imported_infectious,
                cume_new_infectious,
                cume_imported_infectious
            ) |>
            dplyr::arrange(pathogen, vaccine_coverage, batch, simulation, time)

        ## Remove imported cases from infectious count (i.e., secondary only)
        temp_x <- temp_x |>
            dplyr::mutate(
                new_infectious_with_imports = new_infectious,
                cume_new_infectious_with_imports = cume_new_infectious
            ) |>
            dplyr::mutate(
                new_infectious = new_infectious - imported_infectious,
                cume_new_infectious = cume_new_infectious - cume_imported_infectious
            )

        ## Calculate proportion of infections that are secondary
        temp_x <- temp_x |>
            dplyr::mutate(prop_secondary = cume_new_infectious / cume_new_infectious_with_imports)

        if (pathogen_x != "polio") {
            full_infectious <- temp_x |>
                dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
                reconstruct_new_infectious()
        } else {
            full_infectious <- temp_x |>
                dplyr::select(batch, simulation, vaccine_coverage, pathogen, time, new_infectious)
        }

        simulation_grid <- full_infectious |>
            dplyr::select(batch, simulation) |>
            dplyr::distinct()

        if (VERBOSE) {
            print(sprintf("    Evaluating simulations (%s)", round(Sys.time())))
        }

        doParallel::registerDoParallel(cores = N_CORES)
        temp_endemic <- foreach::foreach(j = 1:NROW(simulation_grid)) %dopar% {
            batch_x <- simulation_grid$batch[j]
            simulation_x <- simulation_grid$simulation[j]

            sub_cases <- full_infectious |>
                dplyr::filter(
                    batch == batch_x,
                    simulation == simulation_x,
                    vaccine_coverage == vaccine_coverage_x,
                    pathogen == pathogen_x
                ) |>
                dplyr::arrange(time) |>
                dplyr::pull(new_infectious)

            endemic_time <- calculate_endemic_timing(sub_cases, pathogen_x)
            above1_time <- calculate_above1_timing(sub_cases, pathogen_x)
            cases_100k_time <- min(which(cumsum(sub_cases) >= 100000))
            secondary_cases_99_time <- min(which(
                temp_x |>
                    dplyr::filter(
                        batch == batch_x,
                        simulation == simulation_x,
                        vaccine_coverage == vaccine_coverage_x,
                        pathogen == pathogen_x
                    ) |> dplyr::pull(prop_secondary) >= .99
            ))

            if (is.finite(endemic_time)) {
                prop_susceptible <- temp_x |>
                    dplyr::filter(
                        batch == batch_x,
                        simulation == simulation_x,
                        vaccine_coverage == vaccine_coverage_x,
                        pathogen == pathogen_x
                    ) |>
                    dplyr::filter(time %in% (endemic_time - 364:365)) |>
                    dplyr::slice_max(time) |>
                    dplyr::pull(prop_susceptible)
            } else {
                prop_susceptible <- Inf
            }

            dplyr::tibble(
                batch = batch_x,
                simulation = simulation_x,
                vaccine_coverage = vaccine_coverage_x,
                pathogen = pathogen_x,
                endemic_time = endemic_time,
                above1_time = above1_time,
                cases_100k_time = cases_100k_time,
                secondary_cases_99_time = secondary_cases_99_time,
                prop_susceptible = prop_susceptible
            )
        }
        doParallel::stopImplicitCluster()
        closeAllConnections()

        fs::dir_create(dirname(f_path))
        saveRDS(dplyr::bind_rows(temp_endemic), f_path, compress = "xz")

        rm(temp_endemic)
        gc()
    }

    endemic_holder <- purrr::map_dfr(
        .x = fs::dir_ls(
            here::here("temp_endemic_timing"),
            recurse = TRUE,
            glob = "*.RDS"
        ),
        .f = ~ readRDS(.x)
    ) |>
        categorize_pathogens() |>
        categorize_vaccine_coverage()

    saveRDS(endemic_holder,
        here::here("data", "endemic_timing_full_results.RDS"),
        compress = "xz"
    )
} else {
    endemic_holder <- readRDS(here::here("data", "endemic_timing_full_results.RDS"))
}

## Summarize the national level endemic timing ----
if (!fs::file_exists(here::here("data", "endemic_timing_summary.RDS"))) {
    ## Summarize endemic timing across different metrics ----
    summary_result <- endemic_holder |>
        dplyr::select(
            vaccine_coverage,
            pathogen,
            endemic_time,
            above1_time,
            cases_100k_time,
            secondary_cases_99_time,
            prop_susceptible
        ) |>
        tidyr::pivot_longer(
            cols = endemic_time:secondary_cases_99_time,
            names_to = "metric"
        ) |>
        dplyr::group_by(vaccine_coverage, pathogen, metric) |>
        dplyr::summarize(
            n_sims = dplyr::n(),
            n_finite = sum(is.finite(value)),
            mean = mean(value[is.finite(value)], na.rm = TRUE),
            sd = stats::sd(value[is.finite(value)], na.rm = TRUE),
            median = stats::median(value[is.finite(value)], na.rm = TRUE),
            p025 = stats::quantile(value[is.finite(value)], .025, na.rm = TRUE),
            p250 = stats::quantile(value[is.finite(value)], .25, na.rm = TRUE),
            p750 = stats::quantile(value[is.finite(value)], .75, na.rm = TRUE),
            p975 = stats::quantile(value[is.finite(value)], .975, na.rm = TRUE),
            mean_prop_susceptible = mean(prop_susceptible[is.finite(prop_susceptible)], na.rm = TRUE),
            .groups = "drop"
        ) |>
        dplyr::arrange(vaccine_coverage, pathogen, metric) |>
        categorize_pathogens() |>
        categorize_vaccine_coverage() |>
        dplyr::mutate(metric_cat = factor(
            metric,
            levels = c(
                "endemic_time",
                "cases_100k_time",
                "secondary_cases_99_time",
                "above1_time"
            ),
            labels = c(
                "Primary definition",
                ">100k cases",
                ">99% of cases are secondary",
                "At least 1 case per week"
            ),
            ordered = TRUE
        ))
    ## Save ----
    saveRDS(summary_result,
        here::here("data", "endemic_timing_summary.RDS"),
        compress = "xz"
    )
} else {
    summary_result <- readRDS(here::here("data", "endemic_timing_summary.RDS"))
}

## Get national endemic timing for each metric and time point ----
if (!fs::file_exists(here::here("data", "endemic_timing_probability.RDS"))) {
    param_grid <- summary_result |>
        dplyr::select(vaccine_coverage, pathogen) |>
        dplyr::distinct()

    timeline_holder <- vector("list", NROW(param_grid))

    for (i in 1:NROW(param_grid)) {
        sub_endemic <- endemic_holder |>
            dplyr::filter(
                pathogen == param_grid$pathogen[i],
                vaccine_coverage == param_grid$vaccine_coverage[i]
            )

        temp_endemic <- vector("numeric", 365 * 25)
        temp_cases <- vector("numeric", 365 * 25)
        temp_secondary <- vector("numeric", 365 * 25)
        temp_above1 <- vector("numeric", 365 * 25)

        for (j in 1:NROW(temp_endemic)) {
            temp_endemic[j] <- mean(sub_endemic$endemic_time <= j, na.rm = TRUE)
            temp_endemic[j] <- mean(sub_endemic$above1_time <= j, na.rm = TRUE)
            temp_cases[j] <- mean(sub_endemic$cases_100k_time <= j, na.rm = TRUE)
            temp_secondary[j] <- mean(sub_endemic$secondary_cases_99_time <= j, na.rm = TRUE)
        }

        timeline_holder[[i]] <- dplyr::bind_rows(
            dplyr::tibble(
                pathogen = param_grid$pathogen[i],
                vaccine_coverage = param_grid$vaccine_coverage[i],
                time = 1:(365 * 25),
                metric = "endemic_time",
                gte1 = temp_endemic
            ),
            dplyr::tibble(
                pathogen = param_grid$pathogen[i],
                vaccine_coverage = param_grid$vaccine_coverage[i],
                time = 1:(365 * 25),
                metric = "above1_time",
                gte1 = temp_endemic
            ),
            dplyr::tibble(
                pathogen = param_grid$pathogen[i],
                vaccine_coverage = param_grid$vaccine_coverage[i],
                time = 1:(365 * 25),
                metric = "cases_100k_time",
                gte1 = temp_cases
            ),
            dplyr::tibble(
                pathogen = param_grid$pathogen[i],
                vaccine_coverage = param_grid$vaccine_coverage[i],
                time = 1:(365 * 25),
                metric = "secondary_cases_99_time",
                gte1 = temp_secondary
            )
        )
    }

    timeline_holder <- timeline_holder |>
        dplyr::bind_rows() |>
        dplyr::mutate(metric_cat = factor(
            metric,
            levels = c(
                "endemic_time",
                "cases_100k_time",
                "secondary_cases_99_time",
                "above1_time"
            ),
            labels = c(
                "Primary definition",
                ">100k cases",
                ">99% of cases are secondary",
                "At least 1 case per week"
            ),
            ordered = TRUE
        )) |>
        categorize_vaccine_coverage() |>
        categorize_pathogens()

    saveRDS(
        timeline_holder,
        here::here("data", "endemic_timing_probability.RDS"),
        compress = "xz"
    )
}

## Clean up ----
if (DELETE_TEMP_FILES && fs::file_exists(here::here("data", "endemic_timing_full_results.RDS"))) {
    fs::dir_delete(here::here("temp_endemic_timing"))
}
