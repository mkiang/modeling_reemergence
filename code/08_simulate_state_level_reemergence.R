## 08_simulate_state_level_reemergence.R ----
##
## This file runs the primary simulation (see ./code/utils_simulation.R for the
## actual model code) for each state, pathogen, and vaccine coverage scenario.
## Each simulation is run in batches of 100 and repeated 10 times for a total
## of 1000 simulations per state/pathogen/vaccine scenario. The entire
## simulation is saved as a parquet file and can be queried on disk using
## duckdb. As a result, this takes a large amount of disk space (~870 GB).

## Imports ----
library(tidyverse)
library(fs)
library(here)
library(furrr)
library(future)
library(doParallel)
library(doRNG)
library(arrow)
source(here::here("code", "utils.R"))
source(here::here("code", "utils_simulation.R"))

## Data ----
# 18x18 (POLYMOD, revised to US estimates; Prem et al, PLOS Comp Bio 2021)
contact_matrix <- utils::read.csv(here::here("data", "prem2021_v2.csv"), header = FALSE)

## CONSTANTS ----
N_CORE <- 20

## Create a grid to parallelize over ----
##
## Run the simulation in batches of 100 sims each.
##
## NOTE: Positive values of `coverage` reflect a proportion of the current
## level of vaccination. So .75 is 75% of the current level. Negative values
## reflect a fixed level of vaccination. So -.75 is 75% of the population.
param_grid <- analytic_immunity |>
    dplyr::select(st_abb, pathogen) |>
    dplyr::filter(st_abb != "US") |>
    dplyr::distinct() |>
    tidyr::expand_grid(
        batch = 1:20,
        coverage = return_vaccine_coverage(all = TRUE)
    ) |>
    dplyr::mutate(f_path = here::here(
        "simulations",
        pathogen,
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

## Set up parallel processing ----
doParallel::registerDoParallel(N_CORE)
results <- foreach::foreach(i = 1:NROW(param_grid), .inorder = FALSE) %dorng% {
    state_x <- param_grid$st_abb[i]
    pathogen_x <- param_grid$pathogen[i]
    f_path <- param_grid$f_path[i]
    batch_x <- param_grid$batch[i]
    coverage_x <- param_grid$coverage[i]

    if (!fs::file_exists(f_path)) {
        if (coverage_x >= 0) {
            target_coverage_x <- return_current_vaccination(state_x, pathogen_x) *
                coverage_x
        } else {
            target_coverage_x <- -1 * coverage_x
        }

        pathogen_params <- return_pathogen_params(
            state_abbrev = state_x,
            pathogen_x = pathogen_x
        )

        ## Run the simulation in a batch of 100
        holder <- purrr::map_dfr(
            .x = 1:100,
            .f = ~ {
                simulate_outbreak(
                    pathogen_x = pathogen_x,
                    R0 = pathogen_params$R0,
                    gamma = pathogen_params$gamma,
                    sigma = pathogen_params$sigma,
                    lambda_import = pathogen_params$lambda_import,
                    initial_immune = return_initial_immunity(state_x, pathogen_x = pathogen_x),
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
                    return_all = ifelse(pathogen_x == "rubella", TRUE, FALSE)
                ) |>
                    dplyr::mutate(simulation = .x)
            }
        )

        ## Thin time series by taking every other step ----
        ## Need every time step for polio to calculate secondary outcomes
        if (pathogen_x != "polio") {
            holder <- holder |>
                dplyr::filter(time %% 2 == 0 | time == 1)
        }

        ## We only need age groups for 15-44 (CRS calculation) so we can
        ## collapse a bunch of age groups to save space. Note that we add
        ## an (empty) age_group column so all the parquet files have the same
        ## format and shape.
        if (tibble::has_name(holder, "age_group")) {
            holder <- holder |>
                dplyr::mutate(age_group = dplyr::case_when(
                    dplyr::between(age_group, 0, 14) ~ 0,
                    dplyr::between(age_group, 45, 100) ~ 45,
                    TRUE ~ age_group
                ))

            holder <- holder |>
                dplyr::group_by(
                    simulation,
                    time,
                    age_group
                ) |>
                dplyr::summarize(dplyr::across(susceptible:cume_imported_infectious, sum),
                    .groups = "drop"
                )
        } else {
            holder <- holder |>
                dplyr::mutate(age_group = NA_integer_)
        }

        ## Add meta data
        holder <- holder |>
            dplyr::mutate(
                batch = batch_x,
                pathogen = pathogen_x,
                state = state_x,
                vaccine_coverage = coverage_x
            )

        ## Rearrange and recast as int (small space savings)
        holder <- holder |>
            dplyr::select(
                batch,
                simulation,
                pathogen,
                state,
                vaccine_coverage,
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

        ## Clean up
        rm(holder)
        gc()
    } else {
        sprintf("Skipping %s", basename(f_path))
    }
}

## Close out ----
doParallel::stopImplicitCluster()
closeAllConnections()
