## 03_import_population.R ----
##
## Takes raw population data from NCHS and cleans it up to return the number
## of people by stage, year, and five year age group.

## Imports ----
library(tidyverse)
library(here)
library(janitor)

## Data ----
pop_df <- readr::read_tsv(here::here("data_raw", "Bridged-Race Population Estimates 1990-2020.txt")) |>
    janitor::clean_names() |>
    dplyr::filter(is.na(notes))

## Clean up ----
pop_clean <- pop_df |>
    dplyr::transmute(
        st_name = state,
        st_fips = state_code,
        year = yearly_july_1st_estimates,
        age_char = age_group,
        age_int = dplyr::case_when(
            age_group_code == "1" ~ 0,
            age_group_code == "1-4" ~ 1,
            age_group_code == "5-9" ~ 5,
            age_group_code == "10-14" ~ 10,
            age_group_code == "15-19" ~ 15,
            age_group_code == "20-24" ~ 20,
            age_group_code == "25-29" ~ 25,
            age_group_code == "30-34" ~ 30,
            age_group_code == "35-39" ~ 35,
            age_group_code == "40-44" ~ 40,
            age_group_code == "45-49" ~ 45,
            age_group_code == "50-54" ~ 50,
            age_group_code == "55-59" ~ 55,
            age_group_code == "60-64" ~ 60,
            age_group_code == "65-69" ~ 65,
            age_group_code == "70-74" ~ 70,
            age_group_code == "75-79" ~ 75,
            age_group_code == "80-84" ~ 80,
            age_group_code == "85+" ~ 85,
            TRUE ~ NA_real_
        ),
        population = as.numeric(population)
    )

## Save ----
saveRDS(pop_clean,
    here::here("data", "population_by_state_age.RDS"),
    compress = "xz"
)
readr::write_csv(pop_clean, here::here("data", "population_by_state_age.csv"))
