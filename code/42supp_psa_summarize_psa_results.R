## Imports ----
library(tidyverse)
library(here)
library(fs)
library(duckdb)
library(arrow)
source(here::here("code", "utils.R"))

## CONSTANTS ----
FORCE_REFRESH <- FALSE
WINSORIZE <- .96
WINSOR_LOWER <- (1 - WINSORIZE) / 2
WINSOR_UPPER <-  1 - WINSOR_LOWER
summary_f_path <- here::here("supp_analyses", "psa_summary.parquet")

## Summarize PSA results ----
if (!fs::file_exists(summary_f_path) | FORCE_REFRESH) {
    
    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    SQL_CMD <- "read_parquet('supp_analyses/probabilistic_sensitivity_analysis/**/*.parquet')"
    
    ## We only need the last time point and we will summarize the 100 batches
    ## using the mean. Then take summary states of the means by LHS sample.
    psa_df <- dplyr::tbl(con, SQL_CMD) |>
        dplyr::filter(time == 365 * 25 | time == 365 * 25 - 1) |>
        dplyr::group_by(lhs_sample_ix, pathogen, state, vaccine_coverage) |>
        dplyr::summarize(
            n_sims_total = dplyr::n(),
            cume_new_infectious = mean(cume_new_infectious),
            .groups = "drop"
        ) |>
        dplyr::group_by(pathogen, state, vaccine_coverage) |>
        dplyr::summarize(
            n_sims_total = sum(n_sims_total),
            n_values = dplyr::n_distinct(lhs_sample_ix),
            mean = mean(cume_new_infectious),
            sd = stats::sd(cume_new_infectious),
            median = stats::median(cume_new_infectious),
            p025 = stats::quantile(cume_new_infectious, .025),
            p250 = stats::quantile(cume_new_infectious, .25),
            p750 = stats::quantile(cume_new_infectious, .75),
            p975 = stats::quantile(cume_new_infectious, .975),
            .groups = "drop"
        ) |>
        dplyr::arrange(state, pathogen, vaccine_coverage) |>
        dplyr::collect() |>
        categorize_vaccine_coverage() |>
        categorize_pathogens()
    
    psa_winsorized <- dplyr::tbl(con, SQL_CMD) |>
        dplyr::filter(time == 365 * 25 | time == 365 * 25 - 1) |>
        dplyr::group_by(pathogen, state, vaccine_coverage) |>
        dplyr::collect() |>
        dplyr::mutate(
            cume_new_infectious = ifelse(cume_new_infectious >
                stats::quantile(cume_new_infectious, WINSOR_UPPER),
            stats::quantile(cume_new_infectious, WINSOR_UPPER),
            cume_new_infectious
            ),
            cume_new_infectious = ifelse(cume_new_infectious <
                stats::quantile(cume_new_infectious, WINSOR_LOWER),
            stats::quantile(cume_new_infectious, WINSOR_LOWER),
            cume_new_infectious
            )
        ) |>
         dplyr::summarize(
            winsorized_mean = mean(cume_new_infectious),
            winsorized_sd = stats::sd(cume_new_infectious),
            winsorized_median = stats::median(cume_new_infectious),
            winsorized_p025 = stats::quantile(cume_new_infectious, .025),
            winsorized_p250 = stats::quantile(cume_new_infectious, .25),
            winsorized_p750 = stats::quantile(cume_new_infectious, .75),
            winsorized_p975 = stats::quantile(cume_new_infectious, .975),
            .groups = "drop"
        ) |>
        dplyr::arrange(state, pathogen, vaccine_coverage) |>
        categorize_vaccine_coverage() |>
        categorize_pathogens()
    
    fs::dir_create(dirname(summary_f_path))
    arrow::write_parquet(
        dplyr::left_join(psa_df, psa_winsorized), 
        summary_f_path,
        use_dictionary = TRUE,
        write_statistics = TRUE,
        compression = "gzip",
        compression_level = 9
    )
}
