# Simulate ----

## Imports ----
library(tidyverse)
library(fs)
library(here)
library(furrr)
library(future)
library(doParallel)
library(arrow)
source(here::here("code", "utils.R"))
source(here::here("code", "utils_simulation.R"))

## Data ----
# 18x18 (POLYMOD, revised to US estimates; Prem et al, PLOS Comp Bio 2021)
contact_matrix <- utils::read.csv(here::here("data", "prem2021_v2.csv"), header = FALSE)

## CONSTANTS ----
N_CORE <- 20
VERBOSE <- TRUE
FORCE_REFRESH <- FALSE

## Run static importation ----
## Create a grid to parallelize over
##
## Run the simulation in batches of 100 sims each, aggregating up to the state
## and only saving the national results.
param_grid <- tidyr::expand_grid(
    st_abb = "US",
    pathogen = "diphtheria_novrt",
    batch = 1:10,
    coverage = c(1, .5, 1.1) # return_vaccine_coverage(all = TRUE)
) |>
    dplyr::mutate(f_path = here::here(
        "supp_analyses",
        "diphtheria_novrt_static",
        ifelse(
            coverage < 0,
            sprintf("vaccine_coverage_fixed%03d", round(coverage * -100)),
            sprintf("vaccine_coverage_%03d", round(coverage * 100))
        ),
        sprintf(
            ifelse(
                coverage < 0,
                "%s_coverage_fixed%03d_%s_batch%02d.parquet",
                "%s_coverage%03d_%s_batch%02d.parquet"
            ),
            pathogen,
            ifelse(coverage < 0, round(coverage * -100), round(coverage * 100)),
            st_abb,
            batch
        )
    )) |>
    dplyr::arrange(batch, pathogen)

for (i in 1:NROW(param_grid)) {
    pathogen_x <- param_grid$pathogen[i]
    f_path <- param_grid$f_path[i]
    batch_x <- param_grid$batch[i]
    coverage_x <- param_grid$coverage[i]

    if (fs::file_exists(f_path)) {
        next
    }

    ## Hold sets of 20 simulations in mini-batches of 5, then save all 100.
    holder <- vector("list", 5)

    ## Run a single simulation across all states
    future::plan(future::multisession, workers = N_CORE)
    for (j in 0:4) {
        if (VERBOSE) {
            print(sprintf(
                "Processing %s at %s (%s of %s; %s)",
                pathogen_x,
                coverage_x,
                j + 1,
                5,
                round(Sys.time())
            ))
        }

        state_level_simulation <- furrr::future_map_dfr(
            .options = furrr::furrr_options(seed = TRUE),
            .x = c("DC", datasets::state.abb),
            .f = ~ {
                state_x <- .x

                if (coverage_x >= 0) {
                    target_coverage_x <- return_current_vaccination(state_x, "diphtheria") *
                        coverage_x
                } else {
                    target_coverage_x <- -1 * coverage_x
                }

                pathogen_params <- return_pathogen_params(
                    state_abbrev = state_x,
                    pathogen_x = pathogen_x
                )

                ## Run the simulation in a batch of 20
                temp_x <- purrr::map_dfr(
                    .x = 1:20,
                    .f = ~ {
                        simulate_outbreak(
                            pathogen_x = pathogen_x,
                            R0 = pathogen_params$R0,
                            gamma = pathogen_params$gamma,
                            sigma = pathogen_params$sigma,
                            lambda_import = pathogen_params$lambda_import,
                            initial_immune = return_initial_immunity(state_x, pathogen_x = "diphtheria"),
                            contact_matrix_load = contact_matrix,
                            birth_rate = return_birth_rate(state_x) / 365,
                            age_population = return_age_structure(state_x),
                            age_specific_mu_rate = return_death_rate(state_x) / 365,
                            target_coverage = target_coverage_x,
                            vaccine_efficacy = pathogen_params$vaccine_efficacy,
                            transmission_reduction = pathogen_params$transmission_reduction,
                            static_importation = TRUE,
                            import_by_population = FALSE,
                            days = 365 * 25,
                            return_all = FALSE
                        ) |>
                            dplyr::mutate(simulation = .x)
                    }
                )

                ## Trim time series by taking every other step
                temp_x <- temp_x |>
                    dplyr::filter(time %% 2 == 0 | time == 1)

                ## Add meta data
                temp_x |>
                    dplyr::mutate(
                        batch = batch_x,
                        simulation = simulation + (j * 20),
                        pathogen = pathogen_x,
                        state = "US",
                        vaccine_coverage = coverage_x
                    )
            }
        )

        ## Summarize across states
        holder[[(j + 1)]] <- state_level_simulation |>
            dplyr::group_by(
                batch,
                simulation,
                pathogen,
                state,
                vaccine_coverage,
                time
            ) |>
            dplyr::summarize(dplyr::across(susceptible:cume_imported_infectious, sum),
                .groups = "drop"
            )
    }

    ## Close out
    future::plan(future::sequential())
    doParallel::stopImplicitCluster()
    closeAllConnections()

    ## Rearrange and recast as int (small space savings)
    holder <- holder |>
        dplyr::bind_rows() |>
        dplyr::select(
            batch,
            simulation,
            vaccine_coverage,
            pathogen,
            state,
            dplyr::everything()
        ) |>
        dplyr::mutate(dplyr::across(!dplyr::any_of(
            c("vaccine_coverage", "pathogen", "state")
        ), as.integer))

    ## Parquet files are larger but can be queried on disk. I think here
    ## we prefer the speed we get from on disk querying over the file
    ## size savings from a compressed RDS.
    fs::dir_create(dirname(f_path))
    arrow::write_parquet(
        holder,
        f_path,
        use_dictionary = TRUE,
        write_statistics = TRUE,
        compression = "gzip",
        compression_level = 9
    )
    rm(holder)
}

# Summarize ----
## Imports ----
library(tidyverse)
library(fs)
library(here)
library(arrow)
source(here::here("code", "utils.R"))

## CONSTANTS ----
FORCE_REFRESH <- FALSE
WINSORIZE <- .96
WINSOR_LOWER <- (1 - WINSORIZE) / 2
WINSOR_UPPER <-  1 - WINSOR_LOWER

## Summarize alternative importation results ----
summary_f_path <- here::here(
    "supp_analyses",
    "diphtheria_novrt_static_summary.parquet"
)

if (!fs::file_exists(summary_f_path) | FORCE_REFRESH) {
    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    sql_cmd <- "read_parquet('supp_analyses/diphtheria_novrt_static/**/*.parquet')"

    ## Subset and filter
    temp_x <- dplyr::tbl(con, sql_cmd) |>
        dplyr::select(dplyr::any_of(
            c(
                "batch",
                "simulation",
                "vaccine_coverage",
                "pathogen",
                "state",
                "age_group",
                "time",
                "new_infectious",
                "cume_new_infectious",
                "cume_imported_infectious"
            )
        )) |>
        dplyr::filter(time %% 2 == 0 | time == 1)

    temp_x <- temp_x |>
        dplyr::group_by(
            batch,
            simulation,
            vaccine_coverage,
            state,
            pathogen,
            time
        ) |>
        dplyr::summarize(
            new_infectious = sum(new_infectious),
            cume_new_infectious = sum(cume_new_infectious),
            cume_imported_infectious = sum(cume_imported_infectious),
            .groups = "drop"
        ) |>
        dplyr::collect()
    duckdb::dbDisconnect(con)

    ## Reshape and summarize
    summary_x <- temp_x |>
        tidyr::pivot_longer(
            cols = c(
                new_infectious,
                cume_new_infectious,
                cume_imported_infectious
            ),
            names_to = "metric"
        ) |>
        dplyr::group_by(pathogen, vaccine_coverage, state, metric, time) |>
        dplyr::summarize(
            mean = mean(value),
            sd = stats::sd(value),
            median = stats::median(value),
            p025 = stats::quantile(value, .025),
            p250 = stats::quantile(value, .250),
            p750 = stats::quantile(value, .750),
            p975 = stats::quantile(value, .975),
            .groups = "drop"
        ) |>
        dplyr::collect()

    winsorized_x <- temp_x |>
        dplyr::group_by(pathogen, state, vaccine_coverage, time) |>
        dplyr::mutate(
            new_infectious = ifelse(new_infectious >
                stats::quantile(new_infectious, WINSOR_UPPER),
            stats::quantile(new_infectious, WINSOR_UPPER),
            new_infectious
            ),
            new_infectious = ifelse(new_infectious <
                stats::quantile(new_infectious, WINSOR_LOWER),
            stats::quantile(new_infectious, WINSOR_LOWER),
            new_infectious
            ),
            cume_new_infectious = ifelse(cume_new_infectious >
                stats::quantile(cume_new_infectious, WINSOR_UPPER),
            stats::quantile(cume_new_infectious, WINSOR_UPPER),
            cume_new_infectious
            ),
            cume_new_infectious = ifelse(cume_new_infectious <
                stats::quantile(cume_new_infectious, WINSOR_LOWER),
            stats::quantile(cume_new_infectious, WINSOR_LOWER),
            cume_new_infectious
            ),
            cume_imported_infectious = ifelse(cume_imported_infectious >
                stats::quantile(cume_imported_infectious, WINSOR_UPPER),
            stats::quantile(cume_imported_infectious, WINSOR_UPPER),
            cume_imported_infectious
            ),
            cume_imported_infectious = ifelse(cume_imported_infectious <
                stats::quantile(cume_imported_infectious, WINSOR_LOWER),
            stats::quantile(cume_imported_infectious, WINSOR_LOWER),
            cume_imported_infectious
            )
        ) |>
        dplyr::ungroup() |>
        tidyr::pivot_longer(
            cols = c(
                new_infectious,
                cume_new_infectious,
                cume_imported_infectious
            ),
            names_to = "metric"
        ) |>
        dplyr::group_by(pathogen, vaccine_coverage, state, metric, time) |>
        dplyr::summarize(
            winsorized_mean = mean(value),
            winsorized_sd = stats::sd(value),
            winsorized_median = stats::median(value),
            winsorized_p025 = stats::quantile(value, .025),
            winsorized_p250 = stats::quantile(value, .250),
            winsorized_p750 = stats::quantile(value, .750),
            winsorized_p975 = stats::quantile(value, .975),
            .groups = "drop"
        )

    rm(temp_x, con)

    temp_x <- summary_x |>
        dplyr::left_join(winsorized_x) |>
        dplyr::arrange(pathogen, state, metric, vaccine_coverage, time)

    fs::dir_create(dirname(summary_f_path))
    arrow::write_parquet(
        temp_x,
        summary_f_path,
        use_dictionary = TRUE,
        write_statistics = TRUE,
        compression = "gzip",
        compression_level = 9
    )
}

# Plot ----

## Imports ----
library(tidyverse)
library(fs)
library(here)
library(arrow)
library(ggsci)
source(here::here("code", "mk_nytimes.R"))
source(here::here("code", "utils.R"))

## Plot comparison ----
## Data
con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
supp_result <- dplyr::tbl(con, "read_parquet('supp_analyses/diphtheria_novrt_static_summary.parquet')") |>
    dplyr::filter(
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        state == "US",
        vaccine_coverage >= .5
    ) |>
    dplyr::collect()

us_final <- pull_summary_data(
    state_x = "US",
    time_max = 365 * 30
) |>
    dplyr::filter(
        pathogen == "diphtheria",
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        vaccine_coverage >= .5
    )

### Combine ----
combined_df <- dplyr::bind_rows(
    us_final |>
        dplyr::transmute(pathogen, vaccine_coverage, state, mean = winsorized_mean, p025, p975, result = "primary"),
    supp_result |>
        dplyr::transmute(pathogen, vaccine_coverage, state, mean = winsorized_mean, p025, p975, result = "no_vrt")
) |>
    categorize_vaccine_coverage() |>
    categorize_pathogens() |>
    dplyr::mutate(result_cat = factor(result,
        levels = c("no_vrt", "primary"),
        labels = c("No vaccine-reduced\ntransmission (static)", "Primary result"),
        ordered = TRUE
    )) |>
    dplyr::arrange(pathogen_cat, vaccine_coverage_cat) |>
    dplyr::mutate(vaccine_coverage =
        dplyr::case_when(result == "no_vrt" ~ vaccine_coverage - .01,
            result == "primary" ~ vaccine_coverage + .01))

p1 <- ggplot2::ggplot(
    combined_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = mean,
        ymin = p025,
        ymax = p975,
        group = result_cat,
        color = result_cat,
        shape = result_cat,
        alpha = result_cat
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^8,
        fill = "gray",
        alpha = .25
    ) +
    ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of\nincident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^(0:8),
        expand = c(0, 0)
    ) +
    ggsci::scale_color_jama(name = "Result type") +
    ggplot2::scale_shape_manual(name = "Result type", values = c(17, 16)) +
    ggplot2::scale_alpha_manual(name = "Result type", values = c(1, .25)) +
    mk_nytimes(
        panel.grid.major.x = ggplot2::element_blank(),
        legend.position = "right",
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
    ))

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS99_diphtheria_novrt_comparison.pdf"),
    p1,
    width = 6,
    height = 3,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
