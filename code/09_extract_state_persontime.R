## 09_extract_state_persontime.R ----
##
## Some results need to be normalized by the person-time in each state. This
## file extracts the person time from 1000 simulations to get the average
## (and distribution) of person time for each state.

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
FORCE_REFRESH <- FALSE

## Simulated person-time ----
## NOTE: We want person-time as a denominator but it needs to incorporate
## the assumptions of our models (i.e., state-specific birth and state- and
## age-specific mortality rates). Here, we just pull one set of 1000
## simulations to get the average total person time (in the 25 year period)
## for each state. Since this only uses births and deaths, any pathogen
## or vaccination scenario will be fine.
if (!fs::file_exists(here::here("data", "state_persontime.RDS")) |
    FORCE_REFRESH) {
    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    state_total_py <- dplyr::tbl(con, "read_parquet('simulations/measles/**/*.parquet')") |>
        dplyr::filter(vaccine_coverage == 1, pathogen == "measles", time <= 365 * 25) |>
        dplyr::select(
            state,
            susceptible,
            exposed,
            infectious,
            recovered,
            vrt_vaccinated,
            time,
            batch,
            simulation
        ) |>
        dplyr::group_by(state) |>
        dplyr::summarize(
            total_pt = sum(susceptible + exposed + infectious + recovered - vrt_vaccinated),
            total_time_obs = dplyr::n_distinct(time),
            total_sims = dplyr::n_distinct(batch, simulation)
        ) |>
        dplyr::collect()

    duckdb::dbDisconnect(con)

    state_total_py <- state_total_py |>
        dplyr::mutate(person_years_25 = total_pt / total_sims / total_time_obs * 25) |>
        dplyr::arrange(state)

    saveRDS(
        state_total_py,
        here::here("data", "state_persontime.RDS"),
        compress = "xz"
    )
}
