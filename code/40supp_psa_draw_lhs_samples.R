## Imports ----
library(tidyverse)
library(fs)
library(here)
library(furrr)
library(future)
library(doParallel)
library(arrow)
library(lhs)
source(here::here("code", "utils.R"))

## Get latin hypercube samples ----
## We are going to vary three key parameters:
##  1. R0, the basic reproduction number
##  2. lambda_import, the rate of pathogen importation
##  3. initial_immune, the initial age-specific immunity level
##
## initial_immune is age-specific and in our scenario, we have 18 age bins so
## we're going to draw 18 values per simulation (one for each age group) in
## addition to two values for R0 and lambda_import for a total of 20 values
## (columns) and 1000 LHS samples (rows).
##
## In addition, for polio and diphtheria, we will vary the vaccination 
## reduction factor.
##
## NOTE: We set a seed to ensure reproducibility, but the seed doesn't ensure
## the same random samples across different OS'es (or R versions or even
## the same computer and R version but different RNG settings). So we draw
## the LHS samples once and save them to disk — reusing the saved file only.
if (!fs::file_exists(here::here("data", "latin_hypercube_samples.RDS"))) {
    ## Get matrices of untransformed LHS samples
    lhs_samples <- vector("list", 4)
    set.seed(1701)
    for (p in c("diphtheria", "measles", "polio", "rubella")) {
        if (p %in% c("polio", "diphtheria")) {
            temp_x <- lhs::randomLHS(n = 1000, k = 21)
            colnames(temp_x) <- c(
                "R0",
                "lambda_import",
                paste0("initial_immune_agegroup", 1:18),
                "transmission_reduction"
            )
        } else {
            temp_x <- lhs::randomLHS(n = 1000, k = 20)
            colnames(temp_x) <- c("R0",
                "lambda_import",
                paste0("initial_immune_agegroup", 1:18))
        }
        lhs_samples[[p]] <- temp_x |>
            dplyr::as_tibble() |>
            dplyr::mutate(
                lhs_sample_id = 1:dplyr::n(),
                batch = lhs_sample_id %% 50 + 1,
                draw_type = "untransformed",
                pathogen = p,
                .before = 1
            )
    }
    lhs_samples <- lhs_samples |>
        dplyr::bind_rows() |>
        dplyr::arrange(pathogen, batch, lhs_sample_id)

    saveRDS(lhs_samples,
        here::here("data", "lhs_untransformed.RDS"),
        compress = "xz")
} else {
    lhs_samples <- readRDS(here::here("data", "lhs_untransformed.RDS"))
}

## Convert LHS into transformed values for whole US ----
## To allow for clearer interpretation of the PCC, we transform the state-
## specific LHS samples into population weighted averages (again only for
## the parameters that vary by state). 
if (!fs::file_exists(here::here("data", "lhs_transformed.RDS"))) {
    transformed_lhs <- lhs_samples |>
        dplyr::mutate(draw_type = "transformed")

    for (i in 1:NROW(lhs_samples)) {
        pathogen_x <- lhs_samples$pathogen[i]
        R0_x <- lhs_samples$R0[i]
        lambda_import_x <- lhs_samples$lambda_import[i]
        transmission_reduction_x <- lhs_samples$transmission_reduction[i]
        initial_immunity_x <- lhs_samples |>
            dplyr::select(dplyr::starts_with("initial_immune_agegroup")) |>
            dplyr::slice(i) |>
            unlist() |>
            unname()

        ## Get new pathogen parameters
        pathogen_params <- return_pathogen_params("US", pathogen_x = pathogen_x)

        ## Get transformed R0
        new_R0 <- stats::qnorm(p = R0_x,
            mean = pathogen_params$R0,
            sd = pathogen_params$R0_sd)
        new_R0 <- max(new_R0, 0)
        transformed_lhs$R0[i] <- new_R0

        ## Get transformed lambda import
        new_lambda_import <- stats::qnorm(
            p = lambda_import_x,
            mean = pathogen_params$lambda_import,
            sd = pathogen_params$lambda_import_sd
        )
        new_lambda_import <- max(new_lambda_import, 0)
        transformed_lhs$lambda_import[i] <- new_lambda_import

        ## Get transformed initial immunity vector
        new_initial_immunity <- stats::qnorm(
            p = initial_immunity_x,
            mean = return_initial_immunity("US", pathogen_x = pathogen_x),
            sd = pathogen_params$initial_immune_sd
        )
        age_start <- which(names(transformed_lhs) == "initial_immune_agegroup1")
        age_end <- which(names(transformed_lhs) == "initial_immune_agegroup18")
        new_initial_immunity <- pmin(new_initial_immunity, 1)
        transformed_lhs[i, age_start:age_end] <- as.list(new_initial_immunity)

        ## Get new vaccine reduction factor
        if (pathogen_x %in% c("polio", "diphtheria")) {
            new_transmission_reduction <- stats::qnorm(
                p = transmission_reduction_x,
                mean = pathogen_params$transmission_reduction,
                sd = pathogen_params$transmission_reduction_sd
            )
            new_transmission_reduction <- min(new_transmission_reduction, 1)
        } else {
            new_transmission_reduction <- NA
        }
        transformed_lhs$transmission_reduction[i] <- new_transmission_reduction
    }

    saveRDS(transformed_lhs,
        here::here("data", "lhs_transformed.RDS"),
        compress = "xz")
}
