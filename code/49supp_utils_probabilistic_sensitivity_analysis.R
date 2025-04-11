#' Run a set of probabilistic sensitivity analysis values
#'
#' Because we want to run PSA across all states to get the national estimates,
#' this will take a single vector of LHS samples and run n_sims simulations
#' for 50 states + DC. Then it will aggregate all states to get the national
#' estimates across each of the n_sims simulations. Results in a large data
#' frame with info we don't need, so we drop all days except what is specified
#' in days_keep.
#'
#' NOTE: You must set up the parallel backend *before* running this function.
#'
#' @param lhs_vector vector of random samples from latin hypercube
#' @param n_sims number of simulations to run *per* LHS sample
#' @param contact_matrix_load contact matrix
#' @param pathogen_x pathogen
#' @param target_coverage vaccination coverage scenario
#' @param vaccine_efficacy vaccine efficacy
#' @param transmission_reduction reduction in transmission from vaccination
#' @param days number of days to run the simulations
#' @param days_keep subset of days to keep for the final output
#'
#' @returns a dataframe with simulations per days_keep/state
run_psa_batch <- function(lhs_vector,
                          n_sims = 100,
                          contact_matrix_load = contact_matrix,
                          pathogen_x,
                          target_coverage,
                          days = 365 * 25,
                          days_keep = c(seq(0, 365 * 25, 365))) {
    ## Get new pathogen parameters (for ones that don't vary by state)
    pathogen_params <- return_pathogen_params("US", pathogen_x = pathogen_x)
    new_R0 <- stats::qnorm(
        p = lhs_vector[["R0"]],
        mean = pathogen_params$R0,
        sd = pathogen_params$R0_sd
    )
    new_R0 <- max(new_R0, 0)

    new_lambda_import <- stats::qnorm(
        p = lhs_vector[["lambda_import"]],
        mean = pathogen_params$lambda_import,
        sd = pathogen_params$lambda_import_sd
    )
    new_lambda_import <- max(new_lambda_import, 0)

    if (pathogen_x %in% c("polio", "diphtheria")) {
        new_transmission_reduction <- stats::qnorm(
            p = lhs_vector[["transmission_reduction"]],
            mean = pathogen_params$transmission_reduction,
            sd = pathogen_params$transmission_reduction_sd
        )
        new_transmission_reduction <- min(new_transmission_reduction, 1)
    } else {
        new_transmission_reduction <- pathogen_params$transmission_reduction
    }

    ## Hold replicates (keeping same pathogen params)
    holder <- furrr::future_map_dfr(
        .x = 1:n_sims,
        .options = furrr::furrr_options(seed = TRUE),
        .f = ~ {
            ## Do this by state so we can get US aggregated measures per simulation
            res <- purrr::map_dfr(
                .x = c(datasets::state.abb, "DC"),
                .f = ~ {
                    if (target_coverage >= 0) {
                        new_target_coverage <- return_current_vaccination(.x, pathogen_x) *
                            target_coverage
                    } else {
                        new_target_coverage <- -1 * target_coverage
                    }

                    new_state_lambda_import <- new_lambda_import * return_state_fraction(.x)

                    new_initial_immunity <- as.vector(
                        stats::qnorm(
                            p = lhs_vector |>
                                dplyr::select(dplyr::starts_with("initial_immune_agegroup")) |>
                                dplyr::slice(1) |>
                                unlist() |>
                                unname(),
                            mean = return_initial_immunity(.x, pathogen_x = pathogen_x),
                            sd = pathogen_params$initial_immune_sd
                        )
                    )
                    new_initial_immunity <- pmin(new_initial_immunity, 1)

                    simulate_outbreak(
                        R0 = new_R0,
                        gamma = pathogen_params$gamma,
                        sigma = pathogen_params$sigma,
                        lambda_import = new_state_lambda_import,
                        initial_immune = new_initial_immunity,
                        birth_rate = return_birth_rate(.x) / 365,
                        age_population = return_age_structure(.x),
                        age_specific_mu_rate = return_death_rate(.x) / 365,
                        contact_matrix_load = contact_matrix_load,
                        pathogen_x = pathogen_x,
                        target_coverage = new_target_coverage,
                        vaccine_efficacy = pathogen_params$vaccine_efficacy,
                        transmission_reduction = new_transmission_reduction,
                        static_importation = FALSE,
                        import_by_population = FALSE,
                        days = days,
                        return_all = FALSE
                    ) |>
                        dplyr::select(time, cume_new_infectious) |>
                        dplyr::mutate(
                            pathogen = pathogen_x,
                            state = .x,
                            .before = 1
                        ) |>
                        dplyr::filter(time %in% days_keep)
                }
            )

            ## Aggregate across states to get US total
            res <- dplyr::bind_rows(
                res,
                res |>
                    dplyr::mutate(state = "US") |>
                    dplyr::group_by(pathogen, state, time) |>
                    dplyr::summarize(
                        cume_new_infectious = sum(cume_new_infectious),
                        .groups = "drop"
                    )
            ) |>
                dplyr::mutate(simulation = .x)

            res
        }
    )
    holder
}
