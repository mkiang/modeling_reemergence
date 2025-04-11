## Imports ----
library(tidyverse)
library(here)
library(fs)
library(duckdb)
library(arrow)
# library(sensitivity)
library(doParallel)
library(foreach)
source(here::here("code", "utils.R"))
source(here::here("code", "48supp_pcc_code.R"))

## CONSTANTS ----
N_CORES <- 20
FORCE_REFRESH <- FALSE

## Check progress of simulations ----
con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
SQL_CMD <- "read_parquet('supp_analyses/probabilistic_sensitivity_analysis/**/*.parquet')"

## Data ----
lhs_df <- readRDS(here::here("data", "lhs_transformed.RDS"))

## Partial rank correlation coefficient ----
## Here we do the PRCC on the mean cumulative new infectious at 25 years
### Get US PSA simulations ----
us_psa <-  dplyr::tbl(con, SQL_CMD) |>
    dplyr::filter(time == 365 * 25, state == "US") |>
    dplyr::group_by(lhs_sample_ix, pathogen, state, vaccine_coverage) |>
    dplyr::summarize(
        n_sims_total = dplyr::n(),
        cume_new_infectious = mean(cume_new_infectious),
        .groups = "drop"
    ) |>
    dplyr::arrange(state, pathogen, vaccine_coverage, lhs_sample_ix) |>
    dplyr::collect() |>
    dplyr::filter(vaccine_coverage >= 0)
duckdb::dbDisconnect(con)

## For each pathogen, state, and vaccine coverage, run PRCC
param_grid <- us_psa |>
    dplyr::select(pathogen, state, vaccine_coverage) |>
    dplyr::distinct() |>
    dplyr::arrange(state, pathogen, vaccine_coverage)

if (!fs::file_exists(here::here("data", "psa_pcc_results.RDS")) | FORCE_REFRESH) {
    doParallel::registerDoParallel(cores = N_CORES)
    holder <- foreach::foreach(i = 1:NROW(param_grid), .inorder = FALSE) %dopar% {
        pathogen_x <- param_grid$pathogen[i]
        state_x <- param_grid$state[i]
        vaccine_x <- param_grid$vaccine_coverage[i]

        pcc_df <- us_psa |>
            dplyr::filter(
                pathogen == pathogen_x,
                state == state_x,
                vaccine_coverage == vaccine_x
            ) |>
            dplyr::left_join(
                lhs_df |>
                    dplyr::filter(pathogen == pathogen_x) |>
                    dplyr::rename(lhs_sample_ix = lhs_sample_id),
                by = c("lhs_sample_ix", "pathogen")
            )

        if (pathogen_x %in% c("polio", "diphtheria")) {
            pcc_x <- pcc_df |>
                dplyr::select(R0:transmission_reduction)
        } else {
            pcc_x <- pcc_df |>
                dplyr::select(R0:initial_immune_agegroup18)
        }

        pcc_y <- pcc_df$cume_new_infectious

        pcc_result <- pcc(pcc_x,
            pcc_y,
            rank = TRUE,
            conf = .95,
            nboot = 1000)

        res <- pcc_result$PRCC |>
            dplyr::as_tibble() |>
            dplyr::transmute(
                parameter = rownames(pcc_result$PRCC),
                estimate = original,
                se = `std. error`,
                lower = `min. c.i.`,
                upper = `max. c.i.`
            ) |>
            dplyr::mutate(
                pathogen = pathogen_x,
                state = state_x,
                vaccine_coverage = vaccine_x,
                .before = 1
            )

        res
    }

    doParallel::stopImplicitCluster()
    closeAllConnections()

    saveRDS(
        dplyr::bind_rows(holder),
        here::here("data", "psa_pcc_results.RDS"),
        compress = "xz"
    )
}
