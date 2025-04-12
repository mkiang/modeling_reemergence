## 01_import_births.R ----
##
## Takes the natality files from NCHS and cleans them up into the number of
## births by state, year, and age group.

## Imports ----
library(tidyverse)
library(here)
library(janitor)

## Data ----
birth_df <- readr::read_tsv(here::here("data_raw", "Natality, 2007-2023.txt")) |>
    janitor::clean_names() |>
    dplyr::filter(is.na(notes))

## Clean up ----
birth_clean <- birth_df |>
    dplyr::transmute(
        st_name = state,
        st_fips = state_code,
        year,
        age_char = age_of_mother_9,
        age_int = dplyr::case_when(
            age_of_mother_9_code == "15" ~ 0,
            age_of_mother_9_code == "15-19" ~ 15,
            age_of_mother_9_code == "20-24" ~ 20,
            age_of_mother_9_code == "25-29" ~ 25,
            age_of_mother_9_code == "30-34" ~ 30,
            age_of_mother_9_code == "35-39" ~ 35,
            age_of_mother_9_code == "40-44" ~ 40,
            age_of_mother_9_code == "45-49" ~ 45,
            age_of_mother_9_code == "50+" ~ 50
        ),
        n_births = as.numeric(births)
    )

## Save ----
saveRDS(birth_clean,
    here::here("data", "births_by_state_age.RDS"),
    compress = "xz"
)
