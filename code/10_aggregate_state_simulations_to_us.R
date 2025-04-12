## 10_aggregate_state_simulations_to_us.R ----
##
## We model each state independently. To get the national results, we sum up
## each state. Note that this script (basically) generates a US set of
## simulations by taking each individual simulation across all states and
## aggregating up. So Batch 1, Simulation 1 is opened for each state, summed
## up, and then saved as Batch 1, Simulation 1 for the US. Resulting in 2,000
## US-level simulations.

## Imports ----
library(tidyverse)
library(here)
library(fs)
library(arrow)
library(duckdb)
source(here::here("code", "utils.R"))

## Constants ----
VERBOSE <- TRUE

## Get a list of all relevant directories ----
dir_grid <- tidyr::expand_grid(
    dir_path = fs::dir_ls(
        here::here("simulations"),
        recurse = TRUE,
        type = "directory",
        regexp = "vaccine_coverage"
    ),
    regexp = sprintf(".\\_batch%02d\\.parquet", c(1:20))
)

## For each directory, aggregate states by batches ----
## Note this only runs when (1) we haven't already done this and (2) when
## any given scenario and batch has all 51 states already processed.
for (i in 1:NROW(dir_grid)) {
    ## Make new constants
    d_path <- dir_grid$dir_path[i]
    reg_x <- dir_grid$regexp[i]
    f_paths <- fs::dir_ls(d_path, regexp = reg_x, type = "file")

    ## Target file path
    us_path <- gsub("\\_CA\\_", "_US_", f_paths[grepl("\\_CA\\_", f_paths)])

    ## Make sure it hasn't been done and we have all states
    if (!fs::file_exists(us_path) && NROW(f_paths) == 51) {
        if (VERBOSE) {
            print(sprintf(
                "Processing %s (%s; %s)",
                basename(us_path),
                i,
                round(Sys.time())
            ))
        }

        ## Read in the parquet files of only this scenario/batch
        sql_cmd <- sprintf(
            "read_parquet([%s])",
            paste0("'", f_paths, "'", collapse = ",")
        )

        con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)

        ## Extract pathogen for conditional later
        pathogen_x <- dplyr::tbl(con, sql_cmd) |>
            dplyr::select(pathogen) |>
            dplyr::distinct() |>
            dplyr::collect() |>
            as.character()

        temp_x <- dplyr::tbl(con, sql_cmd) |>
            dplyr::mutate(state = "US") |>
            dplyr::group_by(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                state,
                time,
                age_group
            )

        temp_x <- temp_x |>
            dplyr::summarize(dplyr::across(susceptible:cume_imported_infectious, sum),
                .groups = "drop"
            ) |>
            dplyr::collect()

        duckdb::dbDisconnect(con)

        ## Recast
        temp_x <- temp_x |>
            dplyr::mutate(dplyr::across(!dplyr::any_of(
                c("vaccine_coverage", "pathogen", "state")
            ), as.integer)) |>
            dplyr::arrange(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                state,
                age_group,
                time
            )

        ## Save with same format as the state files
        arrow::write_parquet(
            temp_x,
            us_path,
            use_dictionary = TRUE,
            write_statistics = TRUE,
            compression = "gzip",
            compression_level = 9
        )

        rm(temp_x)
        gc()
    }
}
