## Imports ----
library(tidyverse)
library(here)
library(fs)
library(duckdb)
library(arrow)
library(survey)
library(zoo)

## Data used in some helper functions ----
analytic_pop <- readRDS(here::here("data", "analytic_pop.RDS"))
analytic_death <- readRDS(here::here("data", "analytic_death.RDS"))
analytic_birth <- readRDS(here::here("data", "analytic_birth.RDS"))
analytic_immunity <- readRDS(here::here("data", "analytic_vaccine.RDS"))

## Modeling helpers ----

#' Return the vaccine coverage multipliers. Just makes sure we don't miss any.
#'
#' @returns vector of vaccine coverages
return_vaccine_coverage <- function(all = FALSE) {
    if (all) {
        c(-.95, 0, .25, seq(.5, 1.1, .05))
    } else {
        c(0, .5, .75, .9, .95, 1, 1.05)
    }
}

#' Return pathogen parameters.
#'
#' Note the only pathogen parameter that varies by state is the importation
#' rate, which is a function of the state's population.
#'
#' @param state_abbrev state abbreviation ("US" is valid option)
#' @param pathogen_x pathogen of interest
#'
#' @returns a list of pathogen- and state-specific parameters
return_pathogen_params <- function(state_abbrev = "CA",
                                   pathogen_x = "polio") {
    state_fraction <- return_state_fraction(state_abbrev)

    if (pathogen_x == "polio") {
        # Ref (R0): https://pmc.ncbi.nlm.nih.gov/articles/PMC7497282/
        # Ref (infectious duration): https://pubmed.ncbi.nlm.nih.gov/9203713/
        # Ref (latent period): https://www.cdc.gov/pinkbook/hcp/table-of-contents/chapter-18-poliomyelitis.html,
        #   supported by other studies

        lambda_import <- 0.2 / 365 * state_fraction
        list(
            R0 = 4,
            R0_sd = 0.5,
            sigma = 1 / 5,
            gamma = 1 / 21,
            # effectively 4-6 for the 95%
            initial_immune_sd = 0.025,
            # effectively +/- 5% for the 95%
            lambda_import = lambda_import,
            lambda_import_sd = 0.25 * lambda_import,
            vaccine_efficacy = 1,
            transmission_reduction = .9,
            transmission_reduction_sd = .025
        )
    } else if (pathogen_x == "measles") {
        # Ref (R0): https://pubmed.ncbi.nlm.nih.gov/28757186/
        # Ref (infectious duration): www.cdc.gov/measles/hcp/communication-resources/clinical-diagnosis-fact-sheet.html
        # Ref (latent period): http://pmc.ncbi.nlm.nih.gov/articles/PMC3319515
        lambda_import <- 34 / 365 * state_fraction
        list(
            R0 = 12,
            R0_sd = 1,
            gamma = 1 / 8,
            sigma = 1 / 10,
            initial_immune_sd = 0.025,
            lambda_import = lambda_import,
            lambda_import_sd = 0.25 * lambda_import,
            vaccine_efficacy = 0.97
        )
    } else if (pathogen_x == "rubella") {
        # Ref (R0): https://pubmed.ncbi.nlm.nih.gov/35239641/
        # Ref (infectious period): www.cdc.gov/rubella/hcp/clinical-overview/index.html
        # Ref (latent period): www.cdc.gov/rubella/hcp/clinical-overview/index.html
        #   and others, taking lower end given may be infectious before predominant symptom onset
        lambda_import <- 5 / 365 * state_fraction
        list(
            R0 = 4,
            R0_sd = 0.5,
            gamma = 1 / 14,
            sigma = 1 / 12,
            initial_immune_sd = 0.025,
            lambda_import = lambda_import,
            lambda_import_sd = 0.25 * lambda_import,
            vaccine_efficacy = 0.97
        )
    } else if (pathogen_x == "diphtheria") {
        # Ref (R0): https://pmc.ncbi.nlm.nih.gov/articles/PMC7312233/
        # Ref (incubation period): https://pmc.ncbi.nlm.nih.gov/articles/PMC7312233/
        #   https://www.cdc.gov/diphtheria/hcp/clinical-overview/index.html
        # Ref (infectious period): https://www.who.int/publications/m/item/vaccine-preventable-diseases-surveillance-standards-diphtheria
        lambda_import <- 0.2 / 365 * state_fraction
        list(
            R0 = 2.5,
            R0_sd = 0.5,
            gamma = 1 / 14,
            sigma = 1 / 3,
            initial_immune_sd = 0.025,
            lambda_import = lambda_import,
            lambda_import_sd = 0.25 * lambda_import,
            vaccine_efficacy = 1,
            transmission_reduction = .9,
            transmission_reduction_sd = .025
        )
    } else if (pathogen_x == "diphtheria_novrt") {
        # Ref (R0): https://pmc.ncbi.nlm.nih.gov/articles/PMC7312233/
        # Ref (incubation period): https://pmc.ncbi.nlm.nih.gov/articles/PMC7312233/
        #   https://www.cdc.gov/diphtheria/hcp/clinical-overview/index.html
        # Ref (infectious period): https://www.who.int/publications/m/item/vaccine-preventable-diseases-surveillance-standards-diphtheria
        lambda_import <- 0.2 / 365 * state_fraction
        list(
            R0 = 2.5,
            R0_sd = 0.5,
            gamma = 1 / 14,
            sigma = 1 / 3,
            initial_immune_sd = 0.025,
            lambda_import = lambda_import,
            lambda_import_sd = 0.25 * lambda_import,
            vaccine_efficacy = .97
        )
    }
}

#' Return state total population count (for a given year)
#'
#' @param state_abbrev state abbreviation ("US" is valid option)
#' @param year_x default is 2019 (i.e., pre-COVID)
#' @param pop_df a dataframe of state-year population counts
#'
#' @returns a scalar of the state total population in that year
return_state_pop <- function(state_abbrev = "CA",
                             year_x = 2019,
                             pop_df = analytic_pop) {
    pop_df |>
        dplyr::filter(year == year_x, st_abb == state_abbrev) |>
        dplyr::pull(pop) |>
        sum()
}

#' Return state fraction of total US population
#'
#' @param state_abbrev state abbreviation ("US" is valid option)
#' @param year_x default is 2019 (i.e., pre-COVID)
#' @param pop_df a dataframe of state-year population counts
#'
#' @returns a scalar of the fraction of state population relative to the US
return_state_fraction <- function(state_abbrev = "CA",
                                  year_x = 2019,
                                  pop_df = analytic_pop) {
    total_pop <- pop_df |>
        dplyr::filter(st_abb != "US") |>
        dplyr::filter(year == year_x) |>
        dplyr::pull(pop) |>
        sum()

    return_state_pop(state_abbrev, year_x, analytic_pop) / total_pop
}

#' Return state- and age-specific population
#'
#' @param state_abbrev state abbreviation ("US" is valid option)
#' @param year_x default is 2019 (i.e., pre-COVID)
#' @param pop_df a dataframe of state-year population counts
#' @param prop if TRUE, return proportion in each age bin, else return count
#'
#' @returns a vector of state- and age-specific population counts or proportions
return_age_structure <- function(state_abbrev = "CA",
                                 year_x = 2019,
                                 pop_df = analytic_pop,
                                 prop = FALSE) {
    if (prop) {
        age_props <- pop_df |>
            dplyr::filter(year == year_x, st_abb == state_abbrev) |>
            dplyr::pull(pop_prop)

        ## Should always be 1 but just in case
        age_props / sum(age_props)
    } else {
        pop_df |>
            dplyr::filter(year == year_x, st_abb == state_abbrev) |>
            dplyr::pull(pop)
    }
}

#' Return state birth rates
#'
#' @param state_abbrev state abbreviation
#' @param year_x default is 2019 (i.e., pre-COVID)
#' @param birth_df a dataframe of state-year birth rates
#'
#' @returns a scalar of the state birth rate (live births per 1000 population)
return_birth_rate <- function(state_abbrev = "CA",
                              year_x = 2019,
                              birth_df = analytic_birth) {
    birth_df |>
        dplyr::filter(year == year_x, st_abb == state_abbrev) |>
        dplyr::pull(birth_rate)
}

#' Return state- and age-specific death rates for a given year
#'
#' @param state_abbrev state abbreviation
#' @param year_x default is 2019 (i.e., pre-COVID)
#' @param death_df a dataframe of state-year death rates
#'
#' @returns a vector of age- and state-specific deaths per 100,000 population
return_death_rate <- function(state_abbrev = "CA",
                              year_x = 2019,
                              death_df = analytic_death) {
    death_df |>
        dplyr::filter(year == year_x, st_abb == state_abbrev) |>
        dplyr::pull(death_rate)
}

#' Return initial immunity for a given state and pathogen
#'
#' Note that when we have survey data (i.e., NIS data for <25 year olds), we
#' conservatively take the upper bound of the survey estimate.
#'
#' @param state_abbrev state abbreviation
#' @param pathogen_x pathogen of interest
#' @param immunity_df a dataframe of state-pathogen immunity estimates
#'
#' @returns a vector of state- and age-specific immunity estimates
return_initial_immunity <- function(state_abbrev = "CA",
                                    pathogen_x = "polio",
                                    immunity_df = analytic_immunity) {
    immunity_df |>
        dplyr::filter(pathogen == pathogen_x, st_abb == state_abbrev) |>
        dplyr::mutate(immunity = ifelse(is.na(upper), estimate, upper)) |>
        dplyr::pull(immunity)
}

#' Return current vaccination rate
#'
#' Based on survey data, take the average vaccination rate for <25 year olds
#' by state and pathogen
#'
#' @param state_abbrev state abbreviation
#' @param pathogen_x pathogen
#' @param immunity_df a dataframe of state-pathogen immunity estimates
#'
#' @returns a scalar for state- and pathogen-specific vaccination rate
return_current_vaccination <- function(state_abbrev = "CA",
                                       pathogen_x = "polio",
                                       immunity_df = analytic_immunity) {
    immunity_df |>
        dplyr::filter(pathogen == pathogen_x, st_abb == state_abbrev, age <= 20) |>
        dplyr::pull(estimate) |>
        mean()
}

## Endemicity helpers ----
calculate_endemic_timing <- function(cases, pathogen_x) {
    generation_time <- switch(pathogen_x,
        "measles" = 14,
        "rubella" = 17,
        "diphtheria" = 7,
        "polio" = 21
    )

    n <- length(cases)
    r_effective <- numeric(n)

    # Calculate ratio of cases in sliding windows based on generation time
    for (i in (2 * generation_time):n) {
        # Sum of cases in current window
        current <- sum(cases[(i - generation_time + 1):i])
        # Sum of cases in previous window
        previous <- sum(cases[(i - 2 * generation_time + 1):(i - generation_time)])

        if (previous > 0) {
            # R_e = (cases_now / cases_then)
            r_effective[i] <- (current / previous) # crude approximation of R_e by calculating growth rate over subsequent periods
        }
    }

    # Average over week
    week_avg <- tapply(r_effective, (seq_along(r_effective) - 1) %/% 7, mean)
    week_avg <- as.numeric(week_avg)

    # Ensure 52 consecutive weeks are >= 1
    rolling_all <- zoo::rollapply(
        week_avg,
        width = 52,
        FUN = function(x) {
            all(x >= 1)
        },
        align = "right",
        fill = NA
    )
    matches <- which(rolling_all)
    timing <- if (length(matches) > 0) {
        min(matches) * 7
    } else {
        Inf
    }

    return(timing)
}

calculate_above1_timing <- function(cases, pathogen_x) {
    generation_time <- switch(pathogen_x,
        "measles" = 14,
        "rubella" = 17,
        "diphtheria" = 7,
        "polio" = 21
    )

    n <- length(cases)
    above1 <- numeric(n)
    
    for (i in (2 * generation_time):n) {
        # Sum of cases in current window
        above1[i] <- sum(cases[(i - generation_time + 1):i])
    }

    # Average over week
    week_avg <- tapply(above1, (seq_along(above1) - 1) %/% 7, mean)
    week_avg <- as.numeric(week_avg)

    # Ensure 52 consecutive weeks are >= 1
    rolling_all <- zoo::rollapply(
        week_avg,
        width = 52,
        FUN = function(x) {
            all(x >= 1)
        },
        align = "right",
        fill = NA
    )
    matches <- which(rolling_all)
    timing <- if (length(matches) > 0) {
        min(matches) * 7
    } else {
        Inf
    }

    return(timing)
}

#' Return endemic timing
#'
#' Given a raw simulation dataframe (e.g., parquet file) that may contain
#' multiple simulations within a single dataframe (such as a batch of 100),
#' this function runs the calculate_endemic_timing() for each unique simulation
#' and then returns a dataframe summarizing endemic timing for each one.
#'
#' @param raw_simulation_df a dataframe of raw simulations
#'
#' @returns a dataframe with endemic timing for each unique simulation
return_endemic_timing <- function(raw_simulation_df) {
    param_grid <- raw_simulation_df |>
        dplyr::select(batch, simulation, vaccine_coverage, pathogen) |>
        dplyr::distinct() |>
        dplyr::mutate(endemic_timing = NA_real_)

    for (i in 1:NROW(param_grid)) {
        batch_x <- param_grid$batch[i]
        simulation_x <- param_grid$simulation[i]
        vaccine_x <- param_grid$vaccine_coverage[i]
        pathogen_x <- param_grid$pathogen[i]

        endemic_timing <- calculate_endemic_timing(
            raw_simulation_df |>
                dplyr::filter(
                    batch == batch_x,
                    simulation == simulation_x,
                    vaccine_coverage == vaccine_x,
                    pathogen == pathogen_x
                ) |>
                dplyr::pull(new_infectious),
            pathogen_x
        )

        param_grid$endemic_timing[i] <- endemic_timing
    }

    param_grid
}


## I/O helpers ----

#' Source specific lines in an R file
#'
#' Source: Christopher Gandrud via this gist:
#' https://gist.github.com/christophergandrud/1eb4e095974204b12af9
#'
#' @param file character string with the path to the file to source.
#' @param lines numeric vector of lines to source in \code{file}.
source_lines <- function(file, lines) {
    source(textConnection(readLines(file)[lines]))
}

#' Parallelized version of saveRDS
#'
#' Source: https://gist.github.com/ShanSabri/b1bdf0951efa0dfee0edeb5509f87e88
#'
#' @param object object to be saved
#' @param file file path
#' @param threads number of threads (default is total threads - 1)
#'
#' @returns none
saveRDS_xz <- function(object, file, threads = parallel::detectCores() - 1) {
    ## If xz version 5 or higher is installed, parallelize
    if (any(grepl("(XZ Utils) 5.", system("xz -V", intern = TRUE), fixed = TRUE))) {
        con <- pipe(paste0("xz -T", threads, " > ", file), "wb")
        saveRDS(object, file = con)
        close(con)
    } else {
        saveRDS(object, file = file, compress = "xz")
    }
}

## Data helpers ----

### Parquet / simulation helpers ----

#' Check parquet file integrity
#'
#' This project saves a lot of parquet files across a lot of different cores.
#' Sometimes a core is interrupted mid-save which results in a corrupt file.
#' This function checks the integrity of each file by trying to open it and
#' returns a list of files that could not be opened.
#'
#' @param pq_files a list of parquet file paths
#' @param verbose print out progress
#'
#' @returns a vector of parquet file paths that could not be opened
check_parquet_file_integrity <- function(pq_files, verbose = FALSE) {
    bad_files <- c()
    for (i in 1:NROW(pq_files)) {
        f <- pq_files[i]

        if (i %% 100 == 0 && verbose) {
            print(i)
        }

        xx <- suppressMessages(suppressWarnings(tryCatch(
            expr = {
                x <- arrow::open_dataset(f, format = "parquet")
                rm(x)
            },
            quiet = TRUE,
            error = function(e) {
                e
            }
        )))
        if (inherits(xx, "error")) {
            bad_files <- c(bad_files, f)
        }
    }
    bad_files
}

#' Return raw simulation files
#'
#' A helper function that wraps up duckdb and arrow calls to return any set
#' of raw simulation files from a single pathogen-vaccine scenario (i.e., you
#' cannot require multiple pathogens or multiple vaccination coverages due to
#' how the parquet files are structured).
#'
#' For more complex queries, you should use duckdb directly rather than this
#' helper.
#'
#' @param pathogen_x pathogen of interest (single pathogen)
#' @param vaccine_x vaccine coverage level (single vaccine coverage level)
#' @param state_x state or states of interest
#' @param time_max maximum time steps to return
#' @param batch_x batch or batches to return
#' @param simulation_x simulation or simulations to return
#' @param return_all return all columns or just minimal set
#'
#' @returns dataframe of raw simulation files
pull_raw_simulations <- function(pathogen_x,
                                 vaccine_x,
                                 state_x,
                                 time_max = 365 * 25,
                                 batch_x = NULL,
                                 simulation_x = NULL,
                                 return_all = FALSE) {
    sim_path <- here::here(
        "simulations", pathogen_x, ifelse(
            vaccine_x < 0,
            sprintf("vaccine_coverage_fixed%03d", round(vaccine_x * -100)),
            sprintf("vaccine_coverage_%03d", round(vaccine_x * 100))
        )
    )

    f_paths <- fs::dir_ls(
        sim_path,
        recurse = TRUE,
        regexp = sprintf("\\_%s\\_batch[0-9]{2}\\.parquet", state_x)
    )

    ## Read in the parquet files of only this scenario/batch
    sql_cmd <- sprintf(
        "read_parquet([%s])",
        paste0("'", f_paths, "'", collapse = ",")
    )

    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    res <- dplyr::tbl(con, sql_cmd) |>
        dplyr::filter(time <= time_max)

    if (!is.null(batch_x)) {
        res <- res |>
            dplyr::filter(batch == batch_x)
    }

    if (!is.null(simulation_x)) {
        res <- res |>
            dplyr::filter(simulation == simulation_x)
    }

    if (return_all) {
        res <- res |>
            dplyr::collect()
    } else {
        res <- res |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen, state, time) |>
            dplyr::summarize(dplyr::across(
                c(
                    new_infectious,
                    imported_infectious,
                    cume_new_infectious,
                    cume_imported_infectious
                ),
                sum
            ), .groups = "drop") |>
            dplyr::collect()
    }

    duckdb::dbDisconnect(con)

    res
}

#' Return summary of simulations.
#'
#' This is just a wrapper for duckdb. For more complex queries, use duckdb
#' directly rather than this helper.
#'
#' @param state_x state or states of interest (default is whole US)
#' @param vaccine_x vaccine coverage level (default is all)
#' @param time_max maximum time steps to return
#'
#' @returns summaries of the simulations (mean, median, IQR, etc.)
pull_summary_data <- function(state_x = NULL,
                              vaccine_x = NULL,
                              time_max = 365 * 25) {
    con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
    res <- dplyr::tbl(con, "read_parquet('summaries/*.parquet')") |>
        dplyr::filter(time <= time_max)

    if (!is.null(state_x)) {
        res <- res |>
            dplyr::filter(state %in% "US")
    }

    if (!is.null(vaccine_x)) {
        res <- res |>
            dplyr::filter(vaccine_coverage %in% vaccine_x)
    }

    res <- res |>
        dplyr::collect() |>
        categorize_pathogens() |>
        categorize_vaccine_coverage() |>
        categorize_metric() |>
        dplyr::arrange(pathogen_cat, vaccine_coverage_cat, metric_cat, state)

    duckdb::dbDisconnect(con)

    res
}

#' Reconstructs the new infectious cases for every time step
#'
#' For most outcomes, we save every other timestep in order to save space.
#' This function allows us to reconstruct the new infectious column for every
#' time step since we saved both the new infectious and the cumulative number
#' of new infectious cases, we can calculate the time step in between. Only
#' works if you put in a raw simulation file (with time [1, 2, 4, 6, ...]).
#'
#' @param grouped_simulation_df A grouped (raw) simulation dataframe
#'
#' @returns df of grouping columns, time, and new infectious with all time steps
reconstruct_new_infectious <- function(grouped_simulation_df) {
    temp_x <- grouped_simulation_df |>
        dplyr::mutate(
            time = time + 1,
            new_infectious = dplyr::lead(
                cume_new_infectious -
                    dplyr::lag(cume_new_infectious) -
                    new_infectious
            )
        ) |>
        dplyr::filter(time != 1, time %% 2 == 1, !is.na(new_infectious))

    res <- grouped_simulation_df |>
        dplyr::bind_rows(temp_x) |>
        dplyr::select(arrow::all_of(c(
            dplyr::group_vars(grouped_simulation_df),
            "time",
            "new_infectious"
        ))) |>
        dplyr::arrange(time, .by_group = TRUE) |>
        dplyr::ungroup()

    res
}

### NIS data helpers ----

#' Rename (NIS) columns
#'
#' The raw NIS data files change column names over time. This function just
#' renames them into a consistent set of names we can use to analyze later.
#'
#' @param df
#'
#' @returns
#' @export
#'
#' @examples
rename_columns <- function(df) {
    YEAR <- as.numeric(unique(df$YEAR))

    if (YEAR == 2004) {
        df <- df |>
            dplyr::rename(STRATUM = ITRUEIAP, PROVWT_C = WGT)
    }

    if (YEAR %in% 2005:2010) {
        df <- df |>
            dplyr::rename(PROVWT_C = PROVWT)
    }

    if (YEAR %in% 2011:2017) {
        df <- df |>
            dplyr::rename(PROVWT_C = PROVWT_D)
    }

    if (YEAR == 2005) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP)
    }

    if (YEAR == 2006) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP06)
    }

    if (YEAR == 2007) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP07)
    }

    if (YEAR == 2008) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP08)
    }

    if (YEAR == 2009) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP09)
    }

    if (YEAR == 2010) {
        df <- df |>
            dplyr::rename(STRATUM = ESTIAP10)
    }

    if (YEAR == 2011) {
        df <- df |>
            dplyr::rename(STRATUM = STRATUM_D)
    }

    df
}

add_state_fips <- function(df) {
    df |>
        dplyr::mutate(st_fips = sprintf("%02d", as.numeric(STATE)))
}

#' Calculates vaccination rates from the NIS files
#'
#' Accounts for NIS survey weights and calculates variances within the
#' survey design.
#'
#' @param df a NIS dataframe
#'
#' @returns a dataframe of vaccination rates by state and vaccine
calculate_immunity <- function(df) {
    svydsg <- survey::svydesign(
        id = ~SEQNUMHH,
        strata = ~STRATUM,
        weights = ~PROVWT_C,
        data = df |> dplyr::filter(!is.na(PROVWT_C))
    )

    dplyr::bind_rows(
        survey::svyby(
            formula = ~P_UTDPOL,
            by = ~st_fips,
            design = svydsg,
            FUN = survey::svymean,
            parm = NA,
            vartype = c("se", "ci"),
            level = .95
        ) |>
            dplyr::as_tibble() |>
            dplyr::transmute(
                st_fips,
                vaccine = "polio",
                estimate = P_UTDPOL,
                lower_ci = ci_l,
                upper_ci = ci_u,
                se
            ) |>
            dplyr::left_join(
                df |>
                    dplyr::filter(!is.na(PROVWT_C), !is.na(P_UTDPOL)) |>
                    dplyr::group_by(st_fips) |>
                    dplyr::count(),
                by = dplyr::join_by(st_fips)
            ),
        survey::svyby(
            formula = ~P_UTDMMX,
            by = ~st_fips,
            design = svydsg,
            FUN = survey::svymean,
            parm = NA,
            vartype = c("se", "ci"),
            level = .95
        ) |>
            dplyr::as_tibble() |>
            dplyr::transmute(
                st_fips,
                vaccine = "mmr",
                estimate = P_UTDMMX,
                lower_ci = ci_l,
                upper_ci = ci_u,
                se
            ) |>
            dplyr::left_join(
                df |>
                    dplyr::filter(!is.na(PROVWT_C), !is.na(P_UTDMMX)) |>
                    dplyr::group_by(st_fips) |>
                    dplyr::count(),
                by = dplyr::join_by(st_fips)
            ),
        survey::svyby(
            formula = ~P_UTDTP4,
            by = ~st_fips,
            design = svydsg,
            FUN = survey::svymean,
            parm = NA,
            vartype = c("se", "ci"),
            level = .95
        ) |>
            dplyr::as_tibble() |>
            dplyr::transmute(
                st_fips,
                vaccine = "tdap",
                estimate = P_UTDTP4,
                lower_ci = ci_l,
                upper_ci = ci_u,
                se
            ) |>
            dplyr::left_join(
                df |>
                    dplyr::filter(!is.na(PROVWT_C), !is.na(P_UTDTP4)) |>
                    dplyr::group_by(st_fips) |>
                    dplyr::count(),
                by = dplyr::join_by(st_fips)
            )
    )
}

### Data cleaning helpers ----
### This functions just take common columns and turn them into factors for
### plotting purposes.

categorize_psa_parameters <- function(df) {
    df |>
        dplyr::mutate(parameter_cat = factor(
            parameter,
            levels = c(
                "transmission_reduction",
                rev(
                    c(
                        "initial_immune_agegroup1",
                        "initial_immune_agegroup2",
                        "initial_immune_agegroup3",
                        "initial_immune_agegroup4",
                        "initial_immune_agegroup5",
                        "initial_immune_agegroup6",
                        "initial_immune_agegroup7",
                        "initial_immune_agegroup8",
                        "initial_immune_agegroup9",
                        "initial_immune_agegroup10",
                        "initial_immune_agegroup11",
                        "initial_immune_agegroup12",
                        "initial_immune_agegroup13",
                        "initial_immune_agegroup14",
                        "initial_immune_agegroup15",
                        "initial_immune_agegroup16",
                        "initial_immune_agegroup17",
                        "initial_immune_agegroup18"
                    )
                ),
                "immunity",
                "lambda_import",
                "R0"
            ),
            labels = c(
                "Vaccine-reduced transmission",
                rev(
                    c(
                        "Ages: 0-4",
                        "Ages: 5-9",
                        "Ages: 10-14",
                        "Ages: 15-19",
                        "Ages: 20-24",
                        "Ages: 25-29",
                        "Ages: 30-34",
                        "Ages: 35-39",
                        "Ages: 40-44",
                        "Ages: 45-49",
                        "Ages: 50-54",
                        "Ages: 55-59",
                        "Ages: 60-64",
                        "Ages: 65-69",
                        "Ages: 70-74",
                        "Ages: 75-79",
                        "Ages: 80-84",
                        "Ages: 85+"
                    )
                ),
                "immunity",
                "Importation rate",
                "Reproductive number"
            ),
            ordered = TRUE
        )) |>
        dplyr::mutate(parameter_cat_rev = factor(
            parameter,
            levels = rev(
                c(
                    "transmission_reduction",
                    rev(
                        c(
                            "initial_immune_agegroup1",
                            "initial_immune_agegroup2",
                            "initial_immune_agegroup3",
                            "initial_immune_agegroup4",
                            "initial_immune_agegroup5",
                            "initial_immune_agegroup6",
                            "initial_immune_agegroup7",
                            "initial_immune_agegroup8",
                            "initial_immune_agegroup9",
                            "initial_immune_agegroup10",
                            "initial_immune_agegroup11",
                            "initial_immune_agegroup12",
                            "initial_immune_agegroup13",
                            "initial_immune_agegroup14",
                            "initial_immune_agegroup15",
                            "initial_immune_agegroup16",
                            "initial_immune_agegroup17",
                            "initial_immune_agegroup18"
                        )
                    ),
                    "immunity",
                    "lambda_import",
                    "R0"
                )
            ),
            labels = rev(
                c(
                    "Vaccine-reduced transmission",
                    rev(
                        c(
                            "Ages: 0-4",
                            "Ages: 5-9",
                            "Ages: 10-14",
                            "Ages: 15-19",
                            "Ages: 20-24",
                            "Ages: 25-29",
                            "Ages: 30-34",
                            "Ages: 35-39",
                            "Ages: 40-44",
                            "Ages: 45-49",
                            "Ages: 50-54",
                            "Ages: 55-59",
                            "Ages: 60-64",
                            "Ages: 65-69",
                            "Ages: 70-74",
                            "Ages: 75-79",
                            "Ages: 80-84",
                            "Ages: 85+"
                        )
                    ),
                    "immunity",
                    "Importation rate",
                    "Reproductive number"
                )
            ),
            ordered = TRUE
        ))
}

categorize_pathogens <- function(df) {
    df |>
        dplyr::mutate(pathogen_cat = factor(
            pathogen,
            levels = c(
                "measles",
                "rubella",
                "diphtheria",
                "polio",
                "all_pathogens"
            ),
            labels = c(
                "Measles",
                "Rubella",
                "Diphtheria",
                "Polio",
                "All pathogens"
            ),
            ordered = TRUE
        )) |>
        dplyr::mutate(pathogen_cat_rev = factor(
            pathogen,
            levels = rev(
                c(
                    "measles",
                    "rubella",
                    "diphtheria",
                    "polio",
                    "all_pathogens"
                )
            ),
            labels = rev(
                c(
                    "Measles",
                    "Rubella",
                    "Diphtheria",
                    "Polio",
                    "All pathogens"
                )
            ),
            ordered = TRUE
        ))
}

categorize_vaccine_coverage <- function(df) {
    df |>
        dplyr::mutate(vaccine_coverage_cat = factor(
            vaccine_coverage,
            levels = c(
                0,
                0.25,
                0.5,
                0.55,
                0.6,
                0.65,
                0.7,
                0.75,
                .8,
                .85,
                .9,
                .95,
                1,
                1.05,
                1.1,
                -.95
            ),
            labels = c(
                "No vaccinations",
                "75% lower",
                "50% lower",
                "45% lower",
                "40% lower",
                "35% lower",
                "30% lower",
                "25% lower",
                "20% lower",
                "15% lower",
                "10% lower",
                "5% lower",
                "Current levels",
                "5% higher",
                "10% higher",
                "High vaccination"
            ),
            ordered = TRUE
        )) |>
        dplyr::mutate(vaccine_coverage_cat_short = factor(
            vaccine_coverage,
            levels = c(
                0,
                0.25,
                0.5,
                0.55,
                0.6,
                0.65,
                0.7,
                0.75,
                .8,
                .85,
                .9,
                .95,
                1,
                1.05,
                1.1,
                -.95
            ),
            labels = c(
                "-100%",
                "-75%",
                "-50%",
                "-45%",
                "-40%",
                "-35%",
                "-30%",
                "-25%",
                "-20%",
                "-15%",
                "-10%",
                "-5%",
                "Current\nlevels",
                "+5%",
                "+10%",
                "High vaccination"
            ),
            ordered = TRUE
        )) |> 
        dplyr::mutate(vaccine_coverage_cat_rev = factor(
            vaccine_coverage,
            levels = rev(c(
                0,
                0.25,
                0.5,
                0.55,
                0.6,
                0.65,
                0.7,
                0.75,
                .8,
                .85,
                .9,
                .95,
                1,
                1.05,
                1.1,
                -.95
            )),
            labels = rev(c(
                "No vaccinations",
                "75% lower",
                "50% lower",
                "45% lower",
                "40% lower",
                "35% lower",
                "30% lower",
                "25% lower",
                "20% lower",
                "15% lower",
                "10% lower",
                "5% lower",
                "Current levels",
                "5% higher",
                "10% higher",
                "High vaccination"
            )),
            ordered = TRUE
        )) 
}

categorize_metric <- function(df) {
    df |>
        dplyr::mutate(metric_cat = factor(
            metric,
            levels = c(
                "cume_new_infectious",
                "new_infectious",
                "cume_imported_infectious"
            ),
            labels = c(
                "Cumulative new infections",
                "New infections",
                "Cumulative imported infections"
            ),
            ordered = TRUE
        )) |>
        dplyr::mutate(metric_cat_rev = factor(
            metric,
            levels = rev(
                c(
                    "cume_new_infectious",
                    "new_infectious",
                    "cume_imported_infectious"
                )
            ),
            labels = rev(
                c(
                    "Cumulative new infections",
                    "New infections",
                    "Cumulative imported infections"
                )
            ),
            ordered = TRUE
        ))
}

categorize_complications <- function(df) {
    df |>
        dplyr::mutate(complication_cat = factor(
            complication,
            levels = c(
                "cume_hearing_loss",
                "cume_neurological",
                "cume_crs",
                "cume_paralytic",
                "cume_hospitalization",
                "cume_death",
                "hearing_loss",
                "neurological",
                "crs",
                "paralytic",
                "hospitalization",
                "death",
                "cume_death_lower",
                "cume_death_upper",
                "cume_hospitalization_lower",
                "cume_hospitalization_upper",
                "cume_paralytic_lower"
            ),
            labels = c(
                "Measles-associated hearing loss",
                "Post-measles neurological sequelae",
                "Congenital rubella syndrome",
                "Paralytic polio",
                "Hospitalization",
                "Death",
                "Measles-associated hearing loss",
                "Post-measles neurological sequelae",
                "Congenital rubella syndrome",
                "Paralytic polio",
                "Hospitalization",
                "Death",
                "Death (lower bound)",
                "Death (upper bound)",
                "Hospitalization (lower bound)",
                "Hospitalization (upper bound)",
                "Paralytic polio (lower bound)"
            ),
            ordered = TRUE
        ))
}

### Misc. data helpers ----
return_st_info <- function() {
    structure(
        list(
            abbrev = c(
                "AK",
                "AL",
                "AR",
                "AZ",
                "CA",
                "CO",
                "CT",
                "DC",
                "DE",
                "FL",
                "GA",
                "HI",
                "IA",
                "ID",
                "IL",
                "IN",
                "KS",
                "KY",
                "LA",
                "MA",
                "MD",
                "ME",
                "MI",
                "MN",
                "MO",
                "MS",
                "MT",
                "NC",
                "ND",
                "NE",
                "NH",
                "NJ",
                "NM",
                "NV",
                "NY",
                "OH",
                "OK",
                "OR",
                "PA",
                "RI",
                "SC",
                "SD",
                "TN",
                "TX",
                "US",
                "UT",
                "VA",
                "VT",
                "WA",
                "WI",
                "WV",
                "WY",
                NA
            ),
            division = c(
                "Pacific",
                "East South Central",
                "West South Central",
                "Mountain",
                "Pacific",
                "Mountain",
                "New England",
                "South Atlantic",
                "South Atlantic",
                "South Atlantic",
                "South Atlantic",
                "Pacific",
                "West North Central",
                "Mountain",
                "East North Central",
                "East North Central",
                "West North Central",
                "East South Central",
                "West South Central",
                "New England",
                "South Atlantic",
                "New England",
                "East North Central",
                "West North Central",
                "West North Central",
                "East South Central",
                "Mountain",
                "South Atlantic",
                "West North Central",
                "West North Central",
                "New England",
                "Middle Atlantic",
                "Mountain",
                "Mountain",
                "Middle Atlantic",
                "East North Central",
                "West South Central",
                "Pacific",
                "Middle Atlantic",
                "New England",
                "South Atlantic",
                "West North Central",
                "East South Central",
                "West South Central",
                "Whole US",
                "Mountain",
                "South Atlantic",
                "New England",
                "Pacific",
                "East North Central",
                "South Atlantic",
                "Mountain",
                "Unknown"
            ),
            st_lat = c(
                49.25,
                32.5901,
                34.7336,
                34.2192,
                36.5341,
                38.6777,
                41.5928,
                38.9072,
                38.6777,
                27.8744,
                32.3329,
                31.75,
                41.9358,
                43.5648,
                40.0495,
                40.0495,
                38.4204,
                37.3915,
                30.6181,
                42.3645,
                39.2778,
                45.6226,
                43.1361,
                46.3943,
                38.3347,
                32.6758,
                46.823,
                35.4195,
                47.2517,
                41.3356,
                43.3934,
                39.9637,
                34.4764,
                39.1063,
                43.1361,
                40.221,
                35.5053,
                43.9078,
                40.9069,
                41.5928,
                33.619,
                44.3365,
                35.6767,
                31.3897,
                0,
                39.1063,
                37.563,
                44.2508,
                47.4231,
                44.5937,
                38.4204,
                43.0504,
                0
            ),
            st_lon = c(
                -127.25,
                -86.7509,
                -92.2992,
                -111.625,
                -119.773,
                -105.513,
                -72.3573,
                -77.0369,
                -74.9841,
                -81.685,
                -83.3736,
                -126.25,
                -93.3714,
                -113.93,
                -89.3776,
                -86.0808,
                -98.1156,
                -84.7674,
                -92.2724,
                -71.58,
                -76.6459,
                -68.9801,
                -84.687,
                -94.6043,
                -92.5137,
                -89.8065,
                -109.32,
                -78.4686,
                -100.099,
                -99.5898,
                -71.3924,
                -74.2336,
                -105.942,
                -116.851,
                -75.1449,
                -82.5963,
                -97.1239,
                -120.068,
                -77.45,
                -71.1244,
                -80.5056,
                -99.7238,
                -86.456,
                -98.7857,
                200,
                -111.33,
                -78.2005,
                -72.545,
                -119.746,
                -89.9941,
                -80.6665,
                -107.256,
                199
            ),
            name = c(
                "Alaska",
                "Alabama",
                "Arkansas",
                "Arizona",
                "California",
                "Colorado",
                "Connecticut",
                "District of Columbia",
                "Delaware",
                "Florida",
                "Georgia",
                "Hawaii",
                "Iowa",
                "Idaho",
                "Illinois",
                "Indiana",
                "Kansas",
                "Kentucky",
                "Louisiana",
                "Massachusetts",
                "Maryland",
                "Maine",
                "Michigan",
                "Minnesota",
                "Missouri",
                "Mississippi",
                "Montana",
                "North Carolina",
                "North Dakota",
                "Nebraska",
                "New Hampshire",
                "New Jersey",
                "New Mexico",
                "Nevada",
                "New York",
                "Ohio",
                "Oklahoma",
                "Oregon",
                "Pennsylvania",
                "Rhode Island",
                "South Carolina",
                "South Dakota",
                "Tennessee",
                "Texas",
                "Whole US",
                "Utah",
                "Virginia",
                "Vermont",
                "Washington",
                "Wisconsin",
                "West Virginia",
                "Wyoming",
                "Unknown State"
            ),
            st_fips = c(
                "02",
                "01",
                "05",
                "04",
                "06",
                "08",
                "09",
                "11",
                "10",
                "12",
                "13",
                "15",
                "19",
                "16",
                "17",
                "18",
                "20",
                "21",
                "22",
                "25",
                "24",
                "23",
                "26",
                "27",
                "29",
                "28",
                "30",
                "37",
                "38",
                "31",
                "33",
                "34",
                "35",
                "32",
                "36",
                "39",
                "40",
                "41",
                "42",
                "44",
                "45",
                "46",
                "47",
                "48",
                "999",
                "49",
                "51",
                "50",
                "53",
                "55",
                "54",
                "56",
                NA
            ),
            lon_rank = c(
                1L,
                28L,
                23L,
                8L,
                4L,
                13L,
                47L,
                41L,
                44L,
                35L,
                33L,
                2L,
                21L,
                7L,
                27L,
                30L,
                18L,
                31L,
                24L,
                48L,
                42L,
                51L,
                32L,
                20L,
                22L,
                26L,
                10L,
                38L,
                14L,
                16L,
                49L,
                45L,
                12L,
                6L,
                43L,
                34L,
                19L,
                3L,
                40L,
                50L,
                37L,
                15L,
                29L,
                17L,
                53L,
                9L,
                39L,
                46L,
                5L,
                25L,
                36L,
                11L,
                52L
            ),
            alpha_rank = c(
                2L,
                1L,
                4L,
                3L,
                5L,
                6L,
                7L,
                9L,
                8L,
                10L,
                11L,
                12L,
                16L,
                13L,
                14L,
                15L,
                17L,
                18L,
                19L,
                22L,
                21L,
                20L,
                23L,
                24L,
                26L,
                25L,
                27L,
                34L,
                35L,
                28L,
                30L,
                31L,
                32L,
                29L,
                33L,
                36L,
                37L,
                38L,
                39L,
                40L,
                41L,
                42L,
                43L,
                44L,
                52L,
                45L,
                47L,
                46L,
                48L,
                50L,
                49L,
                51L,
                53L
            ),
            st_cat = structure(
                c(
                    1L,
                    28L,
                    23L,
                    8L,
                    4L,
                    13L,
                    47L,
                    41L,
                    44L,
                    35L,
                    33L,
                    2L,
                    21L,
                    7L,
                    27L,
                    30L,
                    18L,
                    31L,
                    24L,
                    48L,
                    42L,
                    51L,
                    32L,
                    20L,
                    22L,
                    26L,
                    10L,
                    38L,
                    14L,
                    16L,
                    49L,
                    45L,
                    12L,
                    6L,
                    43L,
                    34L,
                    19L,
                    3L,
                    40L,
                    50L,
                    37L,
                    15L,
                    29L,
                    17L,
                    52L,
                    9L,
                    39L,
                    46L,
                    5L,
                    25L,
                    36L,
                    11L,
                    NA
                ),
                levels = c(
                    "AK",
                    "HI",
                    "OR",
                    "CA",
                    "WA",
                    "NV",
                    "ID",
                    "AZ",
                    "UT",
                    "MT",
                    "WY",
                    "NM",
                    "CO",
                    "ND",
                    "SD",
                    "NE",
                    "TX",
                    "KS",
                    "OK",
                    "MN",
                    "IA",
                    "MO",
                    "AR",
                    "LA",
                    "WI",
                    "MS",
                    "IL",
                    "AL",
                    "TN",
                    "IN",
                    "KY",
                    "MI",
                    "GA",
                    "OH",
                    "FL",
                    "WV",
                    "SC",
                    "NC",
                    "VA",
                    "PA",
                    "DC",
                    "MD",
                    "NY",
                    "DE",
                    "NJ",
                    "VT",
                    "CT",
                    "MA",
                    "NH",
                    "RI",
                    "ME",
                    "US"
                ),
                class = c("ordered", "factor")
            ),
            name_cat = structure(
                c(
                    2L,
                    1L,
                    4L,
                    3L,
                    5L,
                    6L,
                    7L,
                    9L,
                    8L,
                    10L,
                    11L,
                    12L,
                    16L,
                    13L,
                    14L,
                    15L,
                    17L,
                    18L,
                    19L,
                    22L,
                    21L,
                    20L,
                    23L,
                    24L,
                    26L,
                    25L,
                    27L,
                    34L,
                    35L,
                    28L,
                    30L,
                    31L,
                    32L,
                    29L,
                    33L,
                    36L,
                    37L,
                    38L,
                    39L,
                    40L,
                    41L,
                    42L,
                    43L,
                    44L,
                    51L,
                    46L,
                    48L,
                    47L,
                    49L,
                    52L,
                    50L,
                    53L,
                    45L
                ),
                levels = c(
                    "Alabama",
                    "Alaska",
                    "Arizona",
                    "Arkansas",
                    "California",
                    "Colorado",
                    "Connecticut",
                    "Delaware",
                    "District of Columbia",
                    "Florida",
                    "Georgia",
                    "Hawaii",
                    "Idaho",
                    "Illinois",
                    "Indiana",
                    "Iowa",
                    "Kansas",
                    "Kentucky",
                    "Louisiana",
                    "Maine",
                    "Maryland",
                    "Massachusetts",
                    "Michigan",
                    "Minnesota",
                    "Mississippi",
                    "Missouri",
                    "Montana",
                    "Nebraska",
                    "Nevada",
                    "New Hampshire",
                    "New Jersey",
                    "New Mexico",
                    "New York",
                    "North Carolina",
                    "North Dakota",
                    "Ohio",
                    "Oklahoma",
                    "Oregon",
                    "Pennsylvania",
                    "Rhode Island",
                    "South Carolina",
                    "South Dakota",
                    "Tennessee",
                    "Texas",
                    "Unknown State",
                    "Utah",
                    "Vermont",
                    "Virginia",
                    "Washington",
                    "West Virginia",
                    "Whole US",
                    "Wisconsin",
                    "Wyoming"
                ),
                class = c("ordered", "factor")
            ),
            name_cat_alpha = structure(
                c(
                    2L,
                    1L,
                    4L,
                    3L,
                    5L,
                    6L,
                    7L,
                    9L,
                    8L,
                    10L,
                    11L,
                    12L,
                    16L,
                    13L,
                    14L,
                    15L,
                    17L,
                    18L,
                    19L,
                    22L,
                    21L,
                    20L,
                    23L,
                    24L,
                    26L,
                    25L,
                    27L,
                    34L,
                    35L,
                    28L,
                    30L,
                    31L,
                    32L,
                    29L,
                    33L,
                    36L,
                    37L,
                    38L,
                    39L,
                    40L,
                    41L,
                    42L,
                    43L,
                    44L,
                    52L,
                    45L,
                    47L,
                    46L,
                    48L,
                    50L,
                    49L,
                    51L,
                    53L
                ),
                levels = c(
                    "Alabama",
                    "Alaska",
                    "Arizona",
                    "Arkansas",
                    "California",
                    "Colorado",
                    "Connecticut",
                    "Delaware",
                    "District of Columbia",
                    "Florida",
                    "Georgia",
                    "Hawaii",
                    "Idaho",
                    "Illinois",
                    "Indiana",
                    "Iowa",
                    "Kansas",
                    "Kentucky",
                    "Louisiana",
                    "Maine",
                    "Maryland",
                    "Massachusetts",
                    "Michigan",
                    "Minnesota",
                    "Mississippi",
                    "Missouri",
                    "Montana",
                    "Nebraska",
                    "Nevada",
                    "New Hampshire",
                    "New Jersey",
                    "New Mexico",
                    "New York",
                    "North Carolina",
                    "North Dakota",
                    "Ohio",
                    "Oklahoma",
                    "Oregon",
                    "Pennsylvania",
                    "Rhode Island",
                    "South Carolina",
                    "South Dakota",
                    "Tennessee",
                    "Texas",
                    "Utah",
                    "Vermont",
                    "Virginia",
                    "Washington",
                    "West Virginia",
                    "Wisconsin",
                    "Wyoming",
                    "Whole US",
                    "Unknown State"
                ),
                class = c("ordered", "factor")
            )
        ),
        row.names = c(NA, -53L),
        class = c("tbl_df", "tbl", "data.frame")
    )
}
