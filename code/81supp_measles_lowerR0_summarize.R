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
    "measles_lowerR0_summary.parquet"
)

if (!fs::file_exists(summary_f_path) | FORCE_REFRESH) {
    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    sql_cmd <- "read_parquet('supp_analyses/measles_lowerR0/**/*.parquet')"

    ## Subset and filter
    temp_x <- dplyr::tbl(con, sql_cmd) |>
        dplyr::select(dplyr::any_of(
            c(
                "batch",
                "simulation",
                "vaccine_coverage",
                "pathogen",
                "r0",
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
            r0,
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
        dplyr::group_by(pathogen, vaccine_coverage, state, r0, metric, time) |>
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
