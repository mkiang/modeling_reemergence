## 02_import_deaths.R ----
##
## Takes the death data from NCHS and cleans it up, aggregating them to the
## number of deaths (from any cause) by state, year, and five year age group.

## Imports ----
library(tidyverse)
library(here)
library(janitor)

## Data ----
death_df <- readr::read_tsv(here::here("data_raw", "Multiple Cause of Death, 1999-2020.txt")) |>
    janitor::clean_names() |>
    dplyr::filter(is.na(notes))

## Clean up ----
death_clean <- death_df |>
    dplyr::transmute(
        st_name = state,
        st_fips = state_code,
        year,
        age_char = five_year_age_groups,
        age_int = dplyr::case_when(
            five_year_age_groups_code == "1" ~ 0,
            five_year_age_groups_code == "1-4" ~ 1,
            five_year_age_groups_code == "5-9" ~ 5,
            five_year_age_groups_code == "10-14" ~ 10,
            five_year_age_groups_code == "15-19" ~ 15,
            five_year_age_groups_code == "20-24" ~ 20,
            five_year_age_groups_code == "25-29" ~ 25,
            five_year_age_groups_code == "30-34" ~ 30,
            five_year_age_groups_code == "35-39" ~ 35,
            five_year_age_groups_code == "40-44" ~ 40,
            five_year_age_groups_code == "45-49" ~ 45,
            five_year_age_groups_code == "50-54" ~ 50,
            five_year_age_groups_code == "55-59" ~ 55,
            five_year_age_groups_code == "60-64" ~ 60,
            five_year_age_groups_code == "65-69" ~ 65,
            five_year_age_groups_code == "70-74" ~ 70,
            five_year_age_groups_code == "75-79" ~ 75,
            five_year_age_groups_code == "80-84" ~ 80,
            five_year_age_groups_code == "85-89" ~ 85,
            five_year_age_groups_code == "90-94" ~ 85,
            five_year_age_groups_code == "95-99" ~ 85,
            five_year_age_groups_code == "100+" ~ 85,
            five_year_age_groups_code == "NS" ~ NA_real_,
            TRUE ~ NA_real_
        ),
        n_deaths = as.numeric(deaths)
    )

death_clean <- death_clean |>
    dplyr::group_by(st_name, st_fips, year, age_char, age_int) |>
    dplyr::summarize(
        n_deaths = sum(n_deaths, na.rm = TRUE),
        .groups = "drop"
    )

## Save ----
saveRDS(death_clean,
    here::here("data", "deaths_by_state_age.RDS"),
    compress = "xz"
)
