## 07_create_analytic_data.R ----
##
## Creates the different analytic dataframes we need for the simulation (e.g.,
## deaths, births, immunity, population size, etc.).

## Imports ----
library(tidyverse)
library(here)

## Data ----
death_df <- readRDS(here::here("data", "deaths_by_state_age.RDS"))
pop_df <- readRDS(here::here("data", "population_by_state_age.RDS"))
birth_df <- readRDS(here::here("data", "births_by_state_age.RDS"))
vaccine_df <- readRDS(here::here("data", "vaccine_coverage.RDS"))
state_df <- dplyr::tibble(
    st_name = c(datasets::state.name, "District of Columbia", "Whole US"),
    st_abb  = c(datasets::state.abb, "DC", "US")
)

## Wrangle data into what we'll need for simulations ----
analytic_pop <- pop_df |>
    dplyr::bind_rows(pop_df |> dplyr::mutate(st_name = "Whole US", st_fips = "99")) |>
    dplyr::mutate(age = dplyr::case_when(age_int < 5 ~ 0, TRUE ~ age_int)) |>
    dplyr::group_by(st_name, st_fips, year, age) |>
    dplyr::summarize(pop = sum(population), .groups = "drop") |>
    dplyr::group_by(st_name, st_fips, year) |>
    dplyr::mutate(pop_prop = pop / sum(pop)) |>
    dplyr::ungroup() |>
    dplyr::left_join(state_df, by = c("st_name" = "st_name")) |>
    dplyr::select(st_abb, st_name, st_fips, year, age, pop, pop_prop)

analytic_death <- death_df |>
    dplyr::bind_rows(death_df |> dplyr::mutate(st_name = "Whole US", st_fips = "99")) |>
    dplyr::filter(!is.na(age_int)) |>
    dplyr::arrange(st_fips, year, age_int) |>
    dplyr::rowwise() |>
    dplyr::mutate(n_deaths = dplyr::case_when(n_deaths == 0 ~ sample(1:9, 1), TRUE ~ n_deaths)) |>
    dplyr::ungroup() |>
    dplyr::mutate(age = dplyr::case_when(age_int < 5 ~ 0, age_int > 85 ~ 85, TRUE ~ age_int)) |>
    dplyr::group_by(st_name, st_fips, year, age) |>
    dplyr::summarize(n_deaths = sum(n_deaths), .groups = "drop") |>
    dplyr::right_join(
        analytic_pop |>
            dplyr::select(st_name, year, age, pop),
        by = c("st_name", "year", "age")
    ) |>
    dplyr::mutate(death_rate = n_deaths / pop) |>
    dplyr::left_join(state_df, by = c("st_name" = "st_name")) |>
    dplyr::select(st_abb, st_name, st_fips, year, age, n_deaths, death_rate)

analytic_birth <- birth_df |>
    dplyr::bind_rows(birth_df |> dplyr::mutate(st_name = "Whole US", st_fips = "99")) |>
    dplyr::group_by(st_name, st_fips, year) |>
    dplyr::summarize(
        n_births = sum(n_births, na.rm = TRUE),
        .groups = "drop"
    ) |>
    dplyr::left_join(
        analytic_pop |>
            dplyr::group_by(st_name, st_fips, year) |>
            dplyr::summarize(pop = sum(pop), .groups = "drop")
    ) |>
    dplyr::mutate(birth_rate = n_births / pop) |>
    dplyr::left_join(state_df, by = c("st_name" = "st_name")) |>
    dplyr::select(st_abb, st_name, st_fips, year, n_births, birth_rate)

vac_u20 <- vaccine_df |>
    dplyr::rename(st_name = name, st_abb = abbrev) |>
    dplyr::mutate(
        age = dplyr::case_when(
            age_in_2024 < 5 ~ 0,
            dplyr::between(age_in_2024, 5, 9) ~ 5,
            dplyr::between(age_in_2024, 10, 14) ~ 10,
            dplyr::between(age_in_2024, 15, 19) ~ 15,
            age_in_2024 > 19 ~ 20
        )
    ) |>
    dplyr::filter(!is.na(age)) |>
    dplyr::group_by(st_abb, st_name, st_fips, vaccine, age) |>
    dplyr::summarize(
        estimate = mean(estimate),
        lower = mean(lower_ci),
        upper = mean(upper_ci),
        .groups = "drop"
    ) |>
    dplyr::mutate(
        pathogen = dplyr::case_when(
            vaccine == "mmr" ~ "measles",
            vaccine == "polio" ~ "polio",
            vaccine == "tdap" ~ "diphtheria"
        )
    )

vac_u20 <- dplyr::bind_rows(
    vac_u20,
    vac_u20 |>
        dplyr::filter(pathogen == "measles") |>
        dplyr::mutate(pathogen = "rubella")
)

vac_25andup <- vac_u20 |>
    dplyr::select(st_abb, st_name, st_fips, pathogen) |>
    dplyr::distinct() |>
    tidyr::expand_grid(age = seq(25, 85, 5)) |>
    dplyr::mutate(
        estimate = dplyr::case_when(
            pathogen == "polio" ~ .98,
            pathogen == "diphtheria" ~ .95,
            pathogen == "measles" & age == 25 ~ .95,
            pathogen == "measles" & age == 30 ~ .93,
            pathogen == "measles" & age == 35 ~ .93,
            pathogen == "measles" & age == 40 ~ .91,
            pathogen == "measles" & age == 45 ~ .88,
            pathogen == "measles" & age == 50 ~ .88,
            pathogen == "measles" & age == 55 ~ .88,
            pathogen == "measles" & age == 60 ~ .88,
            pathogen == "measles" & age == 65 ~ .94,
            pathogen == "measles" & age == 70 ~ .98,
            pathogen == "measles" & age == 75 ~ .99,
            pathogen == "measles" & age == 80 ~ .98,
            pathogen == "measles" & age == 85 ~ .98,
            pathogen == "rubella" & age == 25 ~ .98,
            pathogen == "rubella" & age == 30 ~ .96,
            pathogen == "rubella" & age == 35 ~ .95,
            pathogen == "rubella" & age == 40 ~ .95,
            pathogen == "rubella" & age == 45 ~ .93,
            pathogen == "rubella" & age == 50 ~ .93,
            pathogen == "rubella" & age == 55 ~ .94,
            pathogen == "rubella" & age == 60 ~ .95,
            pathogen == "rubella" & age == 65 ~ .95,
            pathogen == "rubella" & age == 70 ~ .95,
            pathogen == "rubella" & age == 75 ~ .95,
            pathogen == "rubella" & age == 80 ~ .95,
            pathogen == "rubella" & age == 85 ~ .95,
        )
    ) |>
    dplyr::mutate(lower = NA, upper = NA)

analytic_vaccine <- vac_u20 |>
    dplyr::bind_rows(vac_25andup)

analytic_vaccine <- analytic_vaccine |>
    dplyr::bind_rows(
        analytic_vaccine |>
            dplyr::left_join(
                pop_df |>
                    dplyr::filter(year == 2019) |>
                    dplyr::select(st_name, age = age_int, population)
            ) |>
            dplyr::group_by(vaccine, age, pathogen) |>
            dplyr::summarize(
                estimate = stats::weighted.mean(estimate, population),
                .groups = "drop"
            ) |>
            dplyr::mutate(
                lower = NA,
                upper = NA,
                st_abb = "US",
                st_name = "Whole US",
                st_fips = "99"
            )
    ) |>
    dplyr::arrange(st_fips, pathogen, age)

## Save ----
saveRDS(analytic_pop,
    here::here("data", "analytic_pop.RDS"),
    compress = "xz"
)
saveRDS(analytic_death,
    here::here("data", "analytic_death.RDS"),
    compress = "xz"
)
saveRDS(analytic_birth,
    here::here("data", "analytic_birth.RDS"),
    compress = "xz"
)
saveRDS(analytic_vaccine,
    here::here("data", "analytic_vaccine.RDS"),
    compress = "xz"
)
