## 11_summarize_simulations.R ----
##
## Once we have all state-level simulations and a corresponding set of national
## simulations, this script reads them in using duckdb and summarizes them by
## geogeraphy/pathogen/time/vaccine coverage. The results are saved in
## pathogen-specific parquet files, which are later queried using duckdb.

## Imports ----
library(tidyverse)
library(here)
library(fs)
library(doParallel)
library(foreach)
library(duckdb)
library(arrow)
source(here::here("code", "utils.R"))

## Constants----
## NOTE: You don't need to max out the cores here. duckdb will use as much
## CPU as is available to read in the files and that step takes up the most
## time so undershooting cores allows each core to use >100% CPU to read in
## the files (which is the time-consuming step).
N_CORE <- 16
VERBOSE <- TRUE
FORCE_REFRESH <- FALSE
WINSORIZE <- .96
WINSOR_LOWER <- (1 - WINSORIZE) / 2
WINSOR_UPPER <-  1 - WINSOR_LOWER

## Summarize simulations by state ----
con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
states_grid <- dplyr::tbl(con, "read_parquet('simulations/**/*.parquet')") |>
    dplyr::select(state, vaccine_coverage, batch, simulation) |>
    dplyr::filter(batch == 1, simulation == 1) |>
    dplyr::distinct(state, vaccine_coverage) |>
    dplyr::collect() |>
    dplyr::arrange(state, vaccine_coverage)
duckdb::dbDisconnect(con)

for (p in c("diphtheria", "measles", "polio", "rubella")) {
    f_path <- here::here("summaries", sprintf("%s_summary.parquet", p))

    if (fs::file_exists(f_path) && !FORCE_REFRESH) {
        if (VERBOSE) {
            print(sprintf("Skipping %s", basename(p)))
        }
        next
    } else {
        if (VERBOSE) {
            print(sprintf("Processing %s (%s)", basename(p), round(Sys.time())))
        }
    }

    doParallel::registerDoParallel(cores = N_CORE)
    holder <- foreach::foreach(i = sample(1:NROW(states_grid)), .inorder = FALSE) %dopar% {
        state_x <- states_grid$state[i]
        vaccine_x <- states_grid$vaccine_coverage[i]

        con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
        sql_cmd <- sprintf("read_parquet('simulations/%s/**/*.parquet')", p)

        ## Subset and filter
        ## NOTE: DuckDB has the weirdest bug and if you try to do
        ## vaccine_coverage == .85, it won't return the tibble (??). This is
        ## only true for .85. So using between() gets around this.
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
            dplyr::filter(
                state == state_x,
                dplyr::between(vaccine_coverage,
                    vaccine_x - .01,
                    vaccine_x + .01)
            )

        if (p == "polio") {
            temp_x <- temp_x |>
                dplyr::filter(time %% 2 == 0 | time == 1)
        }

        ## Summarize over age
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

        x <- suppressWarnings(suppressMessages(duckdb::dbDisconnect(con)))

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
            )

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


        rm(con, temp_x, x)
        summary_x |>
            dplyr::left_join(winsorized_x)
    }
    doParallel::stopImplicitCluster()
    closeAllConnections()

    fs::dir_create(dirname(f_path))
    arrow::write_parquet(
        holder |>
            dplyr::bind_rows() |>
            dplyr::arrange(pathogen, state, metric, vaccine_coverage, time),
        f_path,
        use_dictionary = TRUE,
        write_statistics = TRUE,
        compression = "gzip",
        compression_level = 9
    )
}
