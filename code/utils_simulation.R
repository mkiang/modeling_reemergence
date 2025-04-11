## Imports ----
library(tidyverse)
library(here)
library(future)
library(furrr)
source(here::here("code", "utils.R"))

#' Simulate a single epidemic outbreak
#'
#' NOTE: The original version of this code was drafted by Nathan Lo (NCL) on
#' 12/18/24 with input from ChatGPT. The code has been substantially edited
#' and revised by both NCL and Mathew Kiang (MVK) since then. The final code
#' has been reviewed, test, and verified by both NCL and MVK. NCL and MVK take
#' full responsibility for the final code.
#'
#' @param R0 basic reproductive number
#' @param gamma recovery rate, based on 1/average infectious duration (days)
#' @param sigma progression rate, based on 1 / average latent period (days)
#' @param lambda_import Importation rate (cases per day)
#' @param initial_immune age-specific proportion of population with immunity
#' @param birth_rate births per person per day
#' @param age_population initial population size in each age bin
#' @param age_specific_mu_rate age-specific death rate per day
#' @param contact_matrix_load age-specific contact matrix
#' @param pathogen_x pathogen of interest
#' @param target_coverage target vaccine coverage
#' @param vaccine_efficacy vaccine efficacy at birth (all or nothing protection)
#' @param transmission_reduction reduction in transmission due to vaccination
#' @param static_importation keep importation rate constant
#' @param import_by_population distribute imported cases by population size
#' @param days length of the simulation in days (default: 365 * 25)
#' @param return_all return age-specific results (default: FALSE)
#'
#' @return a dataframe with the number of people in all compartments at each
#' time step, with two additional columns for new infections and cumulative
#' new infections. When `return_all=TRUE`, returns age-specific results.
simulate_outbreak <- function(R0,
                              gamma,
                              sigma,
                              lambda_import,
                              initial_immune,
                              birth_rate,
                              age_population,
                              age_specific_mu_rate,
                              contact_matrix_load,
                              pathogen_x,
                              target_coverage,
                              vaccine_efficacy,
                              transmission_reduction,
                              static_importation,
                              import_by_population,
                              days = 365 * 25,
                              return_all = FALSE) {
    ## Constants
    beta_start <- R0 * gamma
    aging_fraction <- 1 / (5 * 12) # Monthly aging for compartments
    age_bins <- seq(0, 85, 5)
    N_AGES <- NROW(age_bins)

    # Vaccination parameters
    # NOTE: For polio and diphtheria, we assume 100% seroconversion
    # so perfect vaccine efficacy at any given coverage, but each have
    # reduced transmission due to vaccination
    effective_coverage <- min(target_coverage, 1) * vaccine_efficacy

    # Exponential movement rate for 5-year compartment with daily time step
    # (only used when effective coverage > 0 and only for first age bin)
    aging_rate <- 1 / (5 * 365)

    ## Age params
    age_distribution <- age_population / sum(age_population)
    age_specific_mu <- 1 - exp(-age_specific_mu_rate)

    # Calculate contact matrix
    contact_matrix <- as.matrix(t(contact_matrix_load))
    # Compute next generation matrix
    G_trial <- beta_start / gamma * t(contact_matrix_load)
    # Calculate dominant eigenvalue of the trial matrix
    lambda_max_trial <- max(Re(eigen(G_trial)$values))
    # Scale beta to match desired R0, to account for mixing matrix
    beta <- beta_start * (R0 / lambda_max_trial)

    # Initialize compartments for each age group
    S <- as.integer((1 - initial_immune) * age_population)
    E <- rep(0, N_AGES)
    I <- rep(0, N_AGES)
    R <- as.integer(initial_immune * age_population)

    # Results storage containers
    susceptible <- matrix(0, nrow = days, ncol = N_AGES)
    exposed <- matrix(0, nrow = days, ncol = N_AGES)
    infectious <- matrix(0, nrow = days, ncol = N_AGES)
    recovered <- matrix(0, nrow = days, ncol = N_AGES)
    new_infectious_store <- matrix(0, nrow = days, ncol = N_AGES)
    vrt_store <- matrix(0, nrow = days, ncol = N_AGES)
    imported_store <- matrix(0, nrow = days, ncol = N_AGES)

    # Note that we track vaccination reduced transmission for *all* outcomes
    # but it only changes for polio and diphtheria. For other pathogens, it's
    # always 0. Just makes reassembling the results easier since the output
    # will be consistent.
    VRT_number <- rep(0, N_AGES)
    if (pathogen_x == "polio") {
        # Since IPV roll out in 2000, all seropositive during this
        # period is likely due to IPV vaccination (approx ages 1-25 years)
        VRT_number[1:5] <- R[1:5]
        S[1:5] <- S[1:5] + R[1:5] # Remove IPV protection against infection
        R[1:5] <- R[1:5] - R[1:5] # Should be zero
    }

    if (pathogen_x == "diphtheria") {
        VRT_number <- R
        S <- S + R # Remove protection against infection
        R <- R - R # Should be zero
    }
    
    # Record susceptible fraction at time 0
    susceptible_fraction_t0 <- sum(S) / sum(S + E + I + R)

    # Simulation loop
    for (t in seq.int(days)) {
        # Store results
        susceptible[t, ] <- S
        exposed[t, ] <- E
        infectious[t, ] <- I
        recovered[t, ] <- R
        vrt_store[t, ] <- VRT_number

        # frequency-dependent transmission (age-based mixing)
        current_pop_size <- S + E + I + R
        if (pathogen_x %in% c("polio", "diphtheria")) {
            VRT_coverage <- VRT_number / current_pop_size
            VRT_reduction_transmission <- transmission_reduction * VRT_coverage
            force_of_infection <- beta * (contact_matrix %*% (I * (1 - VRT_reduction_transmission) / current_pop_size))
        } else {
            force_of_infection <- beta * (contact_matrix %*% (I / current_pop_size))
        }

        # Calculate transition probabilities for each age group (from rates)
        p_SE <- 1 - exp(-force_of_infection) # S -> E
        p_EI <- 1 - exp(-sigma) # E -> I
        p_IR <- 1 - exp(-gamma) # I -> R

        # Account for maternal protection factor (6 months of perfect immunity after birth)
        # Based on 6 months, within a 5 year age bin
        # (10% within this age group at protected by maternal immunity)
        maternal_protection_factor <- 0.1
        # Remove subset from S state to account for maternal protection
        S_maternalimmunity <- S
        S_maternalimmunity[1] <- round(S_maternalimmunity[1] *
            (1 - maternal_protection_factor))

        # Stochastic transitions for each age group
        new_exposed <- stats::rbinom(N_AGES, S, p_SE)
        new_infectious <- stats::rbinom(N_AGES, E, p_EI)
        new_recovered <- stats::rbinom(N_AGES, I, p_IR)

        # Importation process
        if (static_importation) {
            lambda_import_t <- lambda_import
        } else {
            susceptible_fraction_t <- sum(S) / sum(S + E + I + R)
            importation_multiplier <- susceptible_fraction_t / susceptible_fraction_t0
            lambda_import_t <- lambda_import * importation_multiplier
        }
        
        prob_weights <- age_distribution
        if (!import_by_population) {
            prob_weights <- (S / (S + E + I + R)) * age_distribution
        }

        import_cases_dt <- stats::rpois(1, lambda_import_t)
        imported_cases_age <- sample(
            x = c(1:N_AGES),
            size = import_cases_dt,
            prob = prob_weights,
            replace = TRUE
        )
        imported_cases <- tabulate(
            factor(imported_cases_age, levels = 1:N_AGES),
            nbins = N_AGES
        )
        imported_store[t, ] <- imported_cases

        # Update compartments
        S <- S - new_exposed
        E <- E + new_exposed - new_infectious
        I <- I + new_infectious - new_recovered + imported_cases
        R <- R + new_recovered

        # count incident cases (including imports)
        new_infectious_store[t, ] <- new_infectious + imported_cases

        # Apply age-specific death rates
        total_deaths <- stats::rbinom(N_AGES, S + E + I + R, age_specific_mu)
        if (sum(total_deaths) > 0) {
            deaths_S <- round((S / (S + E + I + R)) * total_deaths)
            deaths_E <- round((E / (S + E + I + R)) * total_deaths)
            deaths_I <- round((I / (S + E + I + R)) * total_deaths)
            deaths_R <- total_deaths - (deaths_S + deaths_E + deaths_I)
            # Ensure all deaths are distributed

            S <- S - deaths_S
            E <- E - deaths_E
            I <- I - deaths_I
            R <- R - deaths_R
        }

        # Apply births
        if (pathogen_x %in% c("polio", "diphtheria")) {
            births <- stats::rpois(1, sum(S + E + I + R) * birth_rate)
            VRT_number[1] <- VRT_number[1] + round(births * effective_coverage)
            S[1] <- round(S[1] + births)

            ## Make sure VRT number doesn't exceed number of susceptibles
            VRT_number <- pmin(VRT_number, S)
        } else {
            # Births added to the youngest age group
            births <- stats::rpois(1, sum(S + E + I + R) * birth_rate)
            S[1] <- round(S[1] + births * (1 - effective_coverage))
            R[1] <- round(R[1] + births * effective_coverage)
        }

        # Age population progression
        # (individuals age by shifting compartments every month)
        if (t %% 30 == 0) {
            # Perform aging every month
            S_next <- round(S * aging_fraction)
            E_next <- round(E * aging_fraction)
            I_next <- round(I * aging_fraction)
            R_next <- round(R * aging_fraction)

            # Removed aged individuals
            S <- S - c(S_next[-length(S)], 0)
            E <- E - c(E_next[-length(E)], 0)
            I <- I - c(I_next[-length(I)], 0)
            R <- R - c(R_next[-length(R)], 0)

            # Add aged individuals to the next bin
            S <- S + c(0, S_next[-length(S)])
            E <- E + c(0, I_next[-length(E)])
            I <- I + c(0, E_next[-length(I)])
            R <- R + c(0, R_next[-length(R)])

            # Add aging to the IPV vaccine tracker (number of IPV vaccinated persons per age group)
            if (pathogen_x %in% c("polio", "diphtheria")) {
                # Aging of vaccine coverage
                VRT_next <- round(VRT_number * aging_fraction)
                VRT_number <- VRT_number - c(VRT_next[-length(VRT_number)], 0)
                VRT_number <- VRT_number + c(0, VRT_next[-length(VRT_number)])
            }
        }
    }

    ## Remove this here so cumsum() below calculates the right thing
    rm(new_infectious)

    # Create a data frame for plotting
    results <- data.frame(
        time = rep(1:days, each = length(age_bins)),
        age_group = rep(age_bins, times = length(time)),
        susceptible = as.vector(t(susceptible)),
        exposed = as.vector(t(exposed)),
        infectious = as.vector(t(infectious)),
        recovered = as.vector(t(recovered)),
        new_infectious = as.vector(t(new_infectious_store)),
        imported_infectious = as.vector(t(imported_store)),
        vrt_vaccinated = as.vector(t(vrt_store))
    ) |>
        dplyr::group_by(age_group) |>
        dplyr::arrange(age_group, time) |>
        dplyr::mutate(
            cume_new_infectious = cumsum(new_infectious),
            cume_imported_infectious = cumsum(imported_infectious)
        ) |>
        dplyr::ungroup()

    if (return_all) {
        results
    } else {
        results |>
            dplyr::group_by(time) |>
            dplyr::summarize(dplyr::across(susceptible:cume_imported_infectious, sum),
                .groups = "drop"
            )
    }
}
