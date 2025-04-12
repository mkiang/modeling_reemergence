#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
# Rscript 51supp_psa_run_analysis.R <batch_grid row index>

## WARNING: This takes a very long time. You should only run this if you
## really need to. This script, as written, will run >320 million simulations.
##
## That's 16 vaccine coverage levels per pathogen * 4 pathogens *
## 51 states per simulation set * 100 simulation sets per LHS sample *
## 1000 LHS samples.
##
## In our computational environment, this takes something like ~100,000
## CPU-hours to complete (SLURM batch of 3000 jobs, each with 18 cores, lasting
## an average of ~2 hours per job).

## Imports ----
library(tidyverse)
library(fs)
library(here)
library(furrr)
library(future)
library(doParallel)
library(parallel)
library(arrow)
source(here::here("code", "utils.R"))
source(here::here("code", "utils_simulation.R"))
source(here::here("code", "49supp_utils_probabilistic_sensitivity_analysis.R"))

## CONSTANTS ----
## NOTE: On Stanford cluster, detectCores() doesn't return proper number of
## cores so you'll need to manually set this to 1 less than requested from
## the sbatch file (default is 17 cores, which results in 90% utilization).
PARAM_IX <- as.integer(args[1])
# N_CORES <- ifelse(is.na(PARAM_IX), 20, parallel::detectCores() - 1)
N_CORES <- ifelse(is.na(PARAM_IX), 20, 17)
VERBOSE <- TRUE

## Data ----
# 18x18 (POLYMOD, revised to US estimates; Prem et al, PLOS Comp Bio 2021)
contact_matrix <- utils::read.csv(here::here("data", "prem2021_v2.csv"), header = FALSE)
lhs_samples <- readRDS(here::here("data", "lhs_untransformed.RDS"))

## Create a parameter grid to sweep
row_grid <- analytic_immunity |>
    dplyr::select(pathogen) |>
    dplyr::distinct() |>
    tidyr::expand_grid(
        coverage = return_vaccine_coverage(all = TRUE),
        lhs_row_ix = 1:1000
    ) |>
    dplyr::mutate(batch = lhs_row_ix %% 50 + 1) |>
    dplyr::mutate(f_path = here::here(
        "supp_analyses",
        "probabilistic_sensitivity_analysis",
        pathogen,
        ifelse(
            coverage < 0,
            sprintf("vaccine_coverage_fixed%03d", round(coverage * -100)),
            sprintf("vaccine_coverage_%03d", round(coverage * 100))
        ),
        sprintf(
            ifelse(
                coverage < 0,
                "%s_coverage_fixed%03d_US_batch%02d.parquet",
                "%s_coverage%03d_US_batch%02d.parquet"
            ),
            pathogen,
            ifelse(coverage < 0, round(coverage * -100), round(coverage * 100)),
            batch
        )
    )) |>
    dplyr::arrange(batch, f_path) |>
    dplyr::filter(pathogen %in% c("polio", "diphtheria"))

## Separating out to 20 LHS samples per file (50 files per scenario)
batch_grid <- row_grid |>
    dplyr::select(pathogen, coverage, batch, f_path) |>
    dplyr::distinct() |>
    dplyr::mutate(priority = dplyr::case_when(
        coverage %in% c(1, .5, .75, .9, 1.05) ~ 1,
        coverage %in% c(-.95, 0, .95, .7, 1.1) ~ 2,
        TRUE ~ 3)) |>
    dplyr::arrange(priority, coverage, pathogen, batch) |>
    dplyr::select(-priority)

## If running on SLURM, just subset to the specific job
if (!is.na(PARAM_IX)) {
    batch_grid <- batch_grid |>
        dplyr::slice(PARAM_IX)
}

for (i in 1:NROW(batch_grid)) {
    f_path <- batch_grid$f_path[i]
    if (!fs::file_exists(f_path)) {
        if (VERBOSE) {
            print(sprintf(
                "Processing %i (%s; %s)",
                ifelse(is.na(PARAM_IX), i, PARAM_IX),
                basename(f_path),
                round(Sys.time())
            ))
        }

        pathogen_x <- batch_grid$pathogen[i]
        vaccine_coverage_x <- batch_grid$coverage[i]
        lhs_indices <- row_grid |>
            dplyr::filter(f_path == batch_grid$f_path[i]) |>
            dplyr::pull(lhs_row_ix)

        future::plan(future::multisession(workers = N_CORES))
        holder <- vector("list", NROW(lhs_indices))
        for (j in 1:NROW(holder)) {
            lhs_vector <- lhs_samples |>
                dplyr::filter(
                    pathogen == pathogen_x,
                    lhs_sample_id == lhs_indices[j]
                )

            holder[[j]] <- run_psa_batch(
                lhs_vector,
                n_sims = 100,
                contact_matrix_load = contact_matrix,
                pathogen_x = pathogen_x,
                target_coverage = vaccine_coverage_x
            ) |>
                dplyr::mutate(
                    lhs_sample_ix = lhs_indices[j],
                    vaccine_coverage = vaccine_coverage_x,
                    batch = batch_grid$batch[i]
                )

            ## Progress report - a little more verbose when on cluster
            if ((VERBOSE && (j %% 2 == 0 && j < 20)) |
                (VERBOSE && !is.na(PARAM_IX))) {
                print(sprintf(
                    "   Finished LHS sample %i of %i (%s)",
                    j,
                    NROW(lhs_indices),
                    round(Sys.time())
                ))
            }
        }
        future::plan(future::sequential())
        doParallel::stopImplicitCluster()
        closeAllConnections()

        fs::dir_create(dirname(f_path))

        ## Stanford cluster doesn't support gzip compression
        arrow::write_parquet(
            dplyr::bind_rows(holder),
            f_path,
            use_dictionary = TRUE,
            write_statistics = TRUE,
            compression = "snappy"
            # compression = "gzip",
            # compression_level = 9
        )
        rm(holder)
    }
}
