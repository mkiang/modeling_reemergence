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
N_CORES <- 20
FORCE_REFRESH <- FALSE
DELETE_TEMP_FILES <- FALSE

## Data ----
endemic_holder <- readRDS(here("data", "endemic_timing_full_results.RDS"))

## Get the state level endemic timing ----
## We leverage the fact that if a state is endemic, then the national result
## would also be endemic to limit the number of simulations we need to
## evaluate. We also know that if the cumulative case count is not at least 52
## (since R_e needs to be >=1 for 52 consecutive weeks), then that simulation
## was not endemic.
if (!file_exists(here("data", "endemic_timing_states.RDS")) |
    FORCE_REFRESH) {
    pathogen_grid <- endemic_holder |>
        filter(is.finite(endemic_time)) |>
        select(batch, simulation, vaccine_coverage, pathogen) |>
        arrange(batch, pathogen, desc(vaccine_coverage), simulation)

    batch_grid <- pathogen_grid |> 
        group_by(batch, pathogen, vaccine_coverage) |> 
        summarize(n_sims = n()) |>
        ungroup()|>
        mutate(f_path = here(
            "temp_endemic_timing",
            sprintf(
                ifelse(vaccine_coverage < 0,
                    "state_level_%s_endemic_timing_fixed_vaccine%03d_batch%02d.RDS",
                    "state_level_%s_endemic_timing_vaccine%03d_batch%02d.RDS"),
                pathogen,
                ifelse(vaccine_coverage < 0,
                    round(-100 * vaccine_coverage),
                    round(100 * vaccine_coverage)),
                batch
            )
        )) |>
        dplyr::arrange(pathogen, desc(vaccine_coverage), f_path)

    for (i in 1:NROW(batch_grid)) {
        if (file_exists(batch_grid$f_path[i])) {
            if (VERBOSE) {
                print(sprintf("Skipping %s (%s)", basename(batch_grid$f_path[i]), round(Sys.time())))
            }
            next
        } else {
            if (VERBOSE) {
                print(sprintf("Processing %s (%s)", basename(batch_grid$f_path[i]), round(Sys.time())))
            }
        }
        
        sub_pathogen <- pathogen_grid |>
            filter(batch == batch_grid$batch[i],
                   pathogen == batch_grid$pathogen[i], 
                   vaccine_coverage == batch_grid$vaccine_coverage[i])

        doParallel::registerDoParallel(cores = N_CORES)
        state_holder <- foreach::foreach(j = 1:NROW(sub_pathogen), .inorder = FALSE) %dopar% {
            batch_x <- sub_pathogen$batch[j]
            simulation_x <- sub_pathogen$simulation[j]
            pathogen_x <- sub_pathogen$pathogen[j]
            vaccine_coverage_x <- sub_pathogen$vaccine_coverage[j]

            state_endemic_holder <- map_dfr(
                .x = c("DC", state.abb),
                .f = ~ {
                    ## Pull full simulation data
                    temp_x <- pull_raw_simulations(
                        pathogen_x = pathogen_x,
                        vaccine_x = vaccine_coverage_x,
                        batch_x = batch_x,
                        simulation_x = simulation_x,
                        state_x = .x,
                        time_max = 365 * 25,
                        return_all = TRUE
                    ) |>
                        group_by(batch, simulation, vaccine_coverage, pathogen, state, time) |>
                        summarize(across(susceptible:cume_imported_infectious, sum), .groups = "drop") |>
                        mutate(prop_susceptible = (susceptible - vrt_vaccinated) /
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
                        mutate(
                            new_infectious_with_imports = new_infectious,
                            cume_new_infectious_with_imports = cume_new_infectious
                        ) |>
                        dplyr::mutate(
                            new_infectious = new_infectious - imported_infectious,
                            cume_new_infectious = cume_new_infectious - cume_imported_infectious
                        )

                    if (pathogen_x != "polio") {
                        full_infectious <- temp_x |>
                            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
                            reconstruct_new_infectious()
                    } else {
                        full_infectious <- temp_x |>
                            select(batch, simulation, vaccine_coverage, pathogen, time, new_infectious)
                    }

                    endemic_time <- calculate_endemic_timing(full_infectious$new_infectious, pathogen_x)

                    if (is.finite(endemic_time)) {
                        prop_susceptible <- temp_x |>
                            dplyr::filter(
                                batch == batch_x,
                                simulation == simulation_x,
                                vaccine_coverage == vaccine_coverage_x,
                                pathogen == pathogen_x
                            ) |>
                            filter(time %in% (endemic_time - 364:365)) |>
                            slice_max(time) |>
                            pull(prop_susceptible)
                    } else {
                        prop_susceptible <- Inf
                    }

                    dplyr::tibble(
                        batch = batch_x,
                        simulation = simulation_x,
                        state = .x,
                        vaccine_coverage = vaccine_coverage_x,
                        pathogen = pathogen_x,
                        endemic_time = endemic_time,
                        prop_susceptible = prop_susceptible
                    )
                })
            state_endemic_holder |>
                filter(is.finite(endemic_time))
        }
        doParallel::stopImplicitCluster()
        closeAllConnections()

        dir_create(dirname(batch_grid$f_path[i]))
        saveRDS(
            bind_rows(state_holder),
            batch_grid$f_path[i],
            compress = "xz"
        )
    }
  
    # ### Save ----
    # saveRDS(
    #     bind_rows(state_holder), 
    #     here("data", "endemic_timing_states.RDS"), 
    #     compress = "xz"
    # )
}

holder <- map_dfr(.x = dir_ls(here("temp_endemic_timing"), regexp = "state_level_measles_endemic_timing_vaccine100_"),
        .f = ~readRDS(.x))

holder |> 
    group_by(state, vaccine_coverage, pathogen) |>
    summarize(n_sims = n_distinct(batch, simulation), 
              mean_endemic = mean(endemic_time), 
              p025_endemic = quantile(endemic_time, prob = .025), 
              p975_endemic = quantile(endemic_time, prob = .975),
              mean_prop_sus = mean(prop_susceptible), 
              p025_prop_sus = quantile(prop_susceptible, prob = .025), 
              p975_prop_sus = quantile(prop_susceptible, prob = .975),
              .groups = "drop") |> 
    arrange(desc(n_sims))
