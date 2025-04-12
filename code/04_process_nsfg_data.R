## 04_process_nsfg_data.R ----
##
## Takes the raw NSFG data and processes it to get the probability of pregnancy
## in the first two trimesters by age group. Here, we use the 2017-2019 survey
## data because later years have lower response rates (and we want pre-COVID
## trends). These probabilities are later used to calculate the number of
## congenital rubella cases.

## Imports ----
library(tidyverse)
library(here)
library(survey)

## Just get the variables we need + CONSTAT1 which will be a control so we
## can compare our results with the known prevalence estimates.
fwf_dict <- dplyr::tribble(
    ~start, ~end, ~col_names,
    13, 14, "AGE_R",
    87, 87, "currpreg",
    88, 88, "moscurrp",
    3462, 3463, "CONSTAT1",
    3787, 3802, "WGT2017_2019",
    3803, 3803, "secu",
    3804, 3806, "sest"
)

min_df <- readr::read_fwf(
    here::here("data_raw", "nsfg_raw", "2017_2019_FemRespData.dat"),
    col_positions = readr::fwf_positions(
        start = fwf_dict$start,
        end = fwf_dict$end,
        col_names = fwf_dict$col_names
    ),
    col_types = "nnnnnnn",
    na = c(" ", ".", "")
)

preg_df <- min_df |>
    dplyr::transmute(
        WGT2017_2019,
        secu,
        sest,
        age_bin = dplyr::case_when(
            dplyr::between(AGE_R, 15, 19) ~ 15,
            dplyr::between(AGE_R, 20, 24) ~ 20,
            dplyr::between(AGE_R, 25, 29) ~ 25,
            dplyr::between(AGE_R, 30, 34) ~ 30,
            dplyr::between(AGE_R, 35, 39) ~ 35,
            dplyr::between(AGE_R, 40, 44) ~ 40,
            dplyr::between(AGE_R, 45, 49) ~ 45
        ),
        preg_first_two_tri = dplyr::case_when(moscurrp < 7 ~ 1, TRUE ~ 0),
        preg_first_tri = dplyr::case_when(moscurrp < 4 ~ 1, TRUE ~ 0)
    )

preg_svy <- survey::svydesign(
    id =  ~secu,
    strata =  ~sest,
    weights =  ~WGT2017_2019,
    data = preg_df,
    nest = TRUE
)

preg_prob <- survey::svyby(
    formula = ~preg_first_two_tri + preg_first_tri,
    by = ~age_bin,
    design = preg_svy,
    FUN = survey::svymean,
    parm = NA,
    vartype = c("se", "ci"),
    level = .95
) |>
    dplyr::as_tibble()

## Save ----
saveRDS(
    preg_prob,
    here::here("data", "probability_of_pregnancy.RDS")
)

## Verify we have the right survey weights and are nesting correct by comparing
## these results to the official documentation found at:
## https://www.cdc.gov/nchs/data/nsfg/NSFG-2017-2019-VarEst-Ex1-508.pdf

# test_df <- min_df |>
#     transmute(
#         WGT2017_2019,
#         secu,
#         sest,
#         agerx = case_when(
#             AGE_R <= 19 ~ 1,
#             between(AGE_R, 20, 24) ~ 2,
#             between(AGE_R, 25, 29) ~ 3,
#             between(AGE_R, 30, 34) ~ 4,
#             between(AGE_R, 35, 39) ~ 5,
#             AGE_R >= 40 ~ 6
#         ),
#         cpill = case_when(CONSTAT1 == 6 ~ 1, TRUE ~ 0)
#     )
#
# test_svy <- svydesign(
#     id =  ~ secu,
#     strata =  ~ sest,
#     weights =  ~ WGT2017_2019,
#     data = test_df,
#     nest = TRUE
# )
#
# svyby(
#     formula = ~ cpill,
#     by = ~ agerx,
#     design = test_svy,
#     FUN = svymean,
#     parm = NA,
#     vartype = c("se", "ci"),
#     level = .95
# )
