## 06_calculate_immunity.R ----
##
## We use the NIS data to get immunity profiles for those <= 20 years old
## (by assuming respondents are repsentative of those who remained in the
## state). For those older than 20 years, we used data from the literature
## that is not state-specific.

## Imports ----
library(survey)
library(here)
library(tidyverse)
library(fs)
source(here::here("code", "utils.R"))

## CONSTANTS ----
YEARS <- 2004:2023
VARS_OF_INTEREST <- c(
    ## Need each of these
    "SEQNUMHH", ## Primary sampling unit
    "SEQNUMC", ## Child sequence number
    "AGEGRP", ## Don't really need this
    "STATE", ## State FIPS code
    "YEAR", ## Year of interview

    ## Need (exactly) one of these for variance estimation
    "ITRUEIAP", ## Variance estimation stratum used in 2004
    "ESTIAP", ## Variance estimation stratum used in 2005
    "ESTIAP06", ## Variance estimation stratum used in 2006
    "ESTIAP07", ## Variance estimation stratum used in 2007
    "ESTIAP08", ## Variance estimation stratum used in 2008
    "ESTIAP09", ## Variance estimation stratum used in 2009
    "ESTIAP10", ## Variance estimation stratum used in 2010
    "STRATUM_D", ## Variance estimation stratum used in 2011
    "STRATUM", ## Variance estimation stratum used in 2012-2023

    ## Need (exactly) one of these for weights
    "WGT", ## Provider weights used in 2004
    "PROVWT", ## Provider weights used in 2005-2010
    "PROVWT_D", ## Provider weights used in 2011-2017
    "PROVWT_C", ## Provider weights used in 2018-2023

    ## Need each of these
    "P_UTDPOL", ## Polio 3+ SHOTS BY 36 MONTHS OF AGE
    "P_UTDMMX", ## MMR 1+ MMR SHOT BY 36 MONTHS OF AGE
    "P_UTDTP4" ## DTaP 4+ SHOTS BY 36 MONTHS OF AGE
)

## Estimate prevalence ----
holder <- vector("list", NROW(YEARS))
for (i in seq_along(YEARS)) {
    y <- YEARS[i]

    F_PATH <- fs::dir_ls(
        here::here("data", "nis_processed"),
        type = "file",
        regexp = sprintf("%02d\\.RDS\\>", y - 2000)
    )

    temp_df <- readRDS(F_PATH) |>
        dplyr::select(dplyr::any_of(VARS_OF_INTEREST)) |>
        add_state_fips() |>
        rename_columns()

    holder[[i]] <- temp_df |>
        calculate_immunity() |>
        dplyr::mutate(year = y, .before = 1)
}

holder <- holder |>
    dplyr::bind_rows() |>
    dplyr::left_join(return_st_info() |> dplyr::select(abbrev, st_fips, name)) |>
    dplyr::mutate(age_in_2024 = 2024 - year + 2)

## Save ----
saveRDS(holder,
    here::here("data", "vaccine_coverage.RDS"),
    compress = "xz"
)
