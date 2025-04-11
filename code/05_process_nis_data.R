## 05_process_nis_data.R ----
##
## Process the raw National Interview Survey data from the most recent years to
## 2004 (the years with harmonized variables). Note here, when possible, I try
## to use the original ingestion scripts. There were some errors in a few of
## them (see ./data_raw/README.md), so I addressed those. When no ingestion
## script was available, I manually imported the data and double checked it
## against the original code book. These data are used to get the state- and
## age-specific immunity profiles for the model.

## Imports ----
library(tidyverse)
library(here)
library(fs)
library(Hmisc) ## NIS source files require this package
source(here::here("code", "utils.R"))

## Constants ----
YEARS <- 2023:2007

## Loop through and run the ingestion scripts, if available ----
for (i in 1:NROW(YEARS)) {
    YEAR <- sprintf("%0.2d", YEARS[i] - 2000)

    ## No 2015 ingestion script
    if (YEAR == "15") next

    F_PATH <- here::here("data", "nis_processed", sprintf("nispuf%s.RDS", YEAR))

    if (!fs::file_exists(F_PATH)) {
        ## Save environment so we can clean up after
        OLD_ENV <- ls()

        ## Source path
        S_PATH <- fs::dir_ls(
            here::here("data_raw", "nis_raw"),
            type = "file",
            regexp = sprintf(".%s\\.[Rr]{1}\\>", YEAR)
        )

        ## Find starting and ending lines of the script
        raw_script <- readLines(S_PATH)
        START <- which(substr(raw_script, 1, 8) == "flatfile") + 1
        END <- which(substr(raw_script, 1, 5) == "save(") - 1

        ## Create the variable the source file needs
        flatfile <- fs::dir_ls(
            here::here("data_raw", "nis_raw"),
            type = "file",
            regexp = sprintf(".%s\\.[DATdat]{3}\\>", YEAR)
        )

        ## Run relevant lines of the source file
        source_lines(S_PATH, START:END)

        ## Save the new object
        OBJ <- ls()[grepl(sprintf("\\<NISPUF%s\\>", YEAR), ls())]
        saveRDS(get(OBJ), F_PATH, compress = "xz")

        ## Clean up environment to make sure next script works
        rm(list = setdiff(ls(), OLD_ENV))
        gc()
    }
}

## Read in the years that do NOT have ingestion scripts ----
fwf_dict <- dplyr::tribble(
    ~year, ~start, ~end, ~col_names,
    2004, 1, 6, "SEQNUMC",
    2004, 7, 11, "SEQNUMHH",
    2004, 58, 58, "AGEGRP",
    2004, 108, 109, "STATE",
    2004, 33, 36, "YEAR",
    2004, 106, 107, "ITRUEIAP",
    2004, 22, 31, "WGT",
    2004, 136, 136, "P_UTDMMX",
    2004, 139, 139, "P_UTDPOL",
    2004, 141, 141, "P_UTDTP4",
    2005, 1, 6, "SEQNUMC",
    2005, 7, 11, "SEQNUMHH",
    2005, 81, 81, "AGEGRP",
    2005, 143, 144, "STATE",
    2005, 51, 54, "YEAR",
    2005, 141, 142, "ESTIAP",
    2005, 13, 31, "PROVWT",
    2005, 195, 195, "P_UTDMMX",
    2005, 198, 198, "P_UTDPOL",
    2005, 200, 200, "P_UTDTP4",
    2006, 1, 6, "SEQNUMC",
    2006, 7, 11, "SEQNUMHH",
    2006, 89, 89, "AGEGRP",
    2006, 160, 161, "STATE",
    2006, 51, 54, "YEAR",
    2006, 157, 159, "ESTIAP06",
    2006, 13, 31, "PROVWT",
    2006, 221, 221, "P_UTDMMX",
    2006, 224, 224, "P_UTDPOL",
    2006, 226, 226, "P_UTDTP4",
    2015, 1, 6, "SEQNUMC",
    2015, 7, 11, "SEQNUMHH",
    2015, 102, 102, "AGEGRP",
    2015, 183, 184, "STATE",
    2015, 95, 98, "YEAR",
    2015, 91, 94, "STRATUM",
    2015, 13, 32, "PROVWT_D",
    2015, 255, 255, "P_UTDMMX",
    2015, 259, 259, "P_UTDPOL",
    2015, 262, 262, "P_UTDTP4"
)

for (y in unique(fwf_dict$year)) {
    F_PATH <- here::here(
        "data",
        "nis_processed",
        sprintf("nispuf_minimal_%0.2d.RDS", y - 2000)
    )

    if (!fs::file_exists(F_PATH)) {
        sub_dict <- fwf_dict |> dplyr::filter(year == y)

        T_PATH <- fs::dir_ls(
            here::here("data_raw", "nis_raw"),
            regexp = sprintf(".%0.2d\\.[DATdat]{3}\\>", y - 2000)
        )

        temp_df <- readr::read_fwf(
            T_PATH,
            col_positions = readr::fwf_positions(
                start = sub_dict$start,
                end = sub_dict$end,
                col_names = sub_dict$col_names
            ),
            col_types = "ccncnnnnnn",
            na = c(" ", ".")
        )

        saveRDS(temp_df, F_PATH, compress = "xz")
    }
}
