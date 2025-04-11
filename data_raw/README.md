## `data_raw`

- **`Natality, 2007-2023.txt`**
  - Downloaded from [the CDC WONDER](https://wonder.cdc.gov/controller/saved/D66/D419F382) portal on 1/1/2025 and is used for the state- and age-specific birth rates in the simulation. 
- **`Multiple Cause of Death, 1999-2020.txt`**
  - Downloaded from [the CDC WONDER](https://wonder.cdc.gov/controller/saved/D77/D419F383) portal on 1/1/2025 and is used for the state- and age-specific mortality rates in the simulation.
- **`Bridged-Race Population Estimates 1990-2020.txt`**
  - Downloaded from [the CDC WONDER](https://wonder.cdc.gov/controller/saved/D178/D419F419) portal on 1/2/2025 and is used for the state- and age-specific population estimates in the simulation.
- **`Vaccination_Coverage_among_Young_Children__0-35_Months__20250401.csv`**
    - Downloaded from [data.cdc.gov](https://data.cdc.gov/Child-Vaccinations/Vaccination-Coverage-among-Young-Children-0-35-Mon/fhky-rtsk/about_data) on 4/1/2025 and is used to compare our vaccination rate estimates to the (modeled) CDC vaccination rates — never used in the actual simulation. 

- Everything in the **`./data_raw/nis_raw`** folder was downloaded from [the NCHS website](https://www.cdc.gov/nis/php/datasets-child/index.html?CDC_AA_refVal=https%3A%2F%2Fwww.cdc.gov%2Fvaccines%2Fimz-managers%2Fnis%2Fdatasets.html) on 1/6/2025.
  - 2015 to present is the default page and includes all files from `NISPUF15.DAT` through `NISPUF23.DAT` (and the corresponding `R` ingestion scripts).
  - [2010-2014 is here](https://www.cdc.gov/nchs/nis/data_files.htm) and includes all files from `nispuf10.dat` through `nispuf14.dat` (and the corresponding `R` ingestion scripts).
  - [2009 and before is here](https://www.cdc.gov/nchs/nis/data_files_09_prior.htm) and includes files from `nispuf04dat.zip` through `nispuf09dat` (and the corresponding `R` ingestion scripts — noting that there are no available ingestion scripts for 2004-2006).
  - The `./data_raw/nis_raw/codebooks` folder contains codebooks for 2004, 2005, 2006, and 2015, which were manually parsed and provide only the minimal data required for our analyses. 
- **`cdc_yearly_measles.csv`** was downloaded from the [CDC Measles](https://www.cdc.gov/measles/data-research/index.html) dashboard on 1/28/2025 and is only used for model calibration (i.e., is not used in the actual simulation).
- Everything in the **`./data_raw_nsfg_raw`** folder was downloaded from the [CDC FTP](https://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NSFG/) on 2/7/2025 and is only used to find the probability of a random woman being in the first or second trimester of pregnancy (conditional on age).
- **`National Population Projections 2014-2060.txt`**
    - Downloaded from [the CDC WONDER](http://wonder.cdc.gov/controller/saved/D117/D423F159) portal on 2/7/2025 and is only used to get the age-specific proportion of the population that is female

## Notes about the NIS data

- About `NISPUF22.R`. **This file, as downloaded, will not run.** Specifically, Lines 158 and 165 contain vectors with empty arguments. To make this file run, I modified both lines by inserting an `NA` into the first argument of the vector. This matches the command from all other scripts. 
- About `nispuf07.r`. **This file, as downloaded, will not run on MacOS.** There is an "incomplete final line" error on the original file. I modified the final by deleting two extra final lines at the end and creating a newline manually. 
- The files for 2004, 2005, 2006, and 2007 are all compressed. I uncompressed the files but otherwise did not modify them. 
- There is no ingestion script for 2004, 2005, 2006, or 2015. 
  - The [2015 link leads to a dead URL](https://www.cdc.gov/vaccines/imz-managers/nis/downloads/nis-puf15.r).
  - No links are provided for 2004-2006.
