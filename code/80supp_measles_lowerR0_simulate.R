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
    pathogen = "measles",
    r0 = c(10, 11, 13),
    batch = 1:10,
    coverage = c(.9, .95, 1, 1.05, 1.1)
) |>
    dplyr::mutate(f_path = here::here(
        "supp_analyses",
        "measles_lowerR0",
        ifelse(
            coverage < 0,
            sprintf("vaccine_coverage_fixed%03d", round(coverage * -100)),
            sprintf("vaccine_coverage_%03d", round(coverage * 100))
        ),
        sprintf(
            ifelse(
                coverage < 0,
                "R0_%02d_coverage_fixed%03d_%s_batch%02d.parquet",
                "R0_%02d_coverage%03d_%s_batch%02d.parquet"
            ),
            r0,
            ifelse(coverage < 0, round(coverage * -100), round(coverage * 100)),
            st_abb,
            batch
        )
    )) |>
    dplyr::arrange(batch, pathogen, r0)

for (i in 1:NROW(param_grid)) {
    pathogen_x <- param_grid$pathogen[i]
    r0_x <- param_grid$r0[i]
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
                r0_x,
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
                    target_coverage_x <- return_current_vaccination(state_x, "measles") *
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
                            R0 = r0_x,
                            gamma = pathogen_params$gamma,
                            sigma = pathogen_params$sigma,
                            lambda_import = pathogen_params$lambda_import,
                            initial_immune = return_initial_immunity(state_x, pathogen_x = "measles"),
                            contact_matrix_load = contact_matrix,
                            birth_rate = return_birth_rate(state_x) / 365,
                            age_population = return_age_structure(state_x),
                            age_specific_mu_rate = return_death_rate(state_x) / 365,
                            target_coverage = target_coverage_x,
                            vaccine_efficacy = pathogen_params$vaccine_efficacy,
                            transmission_reduction = pathogen_params$transmission_reduction,
                            static_importation = FALSE,
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
                        r0 = r0_x,
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
                r0,
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
            r0,
            state,
            dplyr::everything()
        ) |>
        dplyr::mutate(dplyr::across(!dplyr::any_of(
            c("vaccine_coverage", "pathogen", "state", "r0")
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
