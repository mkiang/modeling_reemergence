## 12_calculate_secondary_outcomes.R ----
##
## Reads through each simulations and calculates simulation-specific secondary
## outcomes such as hospitalization, death, or infection-related complications.
## Then takes the summary across all simulations.

## Imports ----
library(tidyverse)
library(here)
library(fs)
library(doParallel)
library(foreach)
library(duckdb)
library(arrow)
source(here::here("code", "utils.R"))

## CONSTANTS ---
VACCINE_COVERAGES <- return_vaccine_coverage(all = TRUE)
DELETE_TEMP_FILES <- FALSE
FORCE_REFRESH <- FALSE

## Data ----
### Proportion of population that is female by age group ----
### See: `./data_raw/National Population Projections 2014-2060.txt` for
### source.
female_df <- dplyr::tribble(
    ~age_group, ~female, ~total,
    15, 30958568, 63317757,
    20, 32319438, 66360962,
    25, 34743499, 71103584,
    30, 33015027, 66966208,
    35, 32289146, 64830919,
    40, 29913869, 59610918
) |>
    dplyr::transmute(age_group,
        prob_female = female / total
    )

### Probability of being in first two trimesters of pregnancy ----
### Conditional on being female and age group. Note that no observed
### prgnancies in the NSFG 2017-2019 45+ age group so I drop it here.
preg_df <- readRDS(here::here("data", "probability_of_pregnancy.RDS")) |>
    dplyr::select(age_group = age_bin,
        prob_preg_tri2 = preg_first_two_tri,
        prob_preg_tri1 = preg_first_tri) |>
    dplyr::filter(age_group < 45)

## Measles-related complications ----
## Hearing loss is 1% of all cases
## Hospitalization is 20% of all cases
## Deaths is 30 per 10,000 cases
measles_temp <- here::here("temp_secondary_outcomes", "measles_complications.RDS")

if (!fs::file_exists(measles_temp) | FORCE_REFRESH) {
    measles_holder <- vector("list", NROW(VACCINE_COVERAGES))
    for (i in 1:NROW(VACCINE_COVERAGES)) {
        ## Pull full simulation data, keeping only columns we need
        temp_x <- pull_raw_simulations(
            pathogen_x = "measles",
            vaccine_x = VACCINE_COVERAGES[i],
            state_x = "US",
            time_max = 365 * 25,
            return_all = FALSE
        ) |>
            dplyr::select(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                time,
                new_infectious,
                cume_new_infectious
            ) |>
            dplyr::arrange(pathogen, vaccine_coverage, batch, simulation, time)

        measles_infectious <- temp_x |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            reconstruct_new_infectious()

        rm(temp_x)

        ## Hearing loss has a 1% change in cases
        measles_infectious$hearing_loss <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = .01
        )

        ## Post-measles neurological sequelae has a 1 in 1000 chance in cases
        measles_infectious$neurological <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = .001
        )

        ## Hospitalization has a 20% chance in cases
        measles_infectious$hospitalization <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = .2
        )

        measles_infectious$hospitalization_lower <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = .1
        )

        measles_infectious$hospitalization_upper <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = .3
        )

        ## Death has a 30/10000 chance in cases
        measles_infectious$death <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = 30 / 10000
        )

        measles_infectious$death_lower <- stats::rbinom(
            n = NROW(measles_infectious),
            size = measles_infectious$new_infectious,
            prob = 10 / 10000
        )

        measles_infectious <- measles_infectious |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            dplyr::mutate(
                cume_hearing_loss = cumsum(hearing_loss),
                cume_neurological = cumsum(neurological),
                cume_hospitalization = cumsum(hospitalization),
                cume_hospitalization_lower = cumsum(hospitalization_lower),
                cume_hospitalization_upper = cumsum(hospitalization_upper),
                cume_death_lower = cumsum(death_lower),
                cume_death = cumsum(death)
            ) |>
            dplyr::mutate(
                gte1_hearing_loss = (cume_hearing_loss > 0) + 0,
                gte1_neurological = (cume_neurological > 0) + 0,
                gte1_hospitalization = (cume_hospitalization > 0) + 0,
                gte1_death = (cume_death > 0) + 0
            ) |>
            dplyr::ungroup()

        measles_holder[[i]] <- dplyr::left_join(
            measles_infectious |>
                dplyr::select(-dplyr::starts_with("gte1"), -new_infectious) |>
                tidyr::pivot_longer(
                    cols = hearing_loss:cume_death,
                    names_to = "complication",
                    values_to = "value"
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
                dplyr::summarize(
                    mean = mean(value),
                    sd = stats::sd(value),
                    median = stats::median(value),
                    p025 = stats::quantile(value, .025),
                    p250 = stats::quantile(value, .25),
                    p750 = stats::quantile(value, .75),
                    p975 = stats::quantile(value, .975),
                    .groups = "drop"
                ),
            measles_infectious |>
                dplyr::select(
                    vaccine_coverage,
                    pathogen,
                    time,
                    dplyr::starts_with("gte1")
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, time) |>
                dplyr::summarize(dplyr::across(
                    dplyr::starts_with("gte1"), mean
                ), .groups = "drop") |>
                tidyr::pivot_longer(
                    cols = dplyr::starts_with("gte1"),
                    names_to = "complication",
                    values_to = "prob_gte1"
                ) |>
                dplyr::mutate(complication = gsub("gte1_", "", complication)),
            by = c(
                "vaccine_coverage",
                "pathogen",
                "time",
                "complication"
            )
        )

        rm(measles_infectious)
    }

    measles_complications <- measles_holder |>
        dplyr::bind_rows() |>
        categorize_pathogens() |>
        categorize_vaccine_coverage()

    fs::dir_create(dirname(measles_temp))
    saveRDS(measles_complications, measles_temp)
} else {
    measles_complications <- readRDS(measles_temp)
}

## Diphtheria-related complications ----
## Hospitalization is 100% of all cases
## Deaths is 10% of all cases
diphtheria_temp <- here::here("temp_secondary_outcomes", "diphtheria_complications.RDS")

if (!fs::file_exists(diphtheria_temp) | FORCE_REFRESH) {
    diphtheria_holder <- vector("list", NROW(VACCINE_COVERAGES))
    for (i in 1:NROW(VACCINE_COVERAGES)) {
        ## Pull full simulation data, keeping only columns we need
        temp_x <- pull_raw_simulations(
            pathogen_x = "diphtheria",
            vaccine_x = VACCINE_COVERAGES[i],
            state_x = "US",
            time_max = 365 * 25,
            return_all = FALSE
        ) |>
            dplyr::select(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                time,
                new_infectious,
                cume_new_infectious
            ) |>
            dplyr::arrange(pathogen, vaccine_coverage, batch, simulation, time)

        diphtheria_infectious <- temp_x |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            reconstruct_new_infectious()

        rm(temp_x)

        ## Hospitalization is 100% of cases
        diphtheria_infectious$hospitalization <- diphtheria_infectious$new_infectious

        ## Death has a change in cases
        diphtheria_infectious$death <- stats::rbinom(
            n = NROW(diphtheria_infectious),
            size = diphtheria_infectious$new_infectious,
            prob = .1
        )

        diphtheria_infectious$death_lower <- stats::rbinom(
            n = NROW(diphtheria_infectious),
            size = diphtheria_infectious$new_infectious,
            prob = .05
        )

        diphtheria_infectious <- diphtheria_infectious |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            dplyr::mutate(
                cume_hospitalization = cumsum(hospitalization),
                cume_death_lower = cumsum(death_lower),
                cume_death = cumsum(death)
            ) |>
            dplyr::mutate(
                gte1_hospitalization = (cume_hospitalization > 0) + 0,
                gte1_death = (cume_death > 0) + 0
            ) |>
            dplyr::ungroup()

        diphtheria_holder[[i]] <- dplyr::left_join(
            diphtheria_infectious |>
                dplyr::select(-dplyr::starts_with("gte1"), -new_infectious) |>
                tidyr::pivot_longer(
                    cols = hospitalization:cume_death,
                    names_to = "complication",
                    values_to = "value"
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
                dplyr::summarize(
                    mean = mean(value),
                    sd = stats::sd(value),
                    median = stats::median(value),
                    p025 = stats::quantile(value, .025),
                    p250 = stats::quantile(value, .25),
                    p750 = stats::quantile(value, .75),
                    p975 = stats::quantile(value, .975),
                    .groups = "drop"
                ),
            diphtheria_infectious |>
                dplyr::select(
                    vaccine_coverage,
                    pathogen,
                    time,
                    dplyr::starts_with("gte1")
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, time) |>
                dplyr::summarize(dplyr::across(
                    dplyr::starts_with("gte1"), mean
                ), .groups = "drop") |>
                tidyr::pivot_longer(
                    cols = dplyr::starts_with("gte1"),
                    names_to = "complication",
                    values_to = "prob_gte1"
                ) |>
                dplyr::mutate(complication = gsub("gte1_", "", complication)),
            by = c(
                "vaccine_coverage",
                "pathogen",
                "time",
                "complication"
            )
        )

        rm(diphtheria_infectious)
    }

    diphtheria_complications <- diphtheria_holder |>
        dplyr::bind_rows() |>
        categorize_pathogens() |>
        categorize_vaccine_coverage()

    fs::dir_create(dirname(diphtheria_temp))
    saveRDS(diphtheria_complications, diphtheria_temp)
} else {
    diphtheria_complications <- readRDS(diphtheria_temp)
}

## Rubella-related complications ----
## CRS is 65% of all cases among women who are within 16 weeks of pregnancy
## (only for 15-44 y/o).
## Death is 30% of all CRS cases.
rubella_temp <- here::here("temp_secondary_outcomes", "rubella_complications.RDS")

if (!fs::file_exists(rubella_temp) | FORCE_REFRESH) {
    rubella_holder <- vector("list", NROW(VACCINE_COVERAGES))
    for (i in 1:NROW(VACCINE_COVERAGES)) {
        ## Pull full simulation data, keeping only columns we need
        temp_x <- pull_raw_simulations(
            pathogen_x = "rubella",
            vaccine_x = VACCINE_COVERAGES[i],
            state_x = "US",
            time_max = 365 * 25,
            return_all = TRUE
        ) |>
            dplyr::select(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                age_group,
                time,
                new_infectious,
                cume_new_infectious
            ) |>
            dplyr::filter(dplyr::between(age_group, 15, 40)) |>
            dplyr::arrange(
                pathogen,
                vaccine_coverage,
                batch,
                simulation,
                age_group,
                time
            )

        rubella_infectious <- temp_x |>
            dplyr::group_by(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                age_group
            ) |>
            reconstruct_new_infectious()

        rm(temp_x)

        ## Join probabilities
        rubella_infectious <- rubella_infectious |>
            dplyr::left_join(female_df, by = "age_group") |>
            dplyr::left_join(preg_df, by = "age_group")

        ## CRS has a a 65% probability among women within 16 weeks of pregnancy
        ## so we scale the probability of being in second trimester by 16/27.
        rubella_infectious$crs <- stats::rbinom(
            n = NROW(rubella_infectious),
            size = rubella_infectious$new_infectious,
            prob = .65 * rubella_infectious$prob_female *
                rubella_infectious$prob_preg_tri2 * 16 / 27
        )

        ## Death has a 30% change for each CRS case
        rubella_infectious$death <- stats::rbinom(
            n = NROW(rubella_infectious),
            size = rubella_infectious$crs,
            prob = .3
        )

        rubella_infectious$death_lower <- stats::rbinom(
            n = NROW(rubella_infectious),
            size = rubella_infectious$crs,
            prob = .2
        )

        rubella_infectious$death_upper <- stats::rbinom(
            n = NROW(rubella_infectious),
            size = rubella_infectious$crs,
            prob = .35
        )

        rubella_infectious <- rubella_infectious |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen, time) |>
            dplyr::summarize(
                crs = sum(crs),
                death_lower = sum(death_lower),
                death_upper = sum(death_upper),
                death = sum(death),
                .groups = "drop"
            ) |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            dplyr::mutate(
                cume_crs = cumsum(crs),
                cume_death_lower = cumsum(death_lower),
                cume_death_upper = cumsum(death_upper),
                cume_death = cumsum(death)
            ) |>
            dplyr::mutate(
                gte1_crs = (cume_crs > 0) + 0,
                gte1_death = (cume_death > 0) + 0
            ) |>
            dplyr::ungroup()

        rubella_holder[[i]] <- dplyr::left_join(
            rubella_infectious |>
                dplyr::select(-dplyr::starts_with("gte1")) |>
                tidyr::pivot_longer(
                    cols = crs:cume_death,
                    names_to = "complication",
                    values_to = "value"
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
                dplyr::summarize(
                    mean = mean(value),
                    sd = stats::sd(value),
                    median = stats::median(value),
                    p025 = stats::quantile(value, .025),
                    p250 = stats::quantile(value, .25),
                    p750 = stats::quantile(value, .75),
                    p975 = stats::quantile(value, .975),
                    .groups = "drop"
                ),
            rubella_infectious |>
                dplyr::select(
                    vaccine_coverage,
                    pathogen,
                    time,
                    dplyr::starts_with("gte1")
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, time) |>
                dplyr::summarize(dplyr::across(
                    dplyr::starts_with("gte1"), mean
                ), .groups = "drop") |>
                tidyr::pivot_longer(
                    cols = dplyr::starts_with("gte1"),
                    names_to = "complication",
                    values_to = "prob_gte1"
                ) |>
                dplyr::mutate(complication = gsub("gte1_", "", complication)),
            by = c(
                "vaccine_coverage",
                "pathogen",
                "time",
                "complication"
            )
        )

        rm(rubella_infectious)
    }

    fs::dir_create(dirname(rubella_temp))
    rubella_complications <- rubella_holder |>
        dplyr::bind_rows() |>
        categorize_pathogens() |>
        categorize_vaccine_coverage()

    saveRDS(rubella_complications, rubella_temp)
} else {
    rubella_complications <- readRDS(rubella_temp)
}

## Polio-related complications ----
## **Among those unvaccinated** :
## Paralytic polio: 1 / 200
## Hospitalizations: .5% of unvaccinated
## Deaths: 10% of paralytic polio cases
polio_temp <- here::here("temp_secondary_outcomes", "polio_complications.RDS")

if (!fs::file_exists(polio_temp) | FORCE_REFRESH) {
    polio_holder <- vector("list", NROW(VACCINE_COVERAGES))
    for (i in 1:NROW(VACCINE_COVERAGES)) {
        ## Pull full simulation data, keeping only columns we need
        temp_x <- pull_raw_simulations(
            pathogen_x = "polio",
            vaccine_x = VACCINE_COVERAGES[i],
            state_x = "US",
            time_max = 365 * 25,
            return_all = TRUE
        ) |>
            dplyr::select(
                batch,
                simulation,
                vaccine_coverage,
                pathogen,
                time,
                age_group,
                new_infectious,
                vrt_vaccinated,
                susceptible
            )

        ## Aggregate over age groups
        temp_x <- temp_x |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen, time) |>
            dplyr::summarize(dplyr::across(new_infectious:susceptible, sum),
                .groups = "drop"
            )

        ## For each simulation and time step, get proportion unvaccinated
        temp_x <- temp_x |>
            dplyr::mutate(unvac_prop = 1 - (vrt_vaccinated / susceptible))

        ## For each simulation and time step, random draw of unvaccinated cases
        temp_x$unvac_cases <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$new_infectious,
            prob = temp_x$unvac_prop
        )

        ## Paralytic polio is .5% of unvaccinated cases
        temp_x$paralytic <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$unvac_cases,
            prob = .005
        )

        temp_x$paralytic_lower <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$unvac_cases,
            prob = .0005
        )

        ## Hospitalization is .5% of unvaccinated cases
        temp_x$hospitalization <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$unvac_cases,
            prob = .005
        )

        ## Death is 10% of paralytic polio cases
        temp_x$death <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$paralytic,
            prob = .1
        )

        temp_x$death_lower <- stats::rbinom(
            n = NROW(temp_x),
            size = temp_x$paralytic,
            prob = .05
        )

        temp_x <- temp_x |>
            dplyr::group_by(batch, simulation, vaccine_coverage, pathogen) |>
            dplyr::mutate(
                cume_paralytic = cumsum(paralytic),
                cume_paralytic_lower = cumsum(paralytic_lower),
                cume_hospitalization = cumsum(hospitalization),
                cume_death_lower = cumsum(death_lower),
                cume_death = cumsum(death)
            ) |>
            dplyr::mutate(
                gte1_paralytic = (cume_paralytic > 0) + 0,
                gte1_hospitalization = (cume_hospitalization > 0) + 0,
                gte1_death = (cume_death > 0) + 0
            ) |>
            dplyr::ungroup()

        polio_holder[[i]] <- dplyr::left_join(
            temp_x |>
                dplyr::select(-dplyr::starts_with("gte1")) |>
                tidyr::pivot_longer(
                    cols = paralytic:cume_death,
                    names_to = "complication",
                    values_to = "value"
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
                dplyr::summarize(
                    mean = mean(value),
                    sd = stats::sd(value),
                    median = stats::median(value),
                    p025 = stats::quantile(value, .025),
                    p250 = stats::quantile(value, .25),
                    p750 = stats::quantile(value, .75),
                    p975 = stats::quantile(value, .975),
                    .groups = "drop"
                ),
            temp_x |>
                dplyr::select(
                    vaccine_coverage,
                    pathogen,
                    time,
                    dplyr::starts_with("gte1")
                ) |>
                dplyr::group_by(vaccine_coverage, pathogen, time) |>
                dplyr::summarize(dplyr::across(
                    dplyr::starts_with("gte1"), mean
                ), .groups = "drop") |>
                tidyr::pivot_longer(
                    cols = dplyr::starts_with("gte1"),
                    names_to = "complication",
                    values_to = "prob_gte1"
                ) |>
                dplyr::mutate(complication = gsub("gte1_", "", complication)),
            by = c(
                "vaccine_coverage",
                "pathogen",
                "time",
                "complication"
            )
        )

        rm(temp_x)
    }

    fs::dir_create(dirname(polio_temp))
    polio_complications <- polio_holder |>
        dplyr::bind_rows() |>
        categorize_pathogens() |>
        categorize_vaccine_coverage()

    saveRDS(polio_complications, polio_temp)
} else {
    polio_complications <- readRDS(polio_temp)
}

## Save all complications ----
if (!fs::file_exists(here::here("data", "complications_df.RDS")) | FORCE_REFRESH) {
    complications_df <- dplyr::bind_rows(
        measles_complications,
        diphtheria_complications,
        rubella_complications,
        polio_complications
    ) |>
        categorize_complications() |>
        dplyr::arrange(pathogen_cat, vaccine_coverage_cat, complication_cat, time)

    saveRDS(complications_df,
        here::here("data", "complications_df.RDS"),
        compress = "xz"
    )
}

if (DELETE_TEMP_FILES && fs::file_exists(here::here("data", "complications_df.RDS"))) {
    fs::dir_delete(here::here("temp_secondary_outcomes"))
}
