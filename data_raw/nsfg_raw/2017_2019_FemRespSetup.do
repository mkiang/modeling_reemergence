/**************************************************************************
 |                                                                         
 |           NATIONAL SURVEY OF FAMILY GROWTH (NSFG), 2017-2019
 |
 |                      STATA Female Data Setup File
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do nsfg_female_setup.do)
 |
 **************************************************************************/

set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from NCHS
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "data-filename"
local dict "dictionary-filename"
local outfile "stata-datafile"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear

/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/

label data "National Survey of Family Growth (NSFG), 2017-2019"

#delimit ;
 label define rscrninf
   1 "Yes"
   5 "No"
   7 "Not ascertained";

 label define rscrage
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years"
  31 "31 years"
  32 "32 years"
  33 "33 years"
  34 "34 years"
  35 "35 years"
  36 "36 years"
  37 "37 years"
  38 "38 years"
  39 "39 years"
  40 "40 years"
  41 "41 years"
  42 "42 years"
  43 "43 years"
  44 "44 years"
  45 "45 years"
  46 "46 years"
  47 "47 years"
  48 "48 years"
  49 "49 years"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define rscrhisp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define rscrrace
   1 "Other race groups"
   2 "Black or African American"
   3 "White"
   4 "Hispanic"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define AGE_A
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years"
  31 "31 years"
  32 "32 years"
  33 "33 years"
  34 "34 years"
  35 "35 years"
  36 "36 years"
  37 "37 years"
  38 "38 years"
  39 "39 years"
  40 "40 years"
  41 "41 years"
  42 "42 years"
  43 "43 years"
  44 "44 years"
  45 "45 years"
  46 "46 years"
  47 "47 years"
  48 "48 years"
  98 "Refused"
  99 "Don't know";

 label define AGE_R
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years"
  31 "31 years"
  32 "32 years"
  33 "33 years"
  34 "34 years"
  35 "35 years"
  36 "36 years"
  37 "37 years"
  38 "38 years"
  39 "39 years"
  40 "40 years"
  41 "41 years"
  42 "42 years"
  43 "43 years"
  44 "44 years"
  45 "45 years"
  46 "46 years"
  47 "47 years"
  48 "48 years"
  98 "Refused"
  99 "Don't know";

 label define agescrn
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years"
  31 "31 years"
  32 "32 years"
  33 "33 years"
  34 "34 years"
  35 "35 years"
  36 "36 years"
  37 "37 years"
  38 "38 years"
  39 "39 years"
  40 "40 years"
  41 "41 years"
  42 "42 years"
  43 "43 years"
  44 "44 years"
  45 "45 years"
  46 "46 years"
  47 "47 years"
  48 "48 years"
  49 "49 years"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define hisp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hispgrp
   1 "Mexican, Mexican American, or Chicana, only"
   2 "All other Hispanic or Latina groups, including multiple responses"
   8 "Refused"
   9 "Don't know";

 label define PRIMLANG1
   1 "English"
   2 "Spanish"
   7 "Other"
   8 "Refused"
   9 "Don't know";

 label define PRIMLANG2
   1 "English"
   2 "Spanish"
   7 "Other"
   8 "Refused"
   9 "Don't know";

 label define PRIMLANG3
   1 "English"
   2 "Spanish"
   7 "Other"
   8 "Refused"
   9 "Don't know";

 label define roscnt
   1 "1 HOUSEHOLD MEMBER"
   2 "2 HOUSEHOLD MEMBERS"
   3 "3 HOUSEHOLD MEMBERS"
   4 "4 HOUSEHOLD MEMBERS"
   5 "5 HOUSEHOLD MEMBERS"
   6 "6 HOUSEHOLD MEMBERS"
   7 "7 HOUSEHOLD MEMBERS"
   8 "8 OR MORE HOUSEHOLD MEMBERS"
  98 "Refused"
  99 "Don't know";

 label define numchild
   0 "No children"
   1 "1 child"
   2 "2 children"
   3 "3 children"
   4 "4 children or more";

 label define HHKIDS18
   0 "No children"
   1 "1 child"
   2 "2 children"
   3 "3 children"
   4 "4 children"
   5 "5 or more children";

 label define DAUGHT918
   0 "No daughters"
   1 "1 daughter"
   2 "2 or more daughters";

 label define SON918
   0 "0 SONS"
   1 "1 SON"
   2 "2 OR MORE SONS";

 label define nonbiokids
   0 "No children"
   1 "1 child"
   2 "2 or more children";

 label define marstat
   1 "Married to a person of the opposite sex"
   2 "Not married but living together with a partner of the opposite sex"
   3 "Widowed"
   4 "Divorced or annulled"
   5 "Separated, because you and your spouse are not getting along"
   6 "Never been married"
   8 "Refused"
   9 "Don't know";

 label define fmarstat
   3 "Widowed"
   4 "Divorced or annulled"
   5 "Separated, because you and your spouse are not getting along"
   6 "Never been married"
   8 "Refused"
   9 "Don't know";

 label define fmarit
   0 "DON'T KNOW/REFUSED"
   1 "married"
   2 "widowed"
   3 "divorced"
   4 "separated"
   5 "NEVER MARRIED";

 label define evrmarry
   0 "NEVER MARRIED"
   1 "EVER MARRIED";

 label define hplocale
   1 "In household"
   2 "Lives elsewhere"
   8 "Refused"
   9 "Don't know";

 label define manrel
   1 "husband"
   2 "MALE COHABITING PARTNER"
   8 "Refused"
   9 "Don't know";

 label define goschol
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define vaca
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define higrade
   9 "9th grade or less"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1 year of college or less"
  14 "2 years of college"
  15 "3 years of college"
  16 "4 years of college/grad school"
  17 "5 years of college/grad school"
  18 "6 years of college/grad school"
  19 "7 or more years of college and/or grad school"
  98 "Refused"
  99 "Don't know";

 label define compgrd
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define dipged
   1 "High school diploma"
   2 "GED only"
   3 "Both"
   5 "Neither"
   8 "Refused"
   9 "Don't know";

 label define EARNHS_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define hischgrd
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  98 "Refused"
  99 "Don't know";

 label define lstgrade
   9 "9TH GRADE OR LESS"
  10 "10TH GRADE"
  11 "11TH GRADE"
  12 "12TH GRADE"
  13 "1 YEAR OF COLLEGE/GRAD SCHOOL"
  14 "2 YEARS OF COLLEGE/GRAD SCHOOL"
  15 "3 YEARS OF COLLEGE/GRAD SCHOOL"
  16 "4 YEARS OF COLLEGE/GRAD SCHOOL"
  17 "5 YEARS OF COLLEGE/GRAD SCHOOL"
  18 "6 YEARS OF COLLEGE/GRAD SCHOOL"
  19 "7+ YEARS OF COLLEGE/GRAD SCHOOL"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define MYSCHOL_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define havedeg
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define degrees
   1 "Associate's degree"
   2 "Bachelor's degree"
   3 "Master's degree"
   4 "Doctorate degree"
   5 "Professional school degree"
   8 "Refused"
   9 "Don't know";

 label define EARNBA_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define expschl
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define expgrade
  12 "12th grade or less"
  13 "1 year of college or less"
  14 "2 years of college"
  15 "3 years of college"
  16 "4 years of college/grad school"
  17 "5 years of college/grad school"
  18 "6 years of college/grad school"
  19 "7 or more years of college and/or grad school"
  98 "Refused"
  99 "Don't know";

 label define wthparnw
   1 "Both biological or adoptive parents"
   2 "Other or no parental figures"
   8 "Refused"
   9 "Don't know";

 label define onown
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ONOWN18
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define intact
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define parmarr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define INTACT18
   1 "Yes"
   2 "No"
   8 "Refused"
   9 "Don't know";

 label define LVSIT14F
   1 "Biological mother or adoptive mother"
   2 "Other mother figure"
   3 "No mother figure"
   8 "Refused"
   9 "Don't know";

 label define LVSIT14M
   1 "Biological father or adoptive father"
   2 "Step-father"
   3 "No father figure"
   4 "Other father figure"
   8 "Refused"
   9 "Don't know";

 label define womrasdu
   1 "Biological mother"
   2 "Other mother figure"
   3 "No mother figure"
   8 "Refused"
   9 "Don't know";

 label define momdegre
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college, including 2-year degrees"
   4 "Bachelor's degree or higher"
   8 "Refused"
   9 "Don't know";

 label define momworkd
   1 "Full-time"
   2 "Part-time"
   3 "Equal amounts full-time and part-time"
   4 "Not at all (for pay)"
   8 "Refused"
   9 "Don't know";

 label define momfstch
   1 "LESS THAN 18 YEARS"
   2 "18-19 YEARS"
   3 "20-24 YEARS"
   4 "25-29 YEARS"
   5 "30 OR OLDER"
  96 "MOTHER OR MOTHER-FIGURE DID NOT HAVE ANY CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define MOM18
   1 "Under 18"
   2 "18-19"
   3 "20-24"
   4 "25 or older"
   8 "Refused"
   9 "Don't know";

 label define manrasdu
   1 "Biological father"
   2 "Step-father"
   3 "No father figure"
   4 "Other father figure"
   8 "Refused"
   9 "Don't know";

 label define fosterev
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define mnyfster
   1 "1 setting or location"
   2 "2 settings or locations"
   3 "3 settings or locations"
   4 "4 settings or locations"
   5 "5 or more settings or locations"
  98 "Refused"
  99 "Don't know";

 label define durfster
   1 "Less than six months"
   2 "At least six months, but less than a year"
   3 "At least a year but less than two years"
   4 "At least two years but less than three years"
   5 "Three years or more"
   8 "Refused"
   9 "Don't know";

 label define agefster
   1 "UNDER 6 YEARS"
   2 "6-12 YEARS"
   3 "13-17 YEARS"
   4 "18 YEARS AND OLDER"
  98 "Refused"
  99 "Don't know";

 label define menarche
   8 "8 OR YOUNGER"
   9 "9 YEARS"
  10 "10 YEARS"
  11 "11 YEARS"
  12 "12 YEARS"
  13 "13 YEARS"
  14 "14 YEARS"
  96 "PERIODS HAVE NOT YET BEGUN"
  98 "Refused"
  99 "Don't know";

 label define pregnowq
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define maybpreg
   1 "Probably pregnant"
   5 "Probably not pregnant"
   8 "Refused"
   9 "Don't know";

 label define everpreg
   1 "yes"
   5 "no";

 label define currpreg
   1 "yes"
   5 "no";

 label define moscurrp
  98 "Refused"
  99 "Don't know";

 label define hasbabes
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define cmlastlb
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmlstprg
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define nplaced
   0 "none"
   1 "1 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define ndied
   0 "none"
   1 "1 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define nadoptv
   0 "none"
   1 "1 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define totplacd
   0 "none"
   1 "1 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define otherkid
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define nothrkid
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define relothkd
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define adptotkd
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define tryadopt
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define tryeithr
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME1
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define othkdfos
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD2
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD2
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR2
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME2
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD3
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD3
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR3
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME3
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD4
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD4
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR4
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME4
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD5
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD5
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT5
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR5
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME5
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS5
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD6
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD6
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT6
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR6
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME6
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS6
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD7
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD7
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT7
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR7
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME7
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS7
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD8
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD8
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT8
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR8
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME8
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS8
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD9
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD9
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT9
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR9
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME9
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS9
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD10
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD10
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT10
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR10
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME10
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS10
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD11
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD11
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT11
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR11
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME11
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS11
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD12
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD12
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR12
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME12
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD13
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD13
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT13
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR13
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME13
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS13
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD14
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD14
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT14
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR14
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME14
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS14
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD15
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD15
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT15
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR15
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME15
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS15
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD16
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD16
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT16
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR16
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME16
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS16
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD17
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD17
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT17
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR17
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME17
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS17
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RELOTHKD18
   1 "Your husband's child (stepchild)"
   2 "The child of a blood relative"
   3 "The child of a relative by marriage"
   4 "The child of a friend"
   5 "Your boyfriend or partner's child"
   6 "Related to you in some other way"
   7 "Unrelated to you previously in any way"
   8 "Refused"
   9 "Don't know";

 label define ADPTOTKD18
   1 "Yes, adopted"
   3 "Yes, became guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define TRYADOPT18
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TRYEITHR18
   1 "Yes, trying to adopt"
   3 "Yes, trying to become guardian"
   5 "No, neither"
   8 "Refused"
   9 "Don't know";

 label define NBAGECAME18
   1 "Younger than 5 years old"
   2 "5-12 years old"
   3 "13 years or older";

 label define OTHKDFOS18
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define everadpt
   1 "YES, HAS ADOPTED A CHILD"
   3 "NO, BUT IS CURRENTLY TRYING TO ADOPT SPECIFIC CHILD"
   5 "NO, AND NOT TRYING TO ADOPT A SPECIFIC CHILD";

 label define seekadpt
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define contagem
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define trylong
   1 "Less than 1 year"
   2 "1-2 years"
   3 "Or longer than 2 years"
   8 "Refused"
   9 "Don't know";

 label define knowadpt
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evwntano
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evcontag
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define turndown
   1 "Turned down"
   2 "Unable to find child"
   3 "Decided not to pursue"
   8 "Refused"
   9 "Don't know";

 label define yquittry
   1 "Adoption process only"
   2 "Own situation only"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define APROCESS1
   1 "Fees were too high"
   2 "There were not enough kids available"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define APROCESS2
   1 "Fees were too high"
   2 "There were not enough kids available"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define APROCESS3
   1 "Fees were too high"
   2 "There were not enough kids available"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define hrdembryo
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SRCEMBRYO_1
   1 "Health professional or counselor"
   2 "Relative or friend"
   3 "Television, radio or a magazine"
   4 "Internet"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SRCEMBRYO_2
   1 "Health professional or counselor"
   2 "Relative or friend"
   3 "Television, radio or a magazine"
   4 "Internet"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SRCEMBRYO_3
   1 "Health professional or counselor"
   2 "Relative or friend"
   3 "Television, radio or a magazine"
   4 "Internet"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SRCEMBRYO_4
   1 "Health professional or counselor"
   2 "Relative or friend"
   3 "Television, radio or a magazine"
   4 "Internet"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SRCEMBRYO_5
   1 "Health professional or counselor"
   2 "Relative or friend"
   3 "Television, radio or a magazine"
   4 "Internet"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define timesmar
   1 "1 TIME"
   2 "2 TIMES"
   3 "3 TIMES"
   4 "4 TIMES"
   5 "5 TIMES"
   6 "6 TIMES"
  98 "Refused"
  99 "Don't know";

 label define hsbverif
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hxagemar
  98 "Refused"
  99 "Don't know";

 label define lvtoghx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STRTOGHX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define engaghx
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define HSBRACE1
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define HSBNRACE1
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define chedmarn
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define marbefhx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define kidshx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define numkdshx
   1 "1 CHILD"
   2 "2 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define kidlivhx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18A
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18B
   0 "none"
  98 "Refused"
  99 "Don't know";

 label define WHRCHKDS1
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCHKDS2
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCHKDS3
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define supporch
   1 "Yes"
   5 "No"
   6 "IF VOLUNTEERED: JOINT PHYSICAL CUSTODY"
   8 "Refused"
   9 "Don't know";

 label define biohusbx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define bionumhx
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define HXAGEMAR2
  98 "Refused"
  99 "Don't know";

 label define LVTOGHX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STRTOGHX_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define ENGAGHX2
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define HSBRACE2
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define HSBNRACE2
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define CHEDMARN2
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define MARBEFHX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define KIDSHX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NUMKDSHX2
   1 "1 CHILD"
   2 "2 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define KIDLIVHX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18A2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18B2
   0 "none"
  98 "Refused"
  99 "Don't know";

 label define WHRCHKDS5
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCHKDS6
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define SUPPORCH2
   1 "Yes"
   5 "No"
   6 "IF VOLUNTEERED: JOINT PHYSICAL CUSTODY"
   8 "Refused"
   9 "Don't know";

 label define BIOHUSBX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMHX2
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define HXAGEMAR3
  98 "Refused"
  99 "Don't know";

 label define LVTOGHX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STRTOGHX_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define ENGAGHX3
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define HSBRACE3
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define HSBNRACE3
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define CHEDMARN3
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define MARBEFHX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define KIDSHX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NUMKDSHX3
   1 "1 CHILD"
   2 "2 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define KIDLIVHX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18A3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18B3
   0 "none"
  98 "Refused"
  99 "Don't know";

 label define WHRCHKDS9
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCHKDS10
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define SUPPORCH3
   1 "Yes"
   5 "No"
   6 "IF VOLUNTEERED: JOINT PHYSICAL CUSTODY"
   8 "Refused"
   9 "Don't know";

 label define BIOHUSBX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMHX3
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define HXAGEMAR4
  98 "Refused"
  99 "Don't know";

 label define LVTOGHX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STRTOGHX_Y4
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define ENGAGHX4
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define HSBRACE4
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define HSBNRACE4
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define CHEDMARN4
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define MARBEFHX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define KIDSHX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NUMKDSHX4
   1 "1 CHILD"
   2 "2 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define KIDLIVHX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18A4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CHKID18B4
   0 "none"
  98 "Refused"
  99 "Don't know";

 label define WHRCHKDS13
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCHKDS14
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define SUPPORCH4
   1 "Yes"
   5 "No"
   6 "IF VOLUNTEERED: JOINT PHYSICAL CUSTODY"
   8 "Refused"
   9 "Don't know";

 label define BIOHUSBX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMHX4
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define cmmarrch
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define prevhusb
   0 "none"
   1 "1 FORMER HUSBAND"
   2 "2 FORMER HUSBANDS"
   3 "3 FORMER HUSBANDS"
   4 "4 FORMER HUSBANDS"
  98 "Refused"
  99 "Don't know";

 label define WNSTRTCP_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cpherage
  98 "Refused"
  99 "Don't know";

 label define cphisage
  98 "Refused"
  99 "Don't know";

 label define CPENGAG1
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define willmarr
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define curcohrace
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define curcohnrace
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define cpeduc
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define cpmarbef
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define cpkids
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define cpnumkds
   1 "1 CHILD"
   2 "2 OR MORE CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define cpkidliv
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CPKID18A
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CPKID18B
   0 "none"
  98 "Refused"
  99 "Don't know";

 label define WHRCPKDS1
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCPKDS2
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define WHRCPKDS3
   1 "In this household"
   2 "With their mother"
   3 "With grandparents or other relatives"
   4 "Somewhere else"
   8 "Refused"
   9 "Don't know";

 label define supporcp
   1 "Yes"
   5 "No"
   6 "IF VOLUNTEERED: JOINT PHYSICAL CUSTODY"
   8 "Refused"
   9 "Don't know";

 label define biocp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define bionumcp
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define cmstrthp
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define liveoth
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evrcohab
   1 "yes"
   5 "no";

 label define hmothmen
   1 "1 MAN"
   2 "2 MEN"
   3 "3 MEN"
   4 "4 OR MORE MEN"
  98 "Refused"
  99 "Don't know";

 label define prevcohb
   0 "none"
   1 "1 FORMER COHABITING PARTNER"
   2 "2 FORMER COHABITING PARTNERS"
   3 "3 FORMER COHABITING PARTNERS"
   4 "4 OR MORE COHABITING PARTNERS"
  98 "Refused"
  99 "Don't know";

 label define STRTOTHX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define heragecx
  98 "Refused"
  99 "Don't know";

 label define hisagecx
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define ENGAG1CX
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define COH1RACE
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define COH1NRACE
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define marevcx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define cxkids
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define biofcpx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define bionumcx
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define STPTOGCX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define STRTOTHX_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define HERAGECX2
  98 "Refused"
  99 "Don't know";

 label define HISAGECX2
  98 "Refused"
  99 "Don't know";

 label define ENGAG1CX2
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define MAREVCX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CXKIDS2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIOFCPX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMCX2
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define STPTOGCX_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define STRTOTHX_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define HERAGECX3
  98 "Refused"
  99 "Don't know";

 label define HISAGECX3
  98 "Refused"
  99 "Don't know";

 label define ENGAG1CX3
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define MAREVCX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CXKIDS3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIOFCPX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMCX3
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define STPTOGCX_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define STRTOTHX_Y4
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define HERAGECX4
  98 "Refused"
  99 "Don't know";

 label define HISAGECX4
  98 "Refused"
  99 "Don't know";

 label define ENGAG1CX4
   1 "YES, ENGAGED TO BE MARRIED"
   3 "NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
   5 "NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
   8 "Refused"
   9 "Don't know";

 label define MAREVCX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CXKIDS4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIOFCPX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BIONUMCX4
   1 "1 CHILD"
   2 "2 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define STPTOGCX_Y4
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cohchance
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define marrchance
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define pmarcoh
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define eversex
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define rhadsex
   1 "yes"
   5 "no";

 label define ynosex
   1 "Against religion or morals"
   2 "Don't want to get pregnant"
   3 "Don't want to get a sexually transmitted disease"
   4 "Haven't found the right person yet"
   5 "In a relationship, but waiting for the right time"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define grfstsx
   6 "6th grade or less"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year in college"
  14 "2nd year in college"
  15 "3rd year in college"
  16 "4th year in college"
  96 "Not in school"
  98 "Refused"
  99 "Don't know";

 label define sxmtonce
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TALKPAR1
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR2
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR3
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR4
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR5
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR6
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define TALKPAR7
   1 "How to say no to sex"
   2 "Methods of birth control"
   3 "Where to get birth control"
   4 "Sexually transmitted diseases"
   5 "How to prevent HIV/AIDS"
   6 "How to use a condom"
   8 "Waiting until marriage to have sex"
  95 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define sedno
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDNOLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDNOLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDNOLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDNOLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sednog
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sednosx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedbc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDBCLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDBCLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDBCLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDBCLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedbcg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedbcsx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedwhbc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDWHLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDWHLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDWHLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDWHLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedwhbcg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedwbcsx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedcond
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDCONLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDCONLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDCONLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDCONLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedcondg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedconsx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedstd
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDSTDLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDSTDLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDSTDLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDSTDLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedstdg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedstdsx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedhiv
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDHIVLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDHIVLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDHIVLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDHIVLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedhivg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedhivsx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sedabst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define SEDABLC1
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDABLC2
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDABLC3
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define SEDABLC4
   1 "School"
   2 "Church"
   3 "A community center"
   4 "Some other place"
   8 "Refused"
   9 "Don't know";

 label define sedabstg
   1 "1st grade"
   2 "2nd grade"
   3 "3rd grade"
   4 "4th grade"
   5 "5th grade"
   6 "6th grade"
   7 "7th grade"
   8 "8th grade"
   9 "9th grade"
  10 "10th grade"
  11 "11th grade"
  12 "12th grade"
  13 "1st year of college"
  14 "2nd year of college"
  15 "3rd year of college"
  16 "4th year of college"
  96 "Not in school when received instruction"
  98 "Refused"
  99 "Don't know";

 label define sedabssx
   1 "Before"
   2 "After"
   8 "Refused"
   9 "Don't know";

 label define sameman
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whofstpr
   1 "Your first former husband, [NAME], married [DATE], marriage ended [DATE]"
   2 "Your second former husband, [NAME], married [DATE], marriage ended [DATE]"
   3 "Your third former husband, [NAME], married [DATE], marriage ended [DATE]"
   4 "Your fourth former husband, [NAME], married [DATE], marriage ended [DATE]"
   5 "Your fifth former husband, [NAME], married [DATE], marriage ended [DATE]"
   6 "Your sixth former husband, [NAME], married [DATE], marriage ended [DATE]"
   7 "Your current husband, [NAME], married [DATE], still married or (Your husband, from whom you are separated, married [DATE], still married"
   8 "Your current partner, [NAME], began living together [DATE], still living together"
   9 "Your first former partner [NAME], began living together [DATE], stopped living together [DATE]"
  10 "Your second cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  11 "Your third cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  12 "Your fourth cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  20 "None of the Above"
  98 "Refused"
  99 "Don't know";

 label define knowfp
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define stilfpsx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define LSTSEXFP_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  96 "Only had sex once"
  98 "Refused"
  99 "Don't know";

 label define LSTSEXFP_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmlsexfp
9996 "Only had sex once with first partner"
9998 "Refused"
9999 "Don't know";

 label define cmfplast
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define fpothrel
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define fpeduc
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define fsexrace
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define fsexnrace
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define fprn
   2 "Engaged to him"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define WHICH1ST
   1 "Sexual intercourse"
   2 "Menstrual period"
   8 "Refused"
   9 "Don't know";

 label define sexafmen
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PTSB4MAR
   0 "none"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 PARTNERS"
   8 "8 PARTNERS"
   9 "9 PARTNERS"
  20 "20 OR MORE PARTNERS"
 998 "refused"
 999 "DON'T KNOW";

 label define WHOSNC1Y
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define matchfp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define matchhp
   1 "Your first former husband, [NAME], married [DATE], marriage ended [DATE]"
   2 "Your second former husband, [NAME], married [DATE], marriage ended [DATE]"
   3 "Your third former husband, [NAME], married [DATE], marriage ended [DATE]"
   4 "Your fourth former husband, [NAME], married [DATE], marriage ended [DATE]"
   5 "Your fifth former husband, [NAME], married [DATE], marriage ended [DATE]"
   6 "Your sixth former husband, [NAME], married [DATE], marriage ended [DATE]"
   7 "Your current husband, [NAME], married [DATE], still married or (Your husband, from whom you are separated, married [DATE], still married"
   8 "Your current partner, [NAME], began living together [DATE], still living together"
   9 "Your first former partner [NAME], began living together [DATE], stopped living together [DATE]"
  10 "Your second cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  11 "Your third cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  12 "Your fourth cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  20 "None of the Above"
  98 "Refused"
  99 "Don't know";

 label define P1YRELP
   1 "First former husband"
   2 "Second former husband"
   3 "Third former husband"
   4 "Fourth former husband"
   5 "Fifth former husband"
   6 "Sixth former husband"
   7 "Current husband or (current husband from whom she is separated)"
   8 "Current cohabiting partner"
   9 "First former cohabiting partner"
  10 "Second former cohabiting partner"
  11 "Third former cohabiting partner"
  12 "Fourth former cohabiting partner"
  13 "First sexual partner"
  20 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define cmlsex
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YLSEX_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define P1YLSEX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YCURRP
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pcurrnt
   1 "yes"
   5 "no";

 label define MATCHFP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MATCHHP2
   1 "Your first former husband, [NAME], married [DATE], marriage ended [DATE]"
   2 "Your second former husband, [NAME], married [DATE], marriage ended [DATE]"
   3 "Your third former husband, [NAME], married [DATE], marriage ended [DATE]"
   4 "Your fourth former husband, [NAME], married [DATE], marriage ended [DATE]"
   5 "Your fifth former husband, [NAME], married [DATE], marriage ended [DATE]"
   6 "Your sixth former husband, [NAME], married [DATE], marriage ended [DATE]"
   7 "Your current husband, [NAME], married [DATE], still married or (Your husband, from whom you are separated, married [DATE], still married"
   8 "Your current partner, [NAME], began living together [DATE], still living together"
   9 "Your first former partner [NAME], began living together [DATE], stopped living together [DATE]"
  10 "Your second cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  11 "Your third cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  12 "Your fourth cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  20 "None of the Above"
  98 "Refused"
  99 "Don't know";

 label define P1YRELP2
   1 "First former husband"
   2 "Second former husband"
   3 "Third former husband"
   4 "Fourth former husband"
   5 "Fifth former husband"
   6 "Sixth former husband"
   7 "Current husband or (current husband from whom she is separated)"
   8 "Current cohabiting partner"
   9 "First former cohabiting partner"
  10 "Second former cohabiting partner"
  11 "Third former cohabiting partner"
  12 "Fourth former cohabiting partner"
  13 "First sexual partner"
  20 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define CMLSEX2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YLSEX_M2
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define P1YLSEX_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YCURRP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PCURRNT2
   1 "yes"
   5 "no";

 label define MATCHFP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MATCHHP3
   1 "Your first former husband, [NAME], married [DATE], marriage ended [DATE]"
   2 "Your second former husband, [NAME], married [DATE], marriage ended [DATE]"
   3 "Your third former husband, [NAME], married [DATE], marriage ended [DATE]"
   4 "Your fourth former husband, [NAME], married [DATE], marriage ended [DATE]"
   5 "Your fifth former husband, [NAME], married [DATE], marriage ended [DATE]"
   6 "Your sixth former husband, [NAME], married [DATE], marriage ended [DATE]"
   7 "Your current husband, [NAME], married [DATE], still married or (Your husband, from whom you are separated, married [DATE], still married"
   8 "Your current partner, [NAME], began living together [DATE], still living together"
   9 "Your first former partner [NAME], began living together [DATE], stopped living together [DATE]"
  10 "Your second cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  11 "Your third cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  12 "Your fourth cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
  20 "None of the Above"
  98 "Refused"
  99 "Don't know";

 label define P1YRELP3
   1 "First former husband"
   2 "Second former husband"
   3 "Third former husband"
   4 "Fourth former husband"
   5 "Fifth former husband"
   6 "Sixth former husband"
   7 "Current husband or (current husband from whom she is separated)"
   8 "Current cohabiting partner"
   9 "First former cohabiting partner"
  10 "Second former cohabiting partner"
  11 "Third former cohabiting partner"
  12 "Fourth former cohabiting partner"
  13 "First sexual partner"
  20 "None of the above"
  98 "Refused"
  99 "Don't know";

 label define CMLSEX3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YLSEX_M3
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define P1YLSEX_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YCURRP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PCURRNT3
   1 "yes"
   5 "no";

 label define P1YOTHREL
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YRAGE
  98 "Refused"
  99 "Don't know";

 label define P1YHSAGE
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define P1YRF
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  96 "Only had sex once with this partner"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmfsex
9996 "Only had sex once with this partner"
9998 "Refused"
9999 "Don't know";

 label define cmfsextot
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YEDUC
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define P1YRACE1
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define P1YNRACE1
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define P1YRN
   2 "Engaged to him"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YOTHREL2
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YRAGE2
  98 "Refused"
  99 "Don't know";

 label define P1YHSAGE2
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define P1YRF2
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_M2
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  96 "Only had sex once with this partner"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMFSEX2
9996 "Only had sex once with this partner"
9998 "Refused"
9999 "Don't know";

 label define CMFSEXTOT2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YEDUC2
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define P1YRACE2
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define P1YNRACE2
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define P1YRN2
   2 "Engaged to him"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YOTHREL3
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YRAGE3
  98 "Refused"
  99 "Don't know";

 label define P1YHSAGE3
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define P1YRF3
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_M3
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  96 "Only had sex once with this partner"
  98 "Refused"
  99 "Don't know";

 label define P1YFSEX_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMFSEX3
9996 "Only had sex once with this partner"
9998 "Refused"
9999 "Don't know";

 label define CMFSEXTOT3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define P1YEDUC3
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college but no degree"
   4 "2-year college degree (e.g., Associate's degree)"
   5 "4-year college graduate (e.g., BA, BS)"
   6 "Graduate or professional school"
   8 "Refused"
   9 "Don't know";

 label define P1YRACE3
   1 "Black"
   2 "White"
   3 "Other"
   4 "NA/DK/RF";

 label define P1YNRACE3
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race"
   5 "NA/DK/RF";

 label define P1YRN3
   2 "Engaged to him"
   4 "Going with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else"
  98 "Refused"
  99 "Don't know";

 label define currprtt
   0 "none"
   1 "1 PARTNER";

 label define currprts
   0 "none"
   1 "1 PARTNER";

 label define CMCURRP1
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMCURRP2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMCURRP3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define evertubs
   1 "Yes"
   3 "If volunteered: Operation failed"
   4 "If volunteered: Had Essure procedure"
   5 "No"
   6 "If volunteered: Operation already reversed"
   8 "Refused"
   9 "Don't know";

 label define essure
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define everhyst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define everovrs
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define everothr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whtooprc
   1 "Operation affects only one tube"
   2 "Operation affects only one ovary"
   3 "Some other operation"
   4 "Other sterilizing operation"
   8 "Refused"
   9 "Don't know";

 label define onotfunc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define dfnlstrl
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define anytubal
   1 "yes"
   5 "no";

 label define hyst
   1 "yes"
   5 "no";

 label define ovarem
   1 "yes"
   5 "no";

 label define othr
   1 "yes"
   5 "no";

 label define anyfster
   1 "yes"
   5 "no";

 label define anyopsmn
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whatopsm
   1 "Vasectomy"
   2 "Other operation"
   5 "If volunteered: Operation failed"
   6 "If volunteered: Operation already reversed"
   8 "Refused"
   9 "Don't know";

 label define dfnlstrm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define anymster
   1 "yes"
   5 "no";

 label define anyvas
   1 "yes"
   5 "no";

 label define othrm
   1 "yes"
   2 "no";

 label define DATFEMOP_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define plcfemop
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, or public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PAYRSTER1
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER2
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER3
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define rhadall
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hhadall
   1 "Yes"
   5 "No"
   6 "If volunteered: R was not in a relationship with a man at the time she had this operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS1
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS2
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS3
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS4
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS5
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define bcreas
   1 "Yes"
   5 "No"
   6 "No, not using any method at the time"
   8 "Refused"
   9 "Don't know";

 label define bcwhyf
   1 "Health or medical problem"
   2 "Some other reason"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define mincdnnr
   1 "You had all the children you wanted"
   2 "Your husband or partner had all the children he wanted"
   3 "Medical reasons"
   4 "Problems with other methods of birth control"
   5 "Some other reason not mentioned above"
   8 "Refused"
   9 "Don't know";

 label define DATFEMOP_Y2
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define PLCFEMOP2
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, or public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PAYRSTER6
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER7
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER8
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define RHADALL2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HHADALL2
   1 "Yes"
   5 "No"
   6 "If volunteered: R was not in a relationship with a man at the time she had this operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS7
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS8
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS9
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS10
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS11
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define BCREAS2
   1 "Yes"
   5 "No"
   6 "No, not using any method at the time"
   8 "Refused"
   9 "Don't know";

 label define BCWHYF2
   1 "Health or medical problem"
   2 "Some other reason"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define MINCDNNR2
   1 "You had all the children you wanted"
   2 "Your husband or partner had all the children he wanted"
   3 "Medical reasons"
   4 "Problems with other methods of birth control"
   5 "Some other reason not mentioned above"
   8 "Refused"
   9 "Don't know";

 label define DATFEMOP_Y3
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define PLCFEMOP3
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, or public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PAYRSTER11
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER12
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER13
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define RHADALL3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HHADALL3
   1 "Yes"
   5 "No"
   6 "If volunteered: R was not in a relationship with a man at the time she had this operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS13
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS14
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS15
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS16
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS17
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define BCREAS3
   1 "Yes"
   5 "No"
   6 "No, not using any method at the time"
   8 "Refused"
   9 "Don't know";

 label define BCWHYF3
   1 "Health or medical problem"
   2 "Some other reason"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define MINCDNNR3
   1 "You had all the children you wanted"
   2 "Your husband or partner had all the children he wanted"
   3 "Medical reasons"
   4 "Problems with other methods of birth control"
   5 "Some other reason not mentioned above"
   8 "Refused"
   9 "Don't know";

 label define DATFEMOP_Y4
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define PLCFEMOP4
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, or public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PAYRSTER16
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER17
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYRSTER18
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define RHADALL4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HHADALL4
   1 "Yes"
   5 "No"
   6 "If volunteered: R was not in a relationship with a man at the time she had this operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS19
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS20
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS21
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS22
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define FMEDREAS23
   1 "Medical problems with your female organs"
   2 "Pregnancy would be dangerous to your health"
   3 "You would probably lose a pregnancy"
   4 "You would probably have an unhealthy child"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define BCREAS4
   1 "Yes"
   5 "No"
   6 "No, not using any method at the time"
   8 "Refused"
   9 "Don't know";

 label define BCWHYF4
   1 "Health or medical problem"
   2 "Some other reason"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define MINCDNNR4
   1 "You had all the children you wanted"
   2 "Your husband or partner had all the children he wanted"
   3 "Medical reasons"
   4 "Problems with other methods of birth control"
   5 "Some other reason not mentioned above"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME5
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OPERSAME6
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define DATEOPMN_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define withimop
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define VASJAN4YR
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define placopmn
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, or public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PAYMSTER1
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define PAYMSTER2
   1 "Insurance"
   2 "Co-payment or out-of-pocket payment"
   3 "Medicaid"
   4 "No payment required"
   5 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define rhadallm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hhadallm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MEDREAS1
   1 "Pregnancy would be dangerous to your health"
   2 "You would probably lose a pregnancy"
   3 "You would probably have an unhealthy child"
   4 "He had health problem that required the operation"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define MEDREAS2
   1 "Pregnancy would be dangerous to your health"
   2 "You would probably lose a pregnancy"
   3 "You would probably have an unhealthy child"
   4 "He had health problem that required the operation"
   5 "Some other medical reason"
   6 "No medical reason for operation"
   8 "Refused"
   9 "Don't know";

 label define bcreasm
   1 "Yes"
   5 "No"
   6 "No, not using any method at the time"
   8 "Refused"
   9 "Don't know";

 label define bcwhym
   1 "Health or medical problem"
   2 "Some other reason"
   3 "Both"
   8 "Refused"
   9 "Don't know";

 label define mincdnmn
   1 "You had all the children you wanted"
   2 "Your husband or partner had all the children he wanted"
   3 "Medical reasons"
   4 "Problems with other methods of birth control"
   5 "Some other reason not mentioned above"
   8 "Refused"
   9 "Don't know";

 label define revstubl
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define DATRVSTB_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define revsvasx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define DATRVVEX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define tubs
   1 "yes"
   5 "no";

 label define vasect
   1 "yes"
   5 "no";

 label define rsurgstr
   1 "yes"
   5 "no";

 label define psurgstr
   1 "yes"
   5 "no";

 label define onlytbvs
   1 "yes"
   5 "no";

 label define rwantrvt
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define manwantt
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define rwantrev
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define manwantr
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define posiblpg
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define reasimpr
   1 "Impossible due to problems with ovulation"
   2 "Impossible due to problems with uterus, cervix, or fallopian tubes"
   3 "Impossible due to other illnesses or treatment for other illnesses such as cancer"
   4 "Impossible due to menopause"
  20 "Impossible for other reasons"
  30 "R volunteers it is not impossible for her"
  98 "Refused"
  99 "Don't know";

 label define posiblmn
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define reasimpp
   1 "Impossible due to problems with sperm or semen"
   2 "Impossible due to testicular problems or varicocele"
   3 "Impossible due to other illnesses or treatment for other illnesses"
   4 "Impossible for other reasons"
   8 "Refused"
   9 "Don't know";

 label define canhaver
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define REASDIFF1
   1 "You have difficulty getting pregnant"
   2 "You have difficulty carrying baby to term"
   3 "Pregnancy is dangerous to your health"
   4 "You are likely to have an unhealthy baby"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASDIFF2
   1 "You have difficulty getting pregnant"
   2 "You have difficulty carrying baby to term"
   3 "Pregnancy is dangerous to your health"
   4 "You are likely to have an unhealthy baby"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASDIFF3
   1 "You have difficulty getting pregnant"
   2 "You have difficulty carrying baby to term"
   3 "Pregnancy is dangerous to your health"
   4 "You are likely to have an unhealthy baby"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASDIFF4
   1 "You have difficulty getting pregnant"
   2 "You have difficulty carrying baby to term"
   3 "Pregnancy is dangerous to your health"
   4 "You are likely to have an unhealthy baby"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASDIFF5
   1 "You have difficulty getting pregnant"
   2 "You have difficulty carrying baby to term"
   3 "Pregnancy is dangerous to your health"
   4 "You are likely to have an unhealthy baby"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define canhavem
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pregnono
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define REASNONO1
   1 "Dangerous for you"
   2 "Dangerous for your baby"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASNONO2
   1 "Dangerous for you"
   2 "Dangerous for your baby"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define REASNONO3
   1 "Dangerous for you"
   2 "Dangerous for your baby"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define rstrstat
   0 "NOT STERILE"
   1 "SURGICALLY STERILE"
   2 "NONSURGICALLY STERILE"
   8 "Refused"
   9 "Don't know";

 label define pstrstat
   0 "NOT STERILE"
   1 "SURGICALLY STERILE"
   2 "NONSURGICALLY STERILE"
   8 "Refused"
   9 "Don't know";

 label define lastper
   1 "Within the past 4 weeks"
   2 "Longer ago than 4 weeks, but less than 3 months"
   3 "Longer ago than 3 months, but less than 6 months"
   4 "Longer ago than 6 months, but less than 1 year"
   5 "Longer ago than 1 year"
  95 "If volunteered: Before last birth or pregnancy"
  98 "Refused"
  99 "Don't know";

 label define TRYPREG12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pill
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define condom
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define vasectmy
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define depoprov
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define widrawal
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define rhythm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define sdaycbds
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define tempsafe
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define patch
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ring
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define mornpill
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ectimesx
   1 "1"
  98 "Refused"
  99 "Don't know";

 label define ECREASON1
   1 "You were worried your birth control method would not work"
   2 "You didn't use birth control that time"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define ECREASON2
   1 "You were worried your birth control method would not work"
   2 "You didn't use birth control that time"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define ECREASON3
   1 "You were worried your birth control method would not work"
   2 "You didn't use birth control that time"
   3 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define ecrx
   1 "With a prescription"
   2 "Without a prescription"
   8 "Refused"
   9 "Don't know";

 label define ecwhere
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Friend"
  12 "Partner or spouse"
  13 "Drug store"
  14 "Mail order/Internet"
  15 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define ecwhen
   1 "Yes (Within the last 12 months)"
   2 "No (Over 12 months ago)"
   8 "Refused"
   9 "Don't know";

 label define OTHRMETH01
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH02
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH03
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH04
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH05
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH06
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define OTHRMETH07
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method -- specify"
  24 "Lunelle"
  95 "No other methods ever used"
  98 "Refused"
  99 "Don't know";

 label define EVIUDTYP1
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define EVIUDTYP2
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define EVIUDTYP3
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define newmeth
   1 "Abstinence"
   2 "Tubal ligation/female sterilization"
   3 "Vaginal contraceptive film"
   4 "Other method, not shown separately"
   5 "Response was coded as a method in EA-1 through EA-14"
   8 "Refused"
   9 "Don't know";

 label define everused
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define methdiss
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define METHSTOP01
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP02
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP03
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP04
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP05
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP06
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP07
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP08
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP09
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define METHSTOP10
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables (shots)"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  21 "Other method"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define whenpill
   1 "Yes (stopped within the last 12 months)"
   5 "No (stopped over 12 months ago)"
   8 "Refused"
   9 "Don't know";

 label define REASPILL01
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL02
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL03
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL04
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL05
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL06
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL07
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL08
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASPILL09
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL1
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL2
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL3
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL4
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL5
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPPILL6
   1 "Can't remember to take pill (regularly)"
   2 "Interfered with other medications"
   3 "Weight gain"
   4 "Headaches/migraines"
   5 "Mood swings/depression"
   6 "Bleeding problems (spotting, too much, irregularly)"
   7 "Hair loss"
   8 "Nausea/sickness"
   9 "Skin problems"
  10 "Hormonal problems/changes"
  11 "Didn't like/Didn't want to use"
  12 "Concerns about risks, such as breast cancer"
  13 "Not effective at preventing cramps"
  14 "Weight loss"
  15 "Menstrual cramps"
  16 "Leg cramps"
  17 "Dizziness"
  18 "Decreased sex drive"
  19 "High blood pressure"
  20 "Blood clots"
  21 "Fatigue"
  22 "Other side effects"
  23 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define whencond
   1 "Yes (stopped within the last 12 months)"
   5 "No (stopped over 12 months ago)"
   8 "Refused"
   9 "Don't know";

 label define REASCOND01
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND02
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND03
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND04
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND05
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND06
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASCOND07
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define STOPCOND1
   1 "Allergy (latex/spermicide)"
   2 "Didn't like it / Didn't like how it felt"
   3 "Pain/discomfort/irritation"
   4 "Yeast infection"
   5 "Worried it would fall off / break / not prevent pregnancy"
   6 "Inconvenient"
   7 "Not spontaneous"
   8 "Frustrating to use"
   9 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPCOND2
   1 "Allergy (latex/spermicide)"
   2 "Didn't like it / Didn't like how it felt"
   3 "Pain/discomfort/irritation"
   4 "Yeast infection"
   5 "Worried it would fall off / break / not prevent pregnancy"
   6 "Inconvenient"
   7 "Not spontaneous"
   8 "Frustrating to use"
   9 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define wheniud
   1 "Yes (stopped within the last 12 months)"
   5 "No (stopped over 12 months ago)"
   8 "Refused"
   9 "Don't know";

 label define TYPEIUD_1
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define TYPEIUD_2
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define TYPEIUD_3
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define REASIUD01
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD02
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD03
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD04
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD05
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD06
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD07
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define REASIUD08
   1 "Too expensive"
   2 "Insurance did not cover it"
   3 "Too difficult to use"
   4 "Too messy"
   5 "Your partner did not like it"
   6 "You had side effects"
   7 "You were worried you might have side effects"
   8 "You worried the method would not work"
   9 "The method failed, you became pregnant"
  10 "The method did not protect against disease"
  11 "Because of other health problems, a doctor told you that you should not use the method again"
  12 "The method decreased your sexual pleasure"
  13 "Too difficult to obtain the method"
  14 "Did not like the changes to your menstrual cycle"
  15 "Other -- specify"
  98 "Refused"
  99 "Don't know";

 label define STOPIUD1
   1 "Weight gain"
   2 "Bleeding problems (spotting, too much, irregularly)"
   3 "Headaches/migraines"
   4 "Mood swings/depression"
   5 "Hair loss or growth"
   6 "Vaginal infection"
   7 "Abdominal pain or cramping; back pain"
   8 "Skin problems"
   9 "Pain or discomfort during intercourse"
  10 "Nausea/sickness"
  11 "IUD moved or was expelled"
  12 "Other side effects"
  13 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPIUD2
   1 "Weight gain"
   2 "Bleeding problems (spotting, too much, irregularly)"
   3 "Headaches/migraines"
   4 "Mood swings/depression"
   5 "Hair loss or growth"
   6 "Vaginal infection"
   7 "Abdominal pain or cramping; back pain"
   8 "Skin problems"
   9 "Pain or discomfort during intercourse"
  10 "Nausea/sickness"
  11 "IUD moved or was expelled"
  12 "Other side effects"
  13 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPIUD3
   1 "Weight gain"
   2 "Bleeding problems (spotting, too much, irregularly)"
   3 "Headaches/migraines"
   4 "Mood swings/depression"
   5 "Hair loss or growth"
   6 "Vaginal infection"
   7 "Abdominal pain or cramping; back pain"
   8 "Skin problems"
   9 "Pain or discomfort during intercourse"
  10 "Nausea/sickness"
  11 "IUD moved or was expelled"
  12 "Other side effects"
  13 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPIUD4
   1 "Weight gain"
   2 "Bleeding problems (spotting, too much, irregularly)"
   3 "Headaches/migraines"
   4 "Mood swings/depression"
   5 "Hair loss or growth"
   6 "Vaginal infection"
   7 "Abdominal pain or cramping; back pain"
   8 "Skin problems"
   9 "Pain or discomfort during intercourse"
  10 "Nausea/sickness"
  11 "IUD moved or was expelled"
  12 "Other side effects"
  13 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define STOPIUD5
   1 "Weight gain"
   2 "Bleeding problems (spotting, too much, irregularly)"
   3 "Headaches/migraines"
   4 "Mood swings/depression"
   5 "Hair loss or growth"
   6 "Vaginal infection"
   7 "Abdominal pain or cramping; back pain"
   8 "Skin problems"
   9 "Pain or discomfort during intercourse"
  10 "Nausea/sickness"
  11 "IUD moved or was expelled"
  12 "Other side effects"
  13 "Other (Too few cases, not classifiable elsewhere)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define LARC10
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define larcremv
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define REMOVWHY_1
   1 "I wanted to get pregnant"
   2 "I didn't like the side effects"
   3 "The method caused complications (for example, moved inside your body)"
   4 "It was expired and I needed a new one"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMOVWHY_2
   1 "I wanted to get pregnant"
   2 "I didn't like the side effects"
   3 "The method caused complications (for example, moved inside your body)"
   4 "It was expired and I needed a new one"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMOVWHY_3
   1 "I wanted to get pregnant"
   2 "I didn't like the side effects"
   3 "The method caused complications (for example, moved inside your body)"
   4 "It was expired and I needed a new one"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMOVWHY_4
   1 "I wanted to get pregnant"
   2 "I didn't like the side effects"
   3 "The method caused complications (for example, moved inside your body)"
   4 "It was expired and I needed a new one"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMOVWHY_5
   1 "I wanted to get pregnant"
   2 "I didn't like the side effects"
   3 "The method caused complications (for example, moved inside your body)"
   4 "It was expired and I needed a new one"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define removdif
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define REMVDIFY_1
   1 "Provider discouraged me from getting implant or IUD removed"
   2 "Provider didn't know how to remove implant or IUD"
   3 "Insurance didn't cover removal of implant or IUD"
   4 "Complications because of the method (for example: moved, became lodged)"
   5 "I still have my implant or IUD because I can't get it removed"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMVDIFY_2
   1 "Provider discouraged me from getting implant or IUD removed"
   2 "Provider didn't know how to remove implant or IUD"
   3 "Insurance didn't cover removal of implant or IUD"
   4 "Complications because of the method (for example: moved, became lodged)"
   5 "I still have my implant or IUD because I can't get it removed"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define REMVDIFY_3
   1 "Provider discouraged me from getting implant or IUD removed"
   2 "Provider didn't know how to remove implant or IUD"
   3 "Insurance didn't cover removal of implant or IUD"
   4 "Complications because of the method (for example: moved, became lodged)"
   5 "I still have my implant or IUD because I can't get it removed"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define FIRSMETH1
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FIRSMETH2
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FIRSMETH3
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FIRSMETH4
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define numfirsm
   0 "0"
   1 "1"
  98 "Refused"
  99 "Don't know";

 label define drugdev
   1 "Yes"
   5 "No"
  98 "Refused"
  99 "Don't know";

 label define DRUGDEV2
   1 "Yes"
   5 "No"
  98 "Refused"
  99 "Don't know";

 label define DRUGDEV3
   1 "Yes"
   5 "No"
  98 "Refused"
  99 "Don't know";

 label define DRUGDEV4
   1 "Yes"
   5 "No"
  98 "Refused"
  99 "Don't know";

 label define FIRSTIME1
   2 "The first time you had intercourse"
   3 "Less than a month after your first intercourse"
   4 "One to three months after first intercourse"
   5 "Four to twelve months after first intercourse"
   6 "More than twelve months after first intercourse"
   8 "Refused"
   9 "Don't know";

 label define FIRSTIME2
   1 "Before your first intercourse"
   2 "The first time you had intercourse"
   3 "Less than a month after your first intercourse"
   4 "One to three months after first intercourse"
   5 "Four to twelve months after first intercourse"
   6 "More than twelve months after first intercourse"
   8 "Refused"
   9 "Don't know";

 label define usefstsx
   1 "yes"
   5 "no"
  98 "Refused"
  99 "Don't know";

 label define cmfirsm
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MTHFSTSX1
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFSTSX2
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFSTSX3
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFSTSX4
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define WNFSTUSE_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define WNFSTUSE_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmfstuse
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define fmethprs
   0 "1st meth was nonprescription"
   1 "1st meth was prescription";

 label define FMETHPRS2
   0 "1st meth was nonprescription"
   1 "1st meth was prescription";

 label define FMETHPRS3
   0 "1st meth was nonprescription"
   1 "1st meth was prescription";

 label define FMETHPRS4
   0 "1st meth was nonprescription"
   1 "1st meth was prescription";

 label define agefstus
  98 "Refused"
  99 "Don't know";

 label define placgotf
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Friend"
  12 "Partner or spouse"
  13 "Drug store"
  14 "Mail order/Internet"
  15 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PLACGOTF2
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Friend"
  12 "Partner or spouse"
  13 "Drug store"
  14 "Mail order/Internet"
  15 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PLACGOTF3
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Friend"
  12 "Partner or spouse"
  13 "Drug store"
  14 "Mail order/Internet"
  15 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define PLACGOTF4
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Friend"
  12 "Partner or spouse"
  13 "Drug store"
  14 "Mail order/Internet"
  15 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define usefrsts
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MTHFRSTS1
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFRSTS2
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFRSTS3
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define MTHFRSTS4
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define INTR_EC3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define monsx
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX5
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX6
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX7
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX8
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX9
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX10
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX11
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX13
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX14
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX15
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX16
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX17
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX18
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX19
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX20
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX21
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX22
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX23
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX24
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX25
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX26
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX27
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX28
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX29
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX30
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX31
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX32
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX33
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX34
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX35
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX36
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX37
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX38
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX39
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX40
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX41
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX42
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX43
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX44
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX45
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX46
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX47
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MONSX48
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define cmstrtmc
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmendmc
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define INTR_ED4A
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MC1MONS1
 995 "R reported a month and year instead"
 998 "Refused"
 999 "Don't know";

 label define MC1SIMSQ
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define MC1MONS2
 995 "R reported a month and year instead"
 998 "Refused"
 999 "Don't know";

 label define MC1MONS3
 995 "R reported a month and year instead"
 998 "Refused"
 999 "Don't know";

 label define DATBEGIN_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define DATBEGIN_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmdatbegin
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CURRMETH1
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define CURRMETH2
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define CURRMETH3
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define CURRMETH4
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define LSTMONMETH1
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define LSTMONMETH2
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define LSTMONMETH3
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define LSTMONMETH4
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define PILL_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define DIAPH_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define IUD_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define IMPLANT_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define DEPO_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define CERVC_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define MPILL_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define PATCH_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define RING_12
   1 "Used in past 12 months"
   5 "Not used in past 12 mos or dk/rf"
   8 "Refused"
   9 "Don't know";

 label define METHX1
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX2
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX3
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX4
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX5
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX6
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX7
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX8
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX9
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX10
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX11
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX12
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX13
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX14
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX15
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX16
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX17
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX18
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX19
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX20
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX21
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX22
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX23
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX24
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX25
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX26
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX27
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX28
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX29
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX30
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX31
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX32
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX33
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX34
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX35
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX36
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX37
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX38
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX39
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX40
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX41
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX42
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX43
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX44
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX45
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX46
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX47
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX48
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX49
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX50
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX51
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX52
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX53
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX54
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX55
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX56
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX57
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX58
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX59
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX60
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX61
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX62
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX63
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX64
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX65
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX66
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX67
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX68
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX69
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX70
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX71
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX72
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX73
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX74
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX75
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX76
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX77
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX78
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX79
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX80
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX81
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX82
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX83
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX84
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX85
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX86
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX87
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX88
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX89
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX90
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX91
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX92
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX93
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX94
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX95
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX96
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX97
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX98
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX99
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX100
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX101
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX102
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX103
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX104
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX105
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX106
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX107
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX108
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX109
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX110
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX111
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX112
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX113
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX114
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX115
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX116
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX117
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX118
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX119
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX120
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX121
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX122
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX123
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX124
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX125
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX126
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX127
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX128
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX129
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX130
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX131
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX132
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX133
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX134
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX135
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX136
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX137
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX138
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX139
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX140
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX141
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX142
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX143
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX144
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX145
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX146
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX147
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX148
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX149
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX150
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX151
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX152
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX153
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX154
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX155
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX156
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX157
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX158
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX159
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX160
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX161
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX162
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX163
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX164
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX165
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX166
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX167
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX168
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX169
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX170
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX171
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX172
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX173
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX174
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX175
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX176
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX177
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX178
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX179
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX180
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX181
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX182
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX183
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX184
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX185
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX186
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX187
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX188
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX189
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX190
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX191
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define METHX192
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX1
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX2
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX3
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX4
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX5
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX6
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX7
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX8
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX9
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX10
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX11
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX12
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX13
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX14
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX15
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX16
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX17
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX18
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX19
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX20
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX21
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX22
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX23
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX24
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX25
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX26
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX27
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX28
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX29
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX30
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX31
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX32
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX33
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX34
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX35
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX36
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX37
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX38
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX39
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX40
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX41
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX42
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX43
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX44
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX45
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX46
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX47
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define NUMMULTX48
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
  98 "Refused"
  99 "Don't know";

 label define SALMX1
   0 "No"
   1 "Yes";

 label define SALMX2
   0 "No"
   1 "Yes";

 label define SALMX3
   0 "No"
   1 "Yes";

 label define SALMX4
   0 "No"
   1 "Yes";

 label define SALMX5
   0 "No"
   1 "Yes";

 label define SALMX6
   0 "No"
   1 "Yes";

 label define SALMX7
   0 "No"
   1 "Yes";

 label define SALMX8
   0 "No"
   1 "Yes";

 label define SALMX9
   0 "No"
   1 "Yes";

 label define SALMX10
   0 "No"
   1 "Yes";

 label define SALMX11
   0 "No"
   1 "Yes";

 label define SALMX12
   0 "No"
   1 "Yes";

 label define SALMX13
   0 "No"
   1 "Yes";

 label define SALMX14
   0 "No"
   1 "Yes";

 label define SALMX15
   0 "No"
   1 "Yes";

 label define SALMX16
   0 "No"
   1 "Yes";

 label define SALMX17
   0 "No"
   1 "Yes";

 label define SALMX18
   0 "No"
   1 "Yes";

 label define SALMX19
   0 "No"
   1 "Yes";

 label define SALMX20
   0 "No"
   1 "Yes";

 label define SALMX21
   0 "No"
   1 "Yes";

 label define SALMX22
   0 "No"
   1 "Yes";

 label define SALMX23
   0 "No"
   1 "Yes";

 label define SALMX24
   0 "No"
   1 "Yes";

 label define SALMX25
   0 "No"
   1 "Yes";

 label define SALMX26
   0 "No"
   1 "Yes";

 label define SALMX27
   0 "No"
   1 "Yes";

 label define SALMX28
   0 "No"
   1 "Yes";

 label define SALMX29
   0 "No"
   1 "Yes";

 label define SALMX30
   0 "No"
   1 "Yes";

 label define SALMX31
   0 "No"
   1 "Yes";

 label define SALMX32
   0 "No"
   1 "Yes";

 label define SALMX33
   0 "No"
   1 "Yes";

 label define SALMX34
   0 "No"
   1 "Yes";

 label define SALMX35
   0 "No"
   1 "Yes";

 label define SALMX36
   0 "No"
   1 "Yes";

 label define SALMX37
   0 "No"
   1 "Yes";

 label define SALMX38
   0 "No"
   1 "Yes";

 label define SALMX39
   0 "No"
   1 "Yes";

 label define SALMX40
   0 "No"
   1 "Yes";

 label define SALMX41
   0 "No"
   1 "Yes";

 label define SALMX42
   0 "No"
   1 "Yes";

 label define SALMX43
   0 "No"
   1 "Yes";

 label define SALMX44
   0 "No"
   1 "Yes";

 label define SALMX45
   0 "No"
   1 "Yes";

 label define SALMX46
   0 "No"
   1 "Yes";

 label define SALMX47
   0 "No"
   1 "Yes";

 label define SALMX48
   0 "No"
   1 "Yes";

 label define SAYX1
   0 "No"
   1 "Yes";

 label define SAYX2
   0 "No"
   1 "Yes";

 label define SAYX3
   0 "No"
   1 "Yes";

 label define SAYX4
   0 "No"
   1 "Yes";

 label define SAYX5
   0 "No"
   1 "Yes";

 label define SAYX6
   0 "No"
   1 "Yes";

 label define SAYX7
   0 "No"
   1 "Yes";

 label define SAYX8
   0 "No"
   1 "Yes";

 label define SAYX9
   0 "No"
   1 "Yes";

 label define SAYX10
   0 "No"
   1 "Yes";

 label define SAYX11
   0 "No"
   1 "Yes";

 label define SAYX12
   0 "No"
   1 "Yes";

 label define SAYX13
   0 "No"
   1 "Yes";

 label define SAYX14
   0 "No"
   1 "Yes";

 label define SAYX15
   0 "No"
   1 "Yes";

 label define SAYX16
   0 "No"
   1 "Yes";

 label define SAYX17
   0 "No"
   1 "Yes";

 label define SAYX18
   0 "No"
   1 "Yes";

 label define SAYX19
   0 "No"
   1 "Yes";

 label define SAYX20
   0 "No"
   1 "Yes";

 label define SAYX21
   0 "No"
   1 "Yes";

 label define SAYX22
   0 "No"
   1 "Yes";

 label define SAYX23
   0 "No"
   1 "Yes";

 label define SAYX24
   0 "No"
   1 "Yes";

 label define SAYX25
   0 "No"
   1 "Yes";

 label define SAYX26
   0 "No"
   1 "Yes";

 label define SAYX27
   0 "No"
   1 "Yes";

 label define SAYX28
   0 "No"
   1 "Yes";

 label define SAYX29
   0 "No"
   1 "Yes";

 label define SAYX30
   0 "No"
   1 "Yes";

 label define SAYX31
   0 "No"
   1 "Yes";

 label define SAYX32
   0 "No"
   1 "Yes";

 label define SAYX33
   0 "No"
   1 "Yes";

 label define SAYX34
   0 "No"
   1 "Yes";

 label define SAYX35
   0 "No"
   1 "Yes";

 label define SAYX36
   0 "No"
   1 "Yes";

 label define SAYX37
   0 "No"
   1 "Yes";

 label define SAYX38
   0 "No"
   1 "Yes";

 label define SAYX39
   0 "No"
   1 "Yes";

 label define SAYX40
   0 "No"
   1 "Yes";

 label define SAYX41
   0 "No"
   1 "Yes";

 label define SAYX42
   0 "No"
   1 "Yes";

 label define SAYX43
   0 "No"
   1 "Yes";

 label define SAYX44
   0 "No"
   1 "Yes";

 label define SAYX45
   0 "No"
   1 "Yes";

 label define SAYX46
   0 "No"
   1 "Yes";

 label define SAYX47
   0 "No"
   1 "Yes";

 label define SAYX48
   0 "No"
   1 "Yes";

 label define SIMSEQX1
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX2
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX3
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX4
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX5
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX6
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX7
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX8
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX9
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX10
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX11
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX12
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX13
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX14
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX15
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX16
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX17
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX18
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX19
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX20
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX21
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX22
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX23
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX24
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX25
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX26
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX27
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX28
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX29
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX30
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX31
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX32
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX33
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX34
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX35
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX36
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX37
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX38
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX39
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX40
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX41
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX42
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX43
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX44
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX45
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX46
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX47
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define SIMSEQX48
   1 "Same time"
   2 "Different times"
   8 "Refused"
   9 "Don't know";

 label define uselstp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define wynolstp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hplstp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define LSTMTHP1
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP2
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP3
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP4
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define lpiudtyp
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define usefstp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FSTMTHP1
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP2
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP3
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP4
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define USELSTP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define WYNOLSTP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HPLSTP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define LSTMTHP5
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP6
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP7
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP8
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LPIUDTYP2
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define USEFSTP2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FSTMTHP5
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP6
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP7
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP8
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define USELSTP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define WYNOLSTP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HPLSTP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define LSTMTHP9
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP10
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP11
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LSTMTHP12
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define LPIUDTYP3
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define USEFSTP3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FSTMTHP9
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP10
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP11
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define FSTMTHP12
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method -- specify"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  24 "Lunelle injectable (monthly shot)"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  98 "Refused"
  99 "Don't know";

 label define wynotuse
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hppregq
   1 "Yes"
   5 "No"
   6 "(If volunteered:) no current partner"
   8 "Refused"
   9 "Don't know";

 label define DURTRY_N
  95 "Not trying to get pregnant"
  98 "Refused"
  99 "Don't know";

 label define DURTRY_P
   1 "Months"
   2 "Years"
   8 "Refused"
   9 "Don't know";

 label define WHYNOUSING1
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define WHYNOUSING2
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define WHYNOUSING3
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define WHYNOUSING4
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define WHYNOUSING5
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define WHYNOTPG1
   1 "Diagnosis of repro problems/condition"
   2 "Prior preg or attempt: problems with or treatments/ART needed"
   3 "Prior unprotected sex, no preg"
   4 "Perceive infertile or difficulty getting preg/carrying to term"
   5 "Menopause related"
   6 "One ovary/fallopian tube/low or no ovulation"
   7 "Endometriosis"
   8 "Breastfeeding"
   9 "Partner sterile"
  10 "Not having sex"
  11 "Other"
  12 "Too old (R or partner)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define WHYNOTPG2
   1 "Diagnosis of repro problems/condition"
   2 "Prior preg or attempt: problems with or treatments/ART needed"
   3 "Prior unprotected sex, no preg"
   4 "Perceive infertile or difficulty getting preg/carrying to term"
   5 "Menopause related"
   6 "One ovary/fallopian tube/low or no ovulation"
   7 "Endometriosis"
   8 "Breastfeeding"
   9 "Partner sterile"
  10 "Not having sex"
  11 "Other"
  12 "Too old (R or partner)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define mainnouse
   1 "You do not expect to have sex"
   2 "You do not think you can get pregnant"
   3 "You don't really mind if you get pregnant"
   4 "You are worried about the side effects of birth control"
   5 "Your male partner does not want you to use a birth control method"
   6 "Your male partner himself does not want to use a birth control method"
   7 "(IF VOLUNTEERED:)Respondent is using a method"
   8 "You could not get a method"
   9 "You are not taking, or using, your method consistently"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL1
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL2
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL3
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL4
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL5
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL6
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEPILL7
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define iudtype
   1 "Copper-bearing (such as Copper-T or ParaGard)"
   2 "Hormonal IUD (such as Mirena, Skyla, Liletta, or Kyleena)"
   3 "Other"
   8 "Refused"
   9 "Don't know";

 label define YUSEIUD1
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEIUD2
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEIUD3
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEIUD4
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEIUD5
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define YUSEIUD6
   1 "Birth control"
   2 "Cramps, or pain during menstrual periods"
   3 "Treatment for acne"
   4 "Treatment for endometriosis"
   5 "Other reasons"
   6 "To regulate your menstrual periods"
   7 "To reduce menstrual bleeding"
   8 "Treatment for hot flashes or other peri-menopausal symptoms"
  98 "Refused"
  99 "Don't know";

 label define ekmethod
   1 "No method used"
   2 "EMPTY (IF JAN)/Same as previous month"
   3 "Birth control pills"
   4 "Condom"
   5 "Partner's vasectomy"
   6 "Female sterilizing operation, such as tubal sterilization and hysterectomy"
   7 "Withdrawal, pulling out"
   8 "Depo-Provera, injectables"
   9 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
  10 "Calendar rhythm, Standard Days, or Cycle Beads method"
  11 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  12 "Diaphragm"
  13 "Female condom, vaginal pouch"
  14 "Foam"
  15 "Jelly or cream"
  16 "Cervical cap"
  17 "Suppository, insert"
  18 "Today sponge"
  19 "iud"
  20 "Emergency contraception"
  21 "Other method"
  22 "Respondent was sterile"
  23 "Respondent's partner was sterile"
  25 "Contraceptive patch (Ortho-Evra or Xulane)"
  26 "Vaginal contraceptive ring"
  55 "EMPTY (IF JAN)/Same method used thru end of year"
  98 "Refused"
  99 "Don't know";

 label define curbcplc
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define numpills
   1 "1 month"
   2 "2 months"
   3 "3 months"
  12 "12 months"
  98 "Refused"
  99 "Don't know";

 label define CURBCPAY1
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define CURBCPAY2
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define CURBCPAY3
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define curbcins
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NOUSEINS1
   1 "Insurance doesn't cover my method supplies"
   2 "I had not yet met my insurance deductible"
   3 "I did not want to use insurance because someone might find out about it"
   4 "I did not need to use insurance because the method supplies were free"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define NOUSEINS2
   1 "Insurance doesn't cover my method supplies"
   2 "I had not yet met my insurance deductible"
   3 "I did not want to use insurance because someone might find out about it"
   4 "I did not need to use insurance because the method supplies were free"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define NOUSEINS3
   1 "Insurance doesn't cover my method supplies"
   2 "I had not yet met my insurance deductible"
   3 "I did not want to use insurance because someone might find out about it"
   4 "I did not need to use insurance because the method supplies were free"
   5 "Some other reason"
   8 "Refused"
   9 "Don't know";

 label define curbcamt
   1 "Under $10"
   2 "$10-$25"
   3 "$26-$50"
   4 "$51-$100"
   5 "Over $100"
   8 "Refused"
   9 "Don't know";

 label define NOCOST1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NOCOST2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PST4WKSX
 998 "Refused"
 999 "Don't know";

 label define PSWKCOND1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PSWKCOND2
 998 "Refused"
 999 "Don't know";

 label define COND1BRK
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define COND1OFF
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define condbrfl
   0 "Not at all or never"
 998 "Refused"
 999 "Don't know";

 label define condoff
   0 "Not at all or never"
 998 "Refused"
 999 "Don't know";

 label define misspill
   1 "Never missed"
   2 "Missed only one"
   3 "Missed two or more"
   4 "Did not use pill over past 4 weeks"
   8 "Refused"
   9 "Don't know";

 label define P12MOCON
   1 "Every time"
   2 "Most of the time"
   3 "About half of the time"
   4 "Some of the time"
   5 "None of the time"
   8 "Refused"
   9 "Don't know";

 label define pxnofreq
   1 "Every time"
   2 "Most of the time"
   3 "About half of the time"
   4 "Some of the time"
   5 "None of the time"
   8 "Refused"
   9 "Don't know";

 label define BTHCON12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MEDTST12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BCCNS12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STEROP12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STCNS12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define EMCON12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ECCNS12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NUMMTH12
   0 "No methods"
   1 "1 method"
   8 "Refused"
   9 "Don't know";

 label define PRGTST12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ABORT12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PAP12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PELVIC12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PRENAT12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PARTUM12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STDSVC12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BARRIER1
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define BARRIER2
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define BARRIER3
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define BARRIER4
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define BARRIER5
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define BARRIER6
   1 "I did not need to see a doctor in the last year"
   2 "I did not know where to go for care"
   3 "I could not afford to pay for a visit"
   4 "I was afraid to hear bad news"
   5 "I had privacy/confidentiality concerns"
   6 "I could not take time off from work"
   7 "Insurance"
   8 "Not sexually active"
   9 "Time/busy"
  10 "Didn't make appt"
  11 "Don't like/trust doctors"
  20 "Something else (please specify)"
  98 "Refused"
  99 "Don't know";

 label define NUMSVC12
   0 "No services"
   1 "1 service"
   2 "2 services"
  98 "Refused"
  99 "Don't know";

 label define numbcvis
   1 "Single visit"
   5 "More than one visit"
   8 "Refused"
   9 "Don't know";

 label define BC12PLCX
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX2
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX3
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX4
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX5
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX6
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX7
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX8
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX9
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX10
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX11
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX12
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX13
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX14
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define BC12PLCX15
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood Clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care or walk-in facility"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define idclinic
   0 "0"
   1 "1"
   2 "2"
   3 "3"
   4 "4"
   5 "5"
   6 "6"
   7 "7"
   8 "8"
   9 "9"
  10 "10"
  11 "11"
  12 "12";

 label define TALKPROV_1
   1 "Birth control methods (including IUD and implants)"
   2 "Condoms for STD prevention"
   3 "HPV vaccine"
   4 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define TALKPROV_2
   1 "Birth control methods (including IUD and implants)"
   2 "Condoms for STD prevention"
   3 "HPV vaccine"
   4 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define TALKPROV_3
   1 "Birth control methods (including IUD and implants)"
   2 "Condoms for STD prevention"
   3 "HPV vaccine"
   4 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define whypstd
   1 "Could walk in or get same-day appointment"
   2 "Cost"
   3 "Privacy concern"
   4 "Expert care here"
   5 "Embarrassed to go to usual provider"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define whynostd
   1 "Didn't want parents to find out"
   2 "Concerned about confidentiality"
   3 "Doctor or health care provider never suggested it"
   4 "Embarrassed or difficult to ask to be tested"
   5 "Cost or lack of insurance"
   6 "Other";

 label define bcclarc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX1
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX2
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX3
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX4
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX7
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX8
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX9
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX10
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX13
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX14
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX15
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX16
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX19
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX20
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX21
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX22
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX25
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX26
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX27
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX28
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX31
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX32
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX33
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX34
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX37
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX38
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX39
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX40
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX43
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX44
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX45
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX46
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX49
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX50
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX51
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX52
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX55
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX56
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX57
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX58
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX61
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX62
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX63
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX64
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX67
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX68
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX69
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX70
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX73
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX74
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX75
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX76
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX79
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX80
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX81
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX82
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX85
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX86
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX87
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define BC12PAYX88
   1 "Insurance"
   2 "Co-payment"
   3 "Out-of-pocket payment"
   4 "Medicaid"
   5 "No payment required"
   6 "Some other way"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_01
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_02
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_03
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_04
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_05
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_06
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_07
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_08
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_09
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_10
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_11
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_12
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_13
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_14
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define REGCAR12_F_15
   1 "Regular place"
   2 "Regular place, but go to more than 1 place regularly"
   3 "Usually go somewhere else"
   4 "No usual place"
   8 "Refused"
   9 "Don't know";

 label define everfpc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define KNDMDHLP01
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP02
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP03
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP04
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP05
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP06
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP07
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP08
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define KNDMDHLP09
   1 "A method of birth control (or prescription)"
   2 "Birth control counseling"
   3 "Emergency contraception"
   4 "Counseling about Emergency Contraception"
   5 "A check-up or test for birth control"
   6 "A pregnancy test"
   7 "An abortion"
   8 "A Pap smear or pelvic exam"
   9 "Post-pregnancy care"
  10 "STD or HIV testing"
  20 "Other"
  98 "Refused"
  99 "Don't know";

 label define lastpap
   1 "A year ago or less"
   2 "More than 1 year ago but not more than 2 years"
   3 "More than 2 years ago but not more than 3 years"
   4 "More than 3 years ago but not more than 5 years"
   5 "Over 5 years ago"
   6 "Never had Pap test"
   8 "Refused"
   9 "Don't know";

 label define mreaspap
   1 "Part of a routine exam"
   2 "Because of a medical problem"
   3 "Other reason"
   8 "Refused"
   9 "Don't know";

 label define agefpap
  12 "12 years or younger"
  13 "13 years"
  14 "14 years"
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years or older";

 label define AGEFPAP2
   1 "Younger than 18"
   2 "18-21"
   3 "22-29"
   4 "30 or older"
   8 "Refused"
   9 "Don't know";

 label define ABNPAP3
   1 "Yes"
   5 "No"
   6 "No Pap test in past 3 years"
   8 "Refused"
   9 "Don't know";

 label define intpap
   1 "Every year"
   2 "Every 2 years"
   3 "Every 3 years"
   4 "Every 4 years"
   7 "Every 5 years"
   8 "Less often than every 5 years"
  95 "If R volunteers: More than once a year"
  96 "If R volunteers: She would never need to be tested"
  98 "Refused"
  99 "Don't know";

 label define pelwpap
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define lastpel
   1 "A year ago or less"
   2 "More than 1 year ago but not more than 2 years"
   3 "More than 2 years ago but not more than 3 years"
   4 "More than 3 years ago but not more than 5 years"
   5 "Over 5 years ago"
   6 "Never had pelvic exam"
   8 "Refused"
   9 "Don't know";

 label define mreaspel
   1 "Part of a routine exam"
   2 "Because of a medical problem"
   3 "Other reason"
   8 "Refused"
   9 "Don't know";

 label define agefpel
  12 "12 years or younger"
  13 "13 years"
  14 "14 years"
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years or older";

 label define AGEPEL2
   1 "Younger than 18"
   2 "18-21"
   3 "22-29"
   4 "30 or older"
   8 "Refused"
   9 "Don't know";

 label define intpel
   1 "Every year"
   2 "Every 2 years"
   3 "Every 3 years"
   4 "Every 4 years"
   7 "Every 5 years"
   8 "Less often than every 5 years"
  95 "If R volunteers: More than once a year"
  96 "If R volunteers: She would never need to be tested"
  98 "Refused"
  99 "Don't know";

 label define evhpvtst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hpvwpap
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define lasthpv
   1 "A year ago or less"
   2 "More than 1 year ago but not more than 2 years"
   3 "More than 2 years ago but not more than 3 years"
   4 "More than 3 years ago but not more than 5 years"
   5 "Over 5 years ago"
   8 "Refused"
   9 "Don't know";

 label define mreashpv
   1 "Part of a routine exam"
   2 "Because of a medical problem"
   3 "Other reason"
   8 "Refused"
   9 "Don't know";

 label define agefhpv
  12 "12 years or younger"
  13 "13 years"
  14 "14 years"
  15 "15 years"
  16 "16 years"
  17 "17 years"
  18 "18 years"
  19 "19 years"
  20 "20 years"
  21 "21 years"
  22 "22 years"
  23 "23 years"
  24 "24 years"
  25 "25 years"
  26 "26 years"
  27 "27 years"
  28 "28 years"
  29 "29 years"
  30 "30 years or older";

 label define AGEHPV2
   1 "Younger than 18"
   2 "18-21"
   3 "22-29"
   4 "30 or older"
   8 "Refused"
   9 "Don't know";

 label define inthpv
   1 "Every year"
   2 "Every 2 years"
   3 "Every 3 years"
   4 "Every 4 years"
   7 "Every 5 years"
   8 "Less often than every 5 years"
  95 "If R volunteers: More than once a year"
  96 "If R volunteers: She would never need to be tested"
  98 "Refused"
  99 "Don't know";

 label define asksmoke
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define askpreg
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define askfolic
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define talkdm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define provresp
   1 "Poor"
   2 "Fair"
   3 "Good"
   4 "Very good"
   5 "Excellent"
   8 "Refused"
   9 "Don't know";

 label define provsaybc
   1 "Poor"
   2 "Fair"
   3 "Good"
   4 "Very good"
   5 "Excellent"
   8 "Refused"
   9 "Don't know";

 label define provprebc
   1 "Poor"
   2 "Fair"
   3 "Good"
   4 "Very good"
   5 "Excellent"
   8 "Refused"
   9 "Don't know";

 label define provinfobc
   1 "Poor"
   2 "Fair"
   3 "Good"
   4 "Very good"
   5 "Excellent"
   8 "Refused"
   9 "Don't know";

 label define rwant
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define probwant
   1 "Probably want"
   2 "Probably do not want"
   8 "Refused"
   9 "Don't know";

 label define pwant
   1 "Definitely yes"
   2 "Probably yes"
   3 "Probably no"
   4 "Definitely no"
   8 "Refused"
   9 "Don't know";

 label define jintend
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define jsureint
   1 "Very sure"
   2 "Somewhat sure"
   3 "Not at all sure"
   8 "Refused"
   9 "Don't know";

 label define jintendn
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN"
   3 "3 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define jexpectl
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN"
   3 "3 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define jexpects
   0 "none"
   1 "1 CHILD"
  98 "Refused"
  99 "Don't know";

 label define jintnext
   1 "Within the next 2 years"
   2 "2-5 years from now"
   3 "More than 5 years from now"
   8 "Refused"
   9 "Don't know";

 label define intend
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define sureint
   1 "Very sure"
   2 "Somewhat sure"
   3 "Not at all sure"
   8 "Refused"
   9 "Don't know";

 label define intendn
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN"
   3 "3 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define expectl
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN"
   3 "3 CHILDREN"
  98 "Refused"
  99 "Don't know";

 label define expects
   0 "none"
   1 "1 CHILD"
  98 "Refused"
  99 "Don't know";

 label define intnext
   1 "Within the next 2 years"
   2 "2-5 years from now"
   3 "More than 5 years from now"
   8 "Refused"
   9 "Don't know";

 label define hlpprg
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define howmanyr
   1 "One"
   2 "More than one"
   8 "Refused"
   9 "Don't know";

 label define SEEKWHO1
   1 "Current husband/partner"
   5 "Another partner"
   8 "Refused"
   9 "Don't know";

 label define SEEKWHO2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG1
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG2
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG3
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG4
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG5
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLPG6
   1 "Advice"
   2 "Infertility testing"
   3 "Drugs to improve your ovulation"
   4 "Surgery to correct blocked tubes"
   5 "Artificial insemination"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define whotest
   1 "You"
   3 "Him"
   5 "Both of you"
   8 "Refused"
   9 "Don't know";

 label define OVUL12M
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whartin
   1 "Husband or partner"
   3 "Donor"
   5 "Both husband or partner and donor"
   8 "Refused"
   9 "Don't know";

 label define INSEM12M
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define OTMEDHEP1
   1 "Surgery or drug treatment for endometriosis"
   2 "In vitro fertilization (IVF)"
   3 "Surgery or drug treatment for uterine fibroids"
   4 "Some other female pelvic surgery"
   5 "Other medical help"
   8 "Refused"
   9 "Don't know";

 label define OTMEDHEP2
   1 "Surgery or drug treatment for endometriosis"
   2 "In vitro fertilization (IVF)"
   3 "Surgery or drug treatment for uterine fibroids"
   4 "Some other female pelvic surgery"
   5 "Other medical help"
   8 "Refused"
   9 "Don't know";

 label define OTMEDHEP3
   1 "Surgery or drug treatment for endometriosis"
   2 "In vitro fertilization (IVF)"
   3 "Surgery or drug treatment for uterine fibroids"
   4 "Some other female pelvic surgery"
   5 "Other medical help"
   8 "Refused"
   9 "Don't know";

 label define OTMEDHEP4
   1 "Surgery or drug treatment for endometriosis"
   2 "In vitro fertilization (IVF)"
   3 "Surgery or drug treatment for uterine fibroids"
   4 "Some other female pelvic surgery"
   5 "Other medical help"
   8 "Refused"
   9 "Don't know";

 label define inscovpg
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FSTHLPPG_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define FSTHLPPG_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMPGVIS1
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define TRYLONG2
  98 "Refused"
  99 "Don't know";

 label define UNIT_TRYLONG
   1 "Months"
   5 "Years"
   8 "Refused"
   9 "Don't know";

 label define hlppgnow
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RCNTPGH_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  96 "R only had one visit for help to become pregnant"
  98 "Refused"
  99 "Don't know";

 label define RCNTPGH_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmpgvisl
9996 "Only had 1 visit"
9998 "Refused"
9999 "Don't know";

 label define numvstpg
   1 "1 VISIT"
   2 "2 VISITS"
   3 "3 VISITS"
   4 "4 VISITS"
  98 "Refused"
  99 "Don't know";

 label define prgvisit
   0 "NO VISITS IN LAST 12 MONTHS"
   1 "1 VISIT"
   2 "2 VISITS"
   3 "3 VISITS"
   4 "4 VISITS"
  98 "Refused"
  99 "Don't know";

 label define hlpmc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define TYPALLMC1
   1 "Instructions to take complete bed rest"
   2 "Instructions to limit your physical activity"
   3 "Testing to diagnose problems related to miscarriage"
   4 "Drugs to prevent miscarriage, such as progesterone suppositories"
   5 "Stitches in your cervix, also known as the 'purse-string' procedure"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLMC2
   1 "Instructions to take complete bed rest"
   2 "Instructions to limit your physical activity"
   3 "Testing to diagnose problems related to miscarriage"
   4 "Drugs to prevent miscarriage, such as progesterone suppositories"
   5 "Stitches in your cervix, also known as the 'purse-string' procedure"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLMC3
   1 "Instructions to take complete bed rest"
   2 "Instructions to limit your physical activity"
   3 "Testing to diagnose problems related to miscarriage"
   4 "Drugs to prevent miscarriage, such as progesterone suppositories"
   5 "Stitches in your cervix, also known as the 'purse-string' procedure"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLMC4
   1 "Instructions to take complete bed rest"
   2 "Instructions to limit your physical activity"
   3 "Testing to diagnose problems related to miscarriage"
   4 "Drugs to prevent miscarriage, such as progesterone suppositories"
   5 "Stitches in your cervix, also known as the 'purse-string' procedure"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define TYPALLMC5
   1 "Instructions to take complete bed rest"
   2 "Instructions to limit your physical activity"
   3 "Testing to diagnose problems related to miscarriage"
   4 "Drugs to prevent miscarriage, such as progesterone suppositories"
   5 "Stitches in your cervix, also known as the 'purse-string' procedure"
   6 "Other types of medical help"
   8 "Refused"
   9 "Don't know";

 label define miscnum
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
  98 "Refused"
  99 "Don't know";

 label define INFRTPRB1
   1 "Problems with ovulation"
   2 "Blocked tubes"
   3 "Other tube or pelvic problems"
   4 "Endometriosis"
   5 "Semen or sperm problems"
   6 "Any other infertility problems"
   7 "None of these problems"
   8 "Refused"
   9 "Don't know";

 label define INFRTPRB2
   1 "Problems with ovulation"
   2 "Blocked tubes"
   3 "Other tube or pelvic problems"
   4 "Endometriosis"
   5 "Semen or sperm problems"
   6 "Any other infertility problems"
   7 "None of these problems"
   8 "Refused"
   9 "Don't know";

 label define INFRTPRB3
   1 "Problems with ovulation"
   2 "Blocked tubes"
   3 "Other tube or pelvic problems"
   4 "Endometriosis"
   5 "Semen or sperm problems"
   6 "Any other infertility problems"
   7 "None of these problems"
   8 "Refused"
   9 "Don't know";

 label define INFRTPRB4
   1 "Problems with ovulation"
   2 "Blocked tubes"
   3 "Other tube or pelvic problems"
   4 "Endometriosis"
   5 "Semen or sperm problems"
   6 "Any other infertility problems"
   7 "None of these problems"
   8 "Refused"
   9 "Don't know";

 label define INFRTPRB5
   1 "Problems with ovulation"
   2 "Blocked tubes"
   3 "Other tube or pelvic problems"
   4 "Endometriosis"
   5 "Semen or sperm problems"
   6 "Any other infertility problems"
   7 "None of these problems"
   8 "Refused"
   9 "Don't know";

 label define duchfreq
   1 "Never"
   2 "Once a month or less often"
   3 "2-3 times a month"
   4 "Once a week"
   5 "2-3 times a week"
   6 "4-6 times a week"
   7 "Every day"
   8 "Refused"
   9 "Don't know";

 label define pid
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pidsympt
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pidtx
   1 "1 TIME"
  98 "Refused"
  99 "Don't know";

 label define LSTPIDTX_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define LSTPIDTX_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmpidlst
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define diabetes
   1 "Yes"
   3 "If volunteered: Borderline or Pre-Diabetes"
   5 "No"
   8 "Refused"
   9 "Don't know";

 label define gestdiab
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define uf
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ufsono
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ufcurr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ufdiagnos
   1 "Less than one year ago"
   2 "1-4 years ago"
   3 "5-9 years ago"
   4 "10 years ago or longer"
   8 "Refused"
   9 "Don't know";

 label define uflimit
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define UFTREAT_1
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_2
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_3
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_4
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_5
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_6
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_7
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define UFTREAT_8
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define endo
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define endocurr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define endodiag
   1 "Less than one year ago"
   2 "1-4 years ago"
   3 "5-9 years ago"
   4 "10 years ago or longer"
   8 "Refused"
   9 "Don't know";

 label define endolim
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ENDOTREAT_1
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_2
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_3
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_4
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_5
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_6
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_7
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ENDOTREAT_8
   1 "Non-narcotic medicines to treat pain"
   2 "Narcotic medicines to treat pain"
   3 "Hormonal medicines"
   4 "Progesterone releasing IUD or implant"
   5 "Hysterectomy"
   6 "Other surgery"
   7 "Other nonsurgical treatment"
   8 "Complementary or alternative medicines or treatments"
   9 "Never had any of the above treatments for fibroids"
  98 "Refused"
  99 "Don't know";

 label define ovuprob
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pcos
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_1
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_2
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_3
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_4
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_5
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define PCOSSYMP_6
   1 "Irregular menstrual periods"
   2 "Pelvic ultrasound"
   3 "Acne"
   4 "Body hirsutism (excessive hair growth)"
   5 "Blood tests (including measurements of hormones such as FSH/LH, Testosterone, Thyroid stimulating hormone/TSH, or Prolactin)"
   6 "Other tests or symptoms"
   7 "None of these tests or symptoms"
   8 "Refused"
   9 "Don't know";

 label define deaf
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define blind
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define difdecide
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define difwalk
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define difdress
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define difout
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evrcancer
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define agecancer
  17 "17 YEARS OR YOUNGER"
  98 "Refused"
  99 "Don't know";

 label define precancer
   1 "Abnormal Pap test result, suspicious for cancer, but no real cancer found"
   2 "Pre-cancer (cervical intraepithelial lesion or CIN)"
   3 "Cervical cancer"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define mammog
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define AGEMAMM1
  98 "Refused"
  99 "Don't know";

 label define REASMAMM1
   1 "Part of a routine exam"
   2 "Because of a problem or lump"
   3 "Because of family or personal history of cancer"
   4 "Other reason"
   8 "Refused"
   9 "Don't know";

 label define clinexam
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define famhyst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MOMRISK70
   1 "A lot"
   2 "A little"
   3 "Not at all"
   4 "No opinion"
   8 "Refused"
   9 "Don't know";

 label define MOMRISK40
   1 "A lot"
   2 "A little"
   3 "Not at all"
   4 "No opinion"
   8 "Refused"
   9 "Don't know";

 label define alcorisk
   1 "A lot"
   2 "A little"
   3 "Not at all"
   4 "No opinion"
   8 "Refused"
   9 "Don't know";

 label define bfeedrisk
   1 "A lot"
   2 "A little"
   3 "Not at all"
   4 "No opinion"
   8 "Refused"
   9 "Don't know";

 label define donblood
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hivtest
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define nohivtst
   1 "You have never been offered an HIV test"
   2 "You are worried about what other people would think if you got tested for HIV"
   3 "It's unlikely you've been exposed to HIV"
   4 "You were afraid to find out if you were HIV positive (that you had HIV)"
   5 "You don't like needles"
  20 "Some other reason"
  21 "R reported spouse or partner tested negative"
  22 "Never had sexual intercourse"
  23 "No health insurance or coverage, or R couldn't afford an HIV test"
  24 "Part of blood donation"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define WHENHIV_M
  13 "Winter"
  14 "Spring"
  15 "Summer"
  16 "Fall"
  98 "Refused"
  99 "Don't know";

 label define WHENHIV_Y
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmhivtst
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define hivtstyr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hivresult
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whynoget
   1 "You thought the testing site would contact you"
   2 "You were afraid to find out if you were HIV positive (that you had HIV)"
   3 "You didn't want to know your HIV test results"
   4 "You didn't know where or how to get your test result"
  20 "Some other reason"
  98 "Refused"
  99 "Don't know";

 label define plchiv
   1 "Private doctor's office"
   2 "HMO facility"
   3 "Community health clinic, community clinic, public health clinic"
   4 "Family planning or Planned Parenthood clinic"
   5 "Employer or company clinic"
   6 "School or school-based clinic (including college or university)"
   7 "Hospital outpatient clinic"
   8 "Hospital emergency room"
   9 "Hospital regular room"
  10 "Urgent care center, urgi-care, or walk-in facility"
  11 "Your worksite"
  12 "Your home"
  13 "Military induction or military service site"
  14 "Sexually transmitted disease (STD) clinic"
  15 "Laboratory or blood bank"
  20 "Some other place -- specify"
  21 "Prison or jail"
  22 "Mobile testing or community testing site"
  23 "Drug, alcohol, or rehabilitation center"
  98 "Refused"
  99 "Don't know";

 label define RHHIVT1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RHHIVT21
   1 "I didn't want to get tested by a doctor or at an HIV testing site"
   2 "I didn't want other people to know I am getting tested"
   3 "I wanted to get tested together with someone, before we had sex"
   4 "I wanted to get tested by myself, before having sex"
   5 "I wanted to get tested by myself, after having sex"
   6 "A sex partner asked me to take a rapid home HIV test"
  20 "Other reason"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define RHHIVT22
   1 "I didn't want to get tested by a doctor or at an HIV testing site"
   2 "I didn't want other people to know I am getting tested"
   3 "I wanted to get tested together with someone, before we had sex"
   4 "I wanted to get tested by myself, before having sex"
   5 "I wanted to get tested by myself, after having sex"
   6 "A sex partner asked me to take a rapid home HIV test"
  20 "Other reason"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define hivtst
   1 "Part of medical checkup or surgical procedure (a doctor or medical provider asked for the test)"
   2 "Required for health or life insurance coverage"
   3 "Required for marriage license or to get married"
   4 "Required for military service or a job"
   5 "You wanted to find out if infected or not (you were the one who asked for the test)"
   6 "Someone else suggested you should be tested"
   7 "Intentionally blank (a code used only for females, prenatal testing)"
   8 "You might have been exposed through sex or drug use"
   9 "You might have been exposed in some other way"
  20 "Some other reason - not shown separately"
  21 "Required for immigration or travel"
  22 "Required for incarceration"
  23 "Required for school"
  98 "Refused"
  99 "Don't know";

 label define prephiv
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define talkdoct
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define AIDSTALK01
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK02
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK03
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK04
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK05
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK06
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK07
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK08
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK09
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK10
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define AIDSTALK11
   1 "How HIV/AIDS is transmitted"
   2 "Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
   3 "The correct use of condoms"
   4 "Needle cleaning/using clean needles"
   5 "Dangers of needle sharing"
   6 "Abstinence from sex (not having sex)"
   7 "Reducing your number of sexual partners"
   8 "Condom use to prevent HIV or STD transmission"
   9 "Safe sex practices (abstinence, condom use, etc)"
  10 "Getting tested and knowing your HIV status"
  11 "Medicines to prevent getting HIV (pre-exposure prophylaxis, also known as PrEP)"
  20 "Some other topic - not shown separately"
  98 "Refused"
  99 "Don't know";

 label define retrovir
   1 "Definitely true"
   2 "Probably true"
   3 "Probably false"
   4 "Definitely false"
   5 "Don't know if true or false"
   8 "Refused"
   9 "Don't know";

 label define preghiv
   1 "Yes"
   5 "No"
   6 "Never went for prenatal care"
   8 "Refused"
   9 "Don't know";

 label define evervacc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HPVSHOT1
   9 "9 YEARS OR YOUNGER"
  98 "Refused"
  99 "Don't know";

 label define HPVSEX1
   1 "First intercourse"
   5 "First HPV vaccine shot"
   8 "Refused"
   9 "Don't know";

 label define vaccprob
   1 "Very likely"
   2 "Somewhat likely"
   3 "Not too likely"
   4 "Not likely at all"
   8 "Refused"
   9 "Don't know";

 label define bldpress
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define highbp
   1 "Yes"
   5 "No"
   6 "If volunteered: Not told results"
   8 "Refused"
   9 "Don't know";

 label define bpmeds
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NUTRINFO_1
   1 "Friends"
   2 "Family (such as spouse, mother, mother-in-law, sister)"
   3 "Child's doctor or other health care provider"
   4 "Child's daycare provider, nanny, or teacher"
   5 "Websites, blogs, or social media"
   6 "None of the above sources"
   8 "Refused"
   9 "Don't know";

 label define NUTRINFO_2
   1 "Friends"
   2 "Family (such as spouse, mother, mother-in-law, sister)"
   3 "Child's doctor or other health care provider"
   4 "Child's daycare provider, nanny, or teacher"
   5 "Websites, blogs, or social media"
   6 "None of the above sources"
   8 "Refused"
   9 "Don't know";

 label define NUTRINFO_3
   1 "Friends"
   2 "Family (such as spouse, mother, mother-in-law, sister)"
   3 "Child's doctor or other health care provider"
   4 "Child's daycare provider, nanny, or teacher"
   5 "Websites, blogs, or social media"
   6 "None of the above sources"
   8 "Refused"
   9 "Don't know";

 label define NUTRINFO_4
   1 "Friends"
   2 "Family (such as spouse, mother, mother-in-law, sister)"
   3 "Child's doctor or other health care provider"
   4 "Child's daycare provider, nanny, or teacher"
   5 "Websites, blogs, or social media"
   6 "None of the above sources"
   8 "Refused"
   9 "Don't know";

 label define NUTRINFO_5
   1 "Friends"
   2 "Family (such as spouse, mother, mother-in-law, sister)"
   3 "Child's doctor or other health care provider"
   4 "Child's daycare provider, nanny, or teacher"
   5 "Websites, blogs, or social media"
   6 "None of the above sources"
   8 "Refused"
   9 "Don't know";

 label define usualcar
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define uslplace
   1 "Private doctor's office or HMO"
   2 "Community health clinic, community clinic, public health clinic"
   3 "Family planning or Planned Parenthood Clinic"
   4 "Employer or company clinic"
   5 "School or school-based clinic"
   6 "Hospital outpatient clinic"
   7 "Hospital emergency room"
   8 "Hospital regular room"
   9 "Urgent care center, urgi-care, or walk-in facility"
  10 "Sexually transmitted disease (STD) clinic"
  11 "In-store health clinic (like CVS, Target, or Walmart)"
  20 "Some other place"
  98 "Refused"
  99 "Don't know";

 label define USL12MOS
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define currcov
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define COVERHOW01
   1 "Private health insurance plan (from employer or workplace; purchased directly; through a state or local government program or community program)"
   2 "Medicaid-additional name(s) for Medicaid in this state: [MEDICAID_FILL]"
   4 "Medi-GAP"
   5 "Military health care including: the VA, CHAMPUS, TRICARE, CHAMP-VA"
   6 "Indian Health Service, or Single Service Plan"
   7 "chip"
   8 "State-sponsored health plan"
   9 "Medicare or other government health care"
  98 "Refused"
  99 "Don't know";

 label define COVERHOW02
   1 "Private health insurance plan (from employer or workplace; purchased directly; through a state or local government program or community program)"
   2 "Medicaid-additional name(s) for Medicaid in this state: [MEDICAID_FILL]"
   4 "Medi-GAP"
   5 "Military health care including: the VA, CHAMPUS, TRICARE, CHAMP-VA"
   6 "Indian Health Service, or Single Service Plan"
   7 "chip"
   8 "State-sponsored health plan"
   9 "Medicare or other government health care"
  98 "Refused"
  99 "Don't know";

 label define COVERHOW03
   1 "Private health insurance plan (from employer or workplace; purchased directly; through a state or local government program or community program)"
   2 "Medicaid-additional name(s) for Medicaid in this state: [MEDICAID_FILL]"
   4 "Medi-GAP"
   5 "Military health care including: the VA, CHAMPUS, TRICARE, CHAMP-VA"
   6 "Indian Health Service, or Single Service Plan"
   7 "chip"
   8 "State-sponsored health plan"
   9 "Medicare or other government health care"
  98 "Refused"
  99 "Don't know";

 label define parinsur
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define INS_EXCH
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define INS_PREM
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define COVER12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define numnocov
   1 "1 Month"
   2 "2 Months"
   3 "3 Months"
   4 "4 Months"
   5 "5 Months"
   6 "6 Months"
   7 "7 Months"
   8 "8 Months"
   9 "9 Months"
  10 "10 Months"
  11 "11 Months"
  12 "12 Months"
  98 "Refused"
  99 "Don't know";

 label define sameadd
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define brnout
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define relraisd
   1 "No religion"
   2 "Catholic"
   3 "Baptist/Southern Baptist"
   4 "Methodist, Lutheran, Presbyterian, Episcopal"
   5 "Fundamentalist Protestant"
   6 "Other Protestant denomination"
   7 "Protestant - No specific denomination"
   8 "Other religion"
   9 "Refused"
  10 "Don't know";

 label define ATTND14
   1 "More than once a week"
   2 "Once a week"
   3 "2-3 times a month"
   4 "Once a month (about 12 times a year)"
   5 "3-11 times a year"
   6 "Once or twice a year"
   7 "Never"
   8 "Refused"
   9 "Don't know";

 label define relcurr
   1 "No religion"
   2 "Catholic"
   3 "Baptist/Southern Baptist"
   4 "Methodist, Lutheran, Presbyterian, Episcopal"
   5 "Fundamentalist Protestant"
   6 "Other Protestant denomination"
   7 "Protestant - No specific denomination"
   8 "Other religion"
   9 "Refused"
  10 "Don't know";

 label define reltrad
   1 "Evangelical Prot"
   2 "Mainline Prot"
   3 "Black Prot"
   4 "Catholic"
   5 "Other religion"
   6 "No religious affiilation"
   8 "Refused"
   9 "Don't know";

 label define FUNDAM1
   1 "A born again Christian"
   2 "A charismatic"
   3 "An evangelical"
   4 "A fundamentalist"
   5 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define FUNDAM2
   1 "A born again Christian"
   2 "A charismatic"
   3 "An evangelical"
   4 "A fundamentalist"
   5 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define FUNDAM3
   1 "A born again Christian"
   2 "A charismatic"
   3 "An evangelical"
   4 "A fundamentalist"
   5 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define FUNDAM4
   1 "A born again Christian"
   2 "A charismatic"
   3 "An evangelical"
   4 "A fundamentalist"
   5 "None of the above"
   8 "Refused"
   9 "Don't know";

 label define reldlife
   1 "Very important"
   2 "Somewhat important"
   3 "Not important"
   8 "Refused"
   9 "Don't know";

 label define attndnow
   1 "More than once a week"
   2 "Once a week"
   3 "2-3 times a month"
   4 "Once a month (about 12 times a year)"
   5 "3-11 times a year"
   6 "Once or twice a year"
   7 "Never"
   8 "Refused"
   9 "Don't know";

 label define milsvc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define WRK12MOS
   0 "No months"
   1 "1 Month"
   2 "2 Months"
   3 "3 Months"
   4 "4 Months"
   5 "5 Months"
   6 "6 Months"
   7 "7 Months"
   8 "8 Months"
   9 "9 Months"
  10 "10 Months"
  11 "11 Months"
  12 "12 Months"
  98 "Refused"
  99 "Don't know";

 label define FPT12MOS
   1 "Full-time"
   2 "Part-time"
   3 "Some of each"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK1
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK2
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK3
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK4
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK5
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define DOLASTWK6
   1 "Working"
   2 "Working - Maternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "In school"
   6 "Other"
   8 "Refused"
   9 "Don't know";

 label define rwrkst
   1 "yes"
   5 "no";

 label define WORKP12
   1 "yes"
   5 "no";

 label define rpayjob
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define rnumjob
   1 "1 job"
   2 "2 or more jobs"
   8 "Refused"
   9 "Don't know";

 label define rftptx
   1 "Full-time"
   2 "Part-time"
   3 "Some of each"
   8 "Refused"
   9 "Don't know";

 label define rearnty
   1 "yes"
   5 "no";

 label define SPLSTWK1
   1 "Working"
   2 "Working - Paternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SPLSTWK2
   1 "Working"
   2 "Working - Paternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SPLSTWK3
   1 "Working"
   2 "Working - Paternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SPLSTWK4
   1 "Working"
   2 "Working - Paternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define SPLSTWK5
   1 "Working"
   2 "Working - Paternity leave or temp leave"
   3 "Not working, looking for work"
   4 "Keeping house or taking care of family"
   5 "Other"
   8 "Refused"
   9 "Don't know";

 label define spwrkst
   1 "yes"
   5 "no";

 label define sppayjob
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define spnumjob
   1 "1 job"
   2 "2 or more jobs"
   8 "Refused"
   9 "Don't know";

 label define spftptx
   1 "Full-time"
   2 "Part-time"
   3 "Some of each"
   8 "Refused"
   9 "Don't know";

 label define spearnty
   1 "yes"
   5 "no";

 label define samesex
   1 "Strongly agree"
   2 "Agree"
   3 "Disagree"
   4 "Strongly disagree"
   5 "If R insists: Neither agree nor disagree"
   8 "Refused"
   9 "Don't know";

 label define chsuppor
   1 "Strongly agree"
   2 "Agree"
   3 "Disagree"
   4 "Strongly disagree"
   5 "If R insists: Neither agree nor disagree"
   8 "Refused"
   9 "Don't know";

 label define reactslf
   1 "Very upset"
   2 "A little upset"
   3 "A little pleased"
   4 "Very pleased"
   5 "If R insists: She wouldn't care"
   8 "Refused"
   9 "Don't know";

 label define chbother
   1 "A great deal"
   2 "Some"
   3 "A little"
   4 "Not at all"
   8 "Refused"
   9 "Don't know";

 label define acasilang
   1 "English"
   2 "Spanish"
   7 "Not ascertained";

 label define genhealt
   1 "Excellent"
   2 "Very good"
   3 "Good"
   4 "Fair"
   5 "Poor"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define bmicat
   1 "Underweight"
   2 "Normal weight"
   3 "Overweight"
   4 "Obese"
   5 "Undefined BMI"
   7 "Not ascertained";

 label define drweigh
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define tellwght
   1 "Underweight"
   2 "Normal weight"
   3 "Overweight"
   4 "Obese"
   5 "Not told"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define wghtscrn
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define engspeak
   1 "Very well"
   2 "Well"
   3 "Not well"
   4 "Not at all"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define casibirth
   0 "NO PREGNANCIES"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define casiloss
   0 "NO PREGNANCIES"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define casiabor
   0 "NO PREGNANCIES"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define casiadop
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define nobedyr
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define stayrel
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evsuspen
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define gradsusp
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define SMK100
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define agesmk
   0 "NEVER SMOKED REGULARLY"
  11 "11 YEARS OR YOUNGER"
  12 "12 YEARS OLD"
  13 "13 YEARS OLD"
  14 "14 YEARS OLD"
  15 "15 YEARS OLD"
  16 "16 YEARS OLD"
  17 "17 YEARS OLD"
  18 "18 YEARS OLD"
  19 "19 YEARS OLD"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define SMOKE12
   1 "None"
   2 "About one cigarette a day or less"
   3 "Just a few cigarettes a day, between 2 to 4 cigarettes"
   4 "About half a pack a day, between 5 to 14 cigarettes"
   5 "About a pack a day, between 15 to 24 cigarettes"
   6 "More than a pack a day, 25 or more cigarettes"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define smkstop
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define DRINK12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month"
   5 "About once a week"
   6 "About once a day"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define UNIT30D
   1 "Days per week"
   5 "Days per month"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define DRINK30D
   0 "0 DAYS"
   1 "1 DAY"
   2 "2 DAYS"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define drinkday
   1 "1 DRINK"
   2 "2 DRINKS"
   3 "3 DRINKS"
   4 "4 DRINKS"
   5 "5 DRINKS"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define BINGE30
   0 "none"
   1 "1 TIME"
   2 "2 TIMES"
   3 "3 TIMES"
   4 "4 TIMES"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define drnkmost
   1 "1 DRINK"
   2 "2 DRINKS"
   3 "3 DRINKS"
   4 "4 DRINKS"
   5 "5 DRINKS"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define BINGE12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month"
   5 "About once a week"
   6 "About once a day"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define POT12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month"
   5 "About once a week"
   6 "About once a day or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define COC12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CRACK12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define CRYSTMTH12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define INJECT12
   1 "Never"
   2 "Once or twice during the year"
   3 "Several times during the year"
   4 "About once a month or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define vagsex
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define agevagr
  10 "10 YEARS OR YOUNGER"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define condvag
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define whycondl
   1 "To prevent pregnancy"
   2 "To prevent diseases like syphilis, gonorrhea or AIDS"
   3 "For both reasons"
   4 "For some other reason"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define getoralm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define givoralm
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define condfell
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define anyoral
   1 "yes"
   5 "no"
   7 "Not ascertained";

 label define timing
   1 "Before first vaginal intercourse"
   3 "After first vaginal intercourse"
   5 "Same occasion"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define analsex
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define condanal
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define oppsexany
   1 "yes"
   5 "no"
   7 "Not ascertained";

 label define oppsexgen
   1 "yes"
   5 "no"
   7 "Not ascertained";

 label define condsexl
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define opplifenum
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 PARTNERS"
   8 "8 PARTNERS"
   9 "9 PARTNERS"
  10 "10 PARTNERS"
  50 "50 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define oppyearnum
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define VAGNUM12
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define ORALNUM12
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define ANALNUM12
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define bisexprt
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define nonmonog
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NNONMONOG1
   1 "1 partner"
   2 "2 or more partners"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NNONMONOG2
   1 "1 other partner besides you"
   2 "2 or more other partners besides you"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define NNONMONOG3
   1 "1 other partner besides you"
   2 "2 or more other partners besides you"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MALSHT12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define prostfrq
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define johnfreq
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define HIVMAL12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define givoralf
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define getoralf
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define femsex
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define samesexany
   1 "yes"
   5 "no"
   7 "Not ascertained";

 label define samlifenum
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 PARTNERS"
   8 "8 PARTNERS"
   9 "9 PARTNERS"
  10 "10 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define samyearnum
   0 "0 PARTNERS"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 OR MORE PARTNERS"
 997 "Not ascertained"
 998 "Refused"
 999 "Don't know";

 label define SAMESEX1
   1 "UNDER 15 YEARS"
   2 "15-19 YEARS"
   3 "20-29 YEARS"
   4 "30-49 YEARS"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define fsamerel
   1 "Married to her"
   2 "Engaged to her"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going with her or going steady"
   5 "Going out with her once in a while"
   6 "Just friends"
   7 "Had just met her"
   8 "Something else"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define mflastp
   1 "Male"
   2 "Female"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define dateapp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define attract
   1 "Only attracted to males"
   2 "Mostly attracted to males"
   3 "Equally attracted to males and females"
   4 "Mostly attracted to females"
   5 "Only attracted to females"
   6 "Not sure"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ORIENT_A
   1 "Heterosexual or straight"
   2 "Homosexual, gay, or lesbian"
   3 "Bisexual"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ORIENT_B
   1 "Lesbian or gay"
   2 "Straight, that is, not lesbian or gay"
   3 "Bisexual"
   4 "Something else"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define confconc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define timalon
   1 "Yes"
   5 "No"
   6 "Did not have a health care visit in the past 12 months"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RISKCHEK1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RISKCHEK2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RISKCHEK3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define RISKCHEK4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define chlamtst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STDOTHR12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define STDTRT12
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define gon
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define chlam
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define herpes
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define genwarts
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define syphilis
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evrinject
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define evrshare
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define earntype
   1 "Week"
   2 "Month"
   3 "Year"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define earn
   1 "Under $96 (weekly)/Under $417 (monthly)/Under $5,000 (yearly)"
   2 "$96-$143 (weekly)/$417-624 (monthly)/$5,000-7,499 (yearly)"
   3 "$144-191 (weekly)/$625-832 (monthly)/$7,500-9,999 (yearly)"
   4 "$192-239 (weekly)/$833-1,041 (monthly)/$10,000-12,499 (yearly)"
   5 "$240-288 (weekly)/$1,042-1,249 (monthly)/$12,500-14,999 (yearly)"
   6 "$289-384 (weekly)/$1,250-1,666 (monthly)/$15,000-19,999 (yearly)"
   7 "$385-480 (weekly)/$1,667-2,082 (monthly)/$20,000-24,999 (yearly)"
   8 "$481-576 (weekly)/$2,083-2,499 (monthly)/$25,000-29,999 (yearly)"
   9 "$577-672 (weekly)/$2,500-2,916 (monthly)/$30,000-34,999 (yearly)"
  10 "$673-768 (weekly)/$2,917-3,332 (monthly)/$35,000-39,999 (yearly)"
  11 "$769-961 (weekly)/$3,333-4,166 (monthly)/$40,000-49,999 (yearly)"
  12 "$962-1,153 (weekly)/$4,167-4,999 (monthly)/$50,000-59,999 (yearly)"
  13 "$1,154-1,441 (weekly)/$5,000-6,249 (monthly)/$60,000-74,999 (yearly)"
  14 "$1,442-1,922 (weekly)/$6,250-8,332 (monthly)/$75,000-99,999 (yearly)"
  15 "$1,923 or more (weekly)/$8,333 or more (monthly)/$100,000 or more (yearly)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define EARNDK1
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define EARNDK2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define EARNDK3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define EARNDK4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define toincwmy
   1 "Week"
   2 "Month"
   3 "Year"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define totinc
   1 "Under $96 (weekly)/Under $417 (monthly)/Under $5,000 (yearly)"
   2 "$96-$143 (weekly)/$417-624 (monthly)/$5,000-7,499 (yearly)"
   3 "$144-191 (weekly)/$625-832 (monthly)/$7,500-9,999 (yearly)"
   4 "$192-239 (weekly)/$833-1,041 (monthly)/$10,000-12,499 (yearly)"
   5 "$240-288 (weekly)/$1,042-1,249 (monthly)/$12,500-14,999 (yearly)"
   6 "$289-384 (weekly)/$1,250-1,666 (monthly)/$15,000-19,999 (yearly)"
   7 "$385-480 (weekly)/$1,667-2,082 (monthly)/$20,000-24,999 (yearly)"
   8 "$481-576 (weekly)/$2,083-2,499 (monthly)/$25,000-29,999 (yearly)"
   9 "$577-672 (weekly)/$2,500-2,916 (monthly)/$30,000-34,999 (yearly)"
  10 "$673-768 (weekly)/$2,917-3,332 (monthly)/$35,000-39,999 (yearly)"
  11 "$769-961 (weekly)/$3,333-4,166 (monthly)/$40,000-49,999 (yearly)"
  12 "$962-1,153 (weekly)/$4,167-4,999 (monthly)/$50,000-59,999 (yearly)"
  13 "$1,154-1,441 (weekly)/$5,000-6,249 (monthly)/$60,000-74,999 (yearly)"
  14 "$1,442-1,922 (weekly)/$6,250-8,332 (monthly)/$75,000-99,999 (yearly)"
  15 "$1,923 or more (weekly)/$8,333 or more (monthly)/$100,000 or more (yearly)"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define FMINCDK1
   1 "Less than $50,000"
   5 "$50,000 or more"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FMINCDK2
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FMINCDK3
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FMINCDK4
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define FMINCDK5
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define pubasst
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define PUBASTYP1
   1 "Public assist prog, e.g. AFDC or ADC"
   2 "General/Emergency/Other assistance"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define foodstmp
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define wic
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hlptrans
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hlpchldc
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hlpjob
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define freefood
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define hungry
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define MED_COST
   1 "Yes"
   5 "No"
   7 "Not ascertained"
   8 "Refused"
   9 "Don't know";

 label define ager
  15 "15 YEARS"
  16 "16 YEARS"
  17 "17 YEARS"
  18 "18 YEARS"
  19 "19 YEARS"
  20 "20 YEARS"
  21 "21 YEARS"
  22 "22 YEARS"
  23 "23 YEARS"
  24 "24 YEARS"
  25 "25 YEARS"
  26 "26 YEARS"
  27 "27 YEARS"
  28 "28 YEARS"
  29 "29 YEARS"
  30 "30 YEARS"
  31 "31 YEARS"
  32 "32 YEARS"
  33 "33 YEARS"
  34 "34 YEARS"
  35 "35 YEARS"
  36 "36 YEARS"
  37 "37 YEARS"
  38 "38 YEARS"
  39 "39 YEARS"
  40 "40 YEARS"
  41 "41 YEARS"
  42 "42 YEARS"
  43 "43 YEARS"
  44 "44 YEARS"
  45 "45 YEARS"
  46 "46 YEARS"
  47 "47 YEARS"
  48 "48 YEARS";

 label define fmarital
   1 "MARRIED TO A PERSON OF THE OPPOSITE SEX"
   2 "widowed"
   3 "DIVORCED OR ANNULLED"
   4 "separated"
   5 "NEVER MARRIED";

 label define rmarital
   1 "CURRENTLY MARRIED TO A PERSON OF THE OPPOSITE SEX"
   2 "NOT MARRIED BUT LIVING WITH OPP SEX PARTNER"
   3 "widowed"
   4 "DIVORCED OR ANNULLED"
   5 "SEPARATED FOR REASONS OF MARITAL DISCORD"
   6 "NEVER BEEN MARRIED";

 label define educat
   9 "9TH GRADE OR LESS"
  10 "10TH GRADE"
  11 "11TH GRADE"
  12 "12TH GRADE"
  13 "1 YEAR OF COLLEGE/GRAD SCHOOL"
  14 "2 YEARS OF COLLEGE/GRAD SCHOOL"
  15 "3 YEARS OF COLLEGE/GRAD SCHOOL"
  16 "4 YEARS OF COLLEGE/GRAD SCHOOL"
  17 "5 YEARS OF COLLEGE/GRAD SCHOOL"
  18 "6 YEARS OF COLLEGE/GRAD SCHOOL"
  19 "7+ YEARS OF COLLEGE/GRAD SCHOOL"
  97 "Not ascertained"
  98 "Refused"
  99 "Don't know";

 label define hieduc
   5 "9TH GRADE OR LESS"
   6 "10TH GRADE"
   7 "11TH GRADE"
   8 "12TH GRADE, NO DIPLOMA (NOR GED)"
   9 "HIGH SCHOOL GRADUATE (DIPLOMA OR GED)"
  10 "SOME COLLEGE BUT NO DEGREE"
  11 "ASSOCIATE DEGREE IN COLLEGE/UNIVERSITY"
  12 "BACHELOR'S DEGREE"
  13 "MASTER'S DEGREE"
  14 "DOCTORATE DEGREE"
  15 "PROFESSIONAL DEGREE";

 label define hispanic
   1 "hispanic"
   2 "NON-HISPANIC";

 label define race
   1 "black"
   2 "white"
   3 "other";

 label define HISPRACE2
   1 "Hispanic"
   2 "Non-Hispanic White, Single Race"
   3 "Non-Hispanic Black, Single Race"
   4 "Non-Hispanic Other or Multiple Race";

 label define numkdhh
   0 "NO CHILDREN"
   1 "1 CHILD"
   2 "2 CHILDREN"
   3 "3 CHILDREN"
   4 "4 CHILDREN OR MORE";

 label define numfmhh
   0 "NO FAMILY MEMBERS"
   1 "1 FAMILY MEMBER"
   2 "2 FAMILY MEMBERS"
   3 "3 FAMILY MEMBERS"
   4 "4 FAMILY MEMBERS"
   5 "5 FAMILY MEMBERS"
   6 "6 FAMILY MEMBERS"
   7 "7 FAMILY MEMBERS OR MORE";

 label define hhfamtyp
   1 "No spouse/partner and no child(ren) (of R) 18 or younger"
   2 "Spouse/partner, but no child(ren) (of R) 18 or younger"
   3 "Spouse and R's child(ren) 18 or younger"
   4 "Cohabiting partner and R's child(ren) 18 or younger"
   5 "No spouse/partner, but child(ren) of R, 18 or younger";

 label define hhpartyp
   1 "Both biological or both adoptive parents"
   2 "Biological and step- or adoptive parent"
   3 "Single parent (biological, adoptive, or stepparent)"
   4 "Other";

 label define nchildhh
   0 "No children of respondent age 18 or younger in the household"
   1 "1 of respondent's children 18 or younger in the household"
   2 "2 of respondent's children 18 or younger in the household"
   3 "3 or more of respondent's children 18 or younger in the household";

 label define hhkidtyp
   0 "No child(ren) 18 or younger in HH or only older child(ren)"
   1 "At least one biological child (of R's) under 18 in HH, no nonbiological child(ren)"
   2 "Any non-biological child (of R's) 18 or younger in HH";

 label define cspbbhh
   0 "No joint biological children"
   1 "1 joint biological child"
   2 "2 joint biological children"
   3 "3 or more joint biological children";

 label define cspbshh
   0 "No such child"
   1 "1 or more such children";

 label define cspokdhh
   0 "No such child"
   1 "1 or more such children";

 label define intctfam
   1 "TWO BIOLOGICAL OR ADOPTIVE PARENTS FROM BIRTH"
   2 "ANYTHING OTHER THAN 2 BIOLOGICAL OR ADOPTIVE PARENTS FROM BIRTH";

 label define PARAGE14
   1 "R LIVED WITH BOTH BIOLOGICAL OR BOTH ADOPTIVE PARENTS AT AGE 14"
   2 "R LIVED WITH BIOLOGICAL MOTHER AND STEPFATHER AT AGE 14"
   3 "R LIVED IN ANY OTHER PARENTAL SITUATION OR A NONPARENTAL SITUATION AT AGE 14";

 label define educmom
   1 "Less than high school"
   2 "High school graduate or GED"
   3 "Some college, including 2-year degrees"
   4 "Bachelor's degree or higher"
  95 "No mother-figure identified";

 label define AGEMOMB1
   1 "LESS THAN 18 YEARS"
   2 "18-19 YEARS"
   3 "20-24 YEARS"
   4 "25-29 YEARS"
   5 "30 OR OLDER"
  95 "NO MOTHER OR MOTHER-FIGURE"
  96 "MOTHER-FIGURE HAD NO CHILDREN";

 label define AGER_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMARITAL_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARITAL_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define EDUCAT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HIEDUC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HISPANIC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RACE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HISPRACE2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NUMKDHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NUMFMHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HHFAMTYP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HHPARTYP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NCHILDHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HHKIDTYP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CSPBBHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CSPBSHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CSPOKDHH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INTCTFAM_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARAGE14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define EDUCMOM_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEMOMB1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define rcurpreg
   1 "YES (CURRENTLY PREGNANT)"
   2 "NO (NOT CURRENTLY PREGNANT)";

 label define pregnum
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
   3 "3 PREGNANCIES"
   4 "4 PREGNANCIES"
   5 "5 PREGNANCIES"
   6 "6 PREGNANCIES";

 label define compreg
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
   3 "3 PREGNANCIES"
   4 "4 PREGNANCIES"
   5 "5 PREGNANCIES"
   6 "6 PREGNANCIES";

 label define lossnum
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES";

 label define abortion
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES";

 label define lbpregs
   0 "none"
   1 "1 PREGNANCY"
   2 "2 PREGNANCIES"
   3 "3 PREGNANCIES";

 label define parity
   0 "0 BABIES"
   1 "1 BABY"
   2 "2 BABIES"
   3 "3 BABIES"
   4 "4 BABIES";

 label define BIRTHS5
   0 "0 BIRTHS"
   1 "1 BIRTH"
   2 "2 BIRTHS"
   3 "3 BIRTHS"
   4 "4 BIRTHS";

 label define BIRTH1
   1 "yes"
   2 "no";

 label define OUTCOM01
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM02
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM03
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM04
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM05
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM06
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM07
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM08
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM09
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM10
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM11
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM12
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM13
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define OUTCOM14
   1 "LIVE BIRTH"
   2 "INDUCED ABORTION"
   3 "stillbirth"
   4 "miscarriage"
   5 "ECTOPIC PREGNANCY"
   6 "CURRENT PREGNANCY";

 label define DATEND01
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND02
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND03
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND04
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND05
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND06
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND07
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND08
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND09
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND10
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND11
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND12
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND13
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATEND14
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON01
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON02
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON03
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON04
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON05
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON06
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON07
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON08
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON09
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON10
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON11
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON12
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON13
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define DATCON14
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MAROUT01
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT02
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT03
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT04
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT05
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT06
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT07
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT08
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT09
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT10
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT11
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT12
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT13
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MAROUT14
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define RMAROUT01
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT02
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT03
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT04
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT05
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT06
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT07
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT08
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT09
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT10
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT11
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT12
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT13
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMAROUT14
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define MARCON01
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON02
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON03
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON04
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON05
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON06
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON07
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON08
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON09
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON10
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON11
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON12
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON13
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define MARCON14
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Never married";

 label define RMARCON01
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON02
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON03
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON04
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON05
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON06
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON07
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON08
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON09
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON10
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON11
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON12
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON13
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define RMARCON14
   1 "Married"
   2 "Divorced"
   3 "Widowed"
   4 "Separated"
   5 "Cohabiting"
   6 "Never married, not cohabiting";

 label define cebow
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN";

 label define cebowc
   0 "none"
   1 "1 CHILD"
   2 "2 CHILDREN";

 label define DATBABY1
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define lastpreg
   1 "Less than 1 year"
   2 "1 to 5 years ago"
   3 "5 years or longer ago";

 label define PREG_INT1
   1 "0-5 months"
   2 "6-11 months"
   3 "12-17 months"
   4 "18-23 months"
   5 "24-59 months"
   6 "60 months or longer"
   7 "Could not be defined";

 label define PREG_INT2
   1 "0-5 months"
   2 "6-11 months"
   3 "12-17 months"
   4 "18-23 months"
   5 "24-59 months"
   6 "60 months or longer"
   7 "Could not be defined";

 label define PREG_INT3
   1 "0-5 months"
   2 "6-11 months"
   3 "12-17 months"
   4 "18-23 months"
   5 "24-59 months"
   6 "60 months or longer"
   7 "Could not be defined";

 label define PREG_INT4
   1 "0-5 months"
   2 "6-11 months"
   3 "12-17 months"
   4 "18-23 months"
   5 "24-59 months"
   6 "60 months or longer"
   7 "Could not be defined";

 label define RCURPREG_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PREGNUM_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COMPREG_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LOSSNUM_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ABORTION_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LBPREGS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARITY_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define BIRTHS5_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OUTCOM14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEND14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEPRG14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATCON14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGECON14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAROUT14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMAROUT14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARCON14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RMARCON14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CEBOW_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CEBOWC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATBABY1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEBABY1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define fmarno
   0 "NEVER BEEN MARRIED"
   1 "1 TIME"
   2 "2 TIMES"
   3 "3 TIMES"
   4 "4 TIMES";

 label define MARDAT01
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDAT02
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDAT03
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDAT04
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDIS01
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDIS02
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDIS03
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MARDIS04
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define MAREND01
   1 "DIVORCED OR ANNULLED"
   2 "separated"
   3 "widowed";

 label define MAREND02
   1 "DIVORCED OR ANNULLED"
   2 "separated"
   3 "widowed";

 label define MAREND03
   1 "DIVORCED OR ANNULLED"
   2 "separated"
   3 "widowed";

 label define MAREND04
   1 "DIVORCED OR ANNULLED"
   2 "separated"
   3 "widowed";

 label define MAR1DISS
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "37-48 months"
   5 "More than 4 years";

 label define DD1REMAR
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "37-48 months"
   5 "More than 4 years";

 label define MAR1BIR1
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
 888 "First birth occurred before first marriage";

 label define MAR1CON1
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
 995 "First conception before marriage"
 996 "Has been pregnant, but has never been married";

 label define CON1MAR1
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
 996 "Has been married but has never been pregnant";

 label define B1PREMAR
   1 "yes"
   2 "no";

 label define cohever
   1 "YES, EVER COHABITED (LIVED WITH A MAN OUTSIDE OF MARRIAGE)"
   2 "NO, NEVER COHABITED (LIVED WITH A MAN OUTSIDE OF MARRIAGE)";

 label define evmarcoh
   1 "YES, EVER MARRIED OR COHABITED"
   2 "NO, NEVER MARRIED OR COHABITED";

 label define pmarrno
   0 "None"
   1 "One"
   2 "Two"
   3 "three"
   4 "Four"
   5 "Five or more";

 label define nonmarr
   0 "None"
   1 "One"
   2 "Two"
   3 "three"
   4 "Four"
   5 "Five or more";

 label define timescoh
   0 "None"
   1 "One"
   2 "Two"
   3 "three"
   4 "Four"
   5 "Five or more";

 label define COHAB1
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cohstat
   1 "NEVER COHABITED OUTSIDE OF MARRIAGE"
   2 "FIRST COHABITED BEFORE FIRST MARRIAGE"
   3 "FIRST COHABITED AFTER FIRST MARRIAGE";

 label define cohout
   1 "INTACT COHABITATION"
   2 "INTACT MARRIAGE"
   3 "DISSOLVED MARRIAGE"
   4 "DISSOLVED COHABITATION";

 label define COH1DUR
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "37-48 months"
   5 "More than 4 years";

 label define hadsex
   1 "YES, R EVER HAD INTERCOURSE"
   2 "NO, R NEVER HAD INTERCOURSE";

 label define sexonce
   1 "YES (R HAS HAD SEX ONLY ONCE)"
   2 "NO (R HAS HAD SEX MORE THAN ONCE)";

 label define sexever
   1 "YES (R HAS HAD SEX AFTER 1ST PERIOD)"
   2 "NO (NO PERIOD, NO SEX AT ALL, OR NO SEX SINCE 1ST PERIOD)";

 label define VRY1STAG
  10 "10 YEARS OR YOUNGER";

 label define SEX1AGE
  10 "10 YEARS OR YOUNGER";

 label define VRY1STSX
9996 "RESPONDED SHE NEVER HAD INTERCOURSE"
9997 "Not ascertained";

 label define DATESEX1
9595 "NEVER HAD A MENSTRUAL PERIOD BUT HAS HAD INTERCOURSE"
9997 "Not ascertained";

 label define sexmar
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
   5 "First intercourse after first marriage";

 label define SEX1FOR
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
   5 "First intercourse after menarche after first marriage";

 label define sexunion
   1 "0-12 months"
   2 "13-24 months"
   3 "25-36 months"
   4 "More than 3 years"
   5 "First intercourse after first marriage or cohabitation";

 label define sexout
   1 "Intact cohabitation"
   2 "Intact marriage"
   3 "Dissolved marriage"
   4 "Dissolved cohabitation"
   5 "Never married or cohabited with 1st sexual partner";

 label define fpdur
 997 "Only had sex once with first partner";

 label define PARTS1YR
   0 "none"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 OR MORE PARTNERS";

 label define lsexdate
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define lsexpreg
   1 "yes"
   2 "no";

 label define SEX3MO
   1 "yes"
   2 "no";

 label define NUMP3MOS
   0 "none"
   1 "1 PARTNER";

 label define lsexrage
  10 "10 YEARS OR YOUNGER";

 label define PARTDUR1
 997 "Only had sex once with partner";

 label define PARTDUR2
 997 "Only had sex once with partner";

 label define PARTDUR3
 997 "Only had sex once with partner";

 label define RELATP1
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going out with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else";

 label define RELATP2
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going out with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else";

 label define RELATP3
   1 "Married to him"
   2 "Engaged to him"
   3 "Living together in a sexual relationship, but not engaged"
   4 "Going out with him or going steady"
   5 "Going out with him once in a while"
   6 "Just friends"
   7 "Had just met him"
   8 "Something else";

 label define lifprtnr
   0 "none"
   1 "1 PARTNER"
   2 "2 PARTNERS"
   3 "3 PARTNERS"
   4 "4 PARTNERS"
   5 "5 PARTNERS"
   6 "6 PARTNERS"
   7 "7 PARTNERS"
   8 "8 PARTNERS"
   9 "9 PARTNERS"
  50 "50 OR MORE PARTNERS";

 label define FMARNO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CSPBIOKD_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDAT01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDAT02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDAT03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDAT04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDIS01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDIS02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDIS03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MARDIS04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAREND01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAREND02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAREND03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAREND04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMAR1AGE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEDISS1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define AGEDD1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAR1DISS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DD1REMAR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAR1BIR1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MAR1CON1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CON1MAR1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define B1PREMAR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COHEVER_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define EVMARCOH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PMARRNO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NONMARR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define TIMESCOH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COHAB1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COHSTAT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COHOUT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define COH1DUR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define HADSEX_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXEVER_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define VRY1STAG_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1AGE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define VRY1STSX_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATESEX1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXONCE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXMAR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1FOR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXUNION_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXOUT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPDUR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARTS1YR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LSEXDATE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEXP3MO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NUMP3MOS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LSEXRAGE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARTDUR1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARTDUR2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PARTDUR3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RELATP1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RELATP2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RELATP3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LIFPRTNR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define strloper
   1 "TUBAL LIGATION OR STERILIZATION"
   2 "hysterectomy"
   3 "vasectomy"
   4 "OTHER OPERATION OR TYPE UNKNOWN"
   5 "NOT SURGICALLY STERILE";

 label define fecund
   1 "SURGICALLY STERILE, CONTRACEPTIVE"
   2 "SURGICALLY STERILE, NONCONTRACEPTIVE"
   3 "STERILE, NONSURGICAL"
   4 "subfecund"
   5 "LONG INTERVAL (INFERTILE FOR 36+ MONTHS)"
   6 "fecund";

 label define ANYBC36
   1 "Yes, at least one month of method use"
   2 "No, no months of method use";

 label define NOSEX36
   1 "No, no months of non-intercourse -- intercourse in all months"
   2 "Yes, one or more months of non-intercourse";

 label define infert
   1 "SURGICALLY STERILE"
   2 "infertile"
   3 "fecund";

 label define ANYBC12
   1 "Yes, at least one month of method use"
   2 "No, no months of method use";

 label define anymthd
   1 "yes"
   2 "no";

 label define NOSEX12
   0 "none"
   1 "1 MONTH"
   2 "2 MONTHS"
   3 "3 MONTHS"
   4 "4 MONTHS"
   5 "5 MONTHS"
   6 "6 MONTHS"
   7 "7 MONTHS"
   8 "8 MONTHS"
   9 "9 MONTHS"
  10 "10 MONTHS"
  11 "11 MONTHS"
  12 "12 MONTHS"
  95 "NEVER HAD INTERCOURSE";

 label define SEXP3MO
   1 "yes"
   2 "no";

 label define CONSTAT1
   1 "Female sterilization"
   2 "Male sterilization"
   3 "Norplant or Implanon implant"
   5 "Depo-Provera (injectable)"
   6 "Pill"
   7 "Contraceptive Patch"
   8 "Contraceptive Ring"
   9 "Emergency contraception"
  10 "iud"
  11 "Diaphragm (with or w/out jelly or cream)"
  12 "(Male) Condom"
  13 "Female condom/vaginal pouch"
  14 "Foam"
  15 "Cervical Cap"
  16 "Today(TM) Sponge"
  17 "Suppository or insert"
  18 "Jelly or cream (not with diaphragm)"
  19 "Periodic abstinence: NFP, cervical mucus test or temperature rhythm"
  20 "Periodic abstinence: calendar rhythm"
  21 "Withdrawal"
  22 "Other method"
  30 "Pregnant"
  31 "Seeking Pregnancy"
  32 "Postpartum"
  33 "Sterile--nonsurgical--female"
  34 "Sterile--nonsurgical--male"
  35 "Sterile--surgical--female (noncontraceptive)"
  36 "Sterile--surgical--male (noncontraceptive)"
  37 "[code not used]"
  38 "Sterile--unknown reasons-male"
  39 "[code not used]"
  40 "Other nonuser--never had intercourse since first period"
  41 "Other nonuser--has had intercourse, but not in the 3 months prior to interview"
  42 "Other nonuser--had intercourse in the 3 months prior to interview"
  88 "Inapplicable (no 2nd, 3rd, or 4th method reported)";

 label define CONSTAT2
   1 "Female sterilization"
   2 "Male sterilization"
   3 "Norplant or Implanon implant"
   5 "Depo-Provera (injectable)"
   6 "Pill"
   7 "Contraceptive Patch"
   8 "Contraceptive Ring"
   9 "Emergency contraception"
  10 "iud"
  11 "Diaphragm (with or w/out jelly or cream)"
  12 "(Male) Condom"
  13 "Female condom/vaginal pouch"
  14 "Foam"
  15 "Cervical Cap"
  16 "Today(TM) Sponge"
  17 "Suppository or insert"
  18 "Jelly or cream (not with diaphragm)"
  19 "Periodic abstinence: NFP, cervical mucus test or temperature rhythm"
  20 "Periodic abstinence: calendar rhythm"
  21 "Withdrawal"
  22 "Other method"
  30 "Pregnant"
  31 "Seeking Pregnancy"
  32 "Postpartum"
  33 "Sterile--nonsurgical--female"
  34 "Sterile--nonsurgical--male"
  35 "Sterile--surgical--female (noncontraceptive)"
  36 "Sterile--surgical--male (noncontraceptive)"
  37 "[code not used]"
  38 "Sterile--unknown reasons-male"
  39 "[code not used]"
  40 "Other nonuser--never had intercourse since first period"
  41 "Other nonuser--has had intercourse, but not in the 3 months prior to interview"
  42 "Other nonuser--had intercourse in the 3 months prior to interview"
  88 "Inapplicable (no 2nd, 3rd, or 4th method reported)";

 label define CONSTAT3
   1 "Female sterilization"
   2 "Male sterilization"
   3 "Norplant or Implanon implant"
   5 "Depo-Provera (injectable)"
   6 "Pill"
   7 "Contraceptive Patch"
   8 "Contraceptive Ring"
   9 "Emergency contraception"
  10 "iud"
  11 "Diaphragm (with or w/out jelly or cream)"
  12 "(Male) Condom"
  13 "Female condom/vaginal pouch"
  14 "Foam"
  15 "Cervical Cap"
  16 "Today(TM) Sponge"
  17 "Suppository or insert"
  18 "Jelly or cream (not with diaphragm)"
  19 "Periodic abstinence: NFP, cervical mucus test or temperature rhythm"
  20 "Periodic abstinence: calendar rhythm"
  21 "Withdrawal"
  22 "Other method"
  30 "Pregnant"
  31 "Seeking Pregnancy"
  32 "Postpartum"
  33 "Sterile--nonsurgical--female"
  34 "Sterile--nonsurgical--male"
  35 "Sterile--surgical--female (noncontraceptive)"
  36 "Sterile--surgical--male (noncontraceptive)"
  37 "[code not used]"
  38 "Sterile--unknown reasons-male"
  39 "[code not used]"
  40 "Other nonuser--never had intercourse since first period"
  41 "Other nonuser--has had intercourse, but not in the 3 months prior to interview"
  42 "Other nonuser--had intercourse in the 3 months prior to interview"
  88 "Inapplicable (no 2nd, 3rd, or 4th method reported)";

 label define CONSTAT4
   1 "Female sterilization"
   2 "Male sterilization"
   3 "Norplant or Implanon implant"
   5 "Depo-Provera (injectable)"
   6 "Pill"
   7 "Contraceptive Patch"
   8 "Contraceptive Ring"
   9 "Emergency contraception"
  10 "iud"
  11 "Diaphragm (with or w/out jelly or cream)"
  12 "(Male) Condom"
  13 "Female condom/vaginal pouch"
  14 "Foam"
  15 "Cervical Cap"
  16 "Today(TM) Sponge"
  17 "Suppository or insert"
  18 "Jelly or cream (not with diaphragm)"
  19 "Periodic abstinence: NFP, cervical mucus test or temperature rhythm"
  20 "Periodic abstinence: calendar rhythm"
  21 "Withdrawal"
  22 "Other method"
  30 "Pregnant"
  31 "Seeking Pregnancy"
  32 "Postpartum"
  33 "Sterile--nonsurgical--female"
  34 "Sterile--nonsurgical--male"
  35 "Sterile--surgical--female (noncontraceptive)"
  36 "Sterile--surgical--male (noncontraceptive)"
  37 "[code not used]"
  38 "Sterile--unknown reasons-male"
  39 "[code not used]"
  40 "Other nonuser--never had intercourse since first period"
  41 "Other nonuser--has had intercourse, but not in the 3 months prior to interview"
  42 "Other nonuser--had intercourse in the 3 months prior to interview"
  88 "Inapplicable (no 2nd, 3rd, or 4th method reported)";

 label define pillr
   1 "yes"
   2 "no";

 label define condomr
   1 "yes"
   2 "no";

 label define SEX1MTHD1
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billing Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring"
  95 "Never used a method"
  96 "Did not use a method at 1st intercourse";

 label define SEX1MTHD2
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billing Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring"
  95 "Never used a method"
  96 "Did not use a method at 1st intercourse";

 label define SEX1MTHD3
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billing Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring"
  95 "Never used a method"
  96 "Did not use a method at 1st intercourse";

 label define SEX1MTHD4
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billing Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring"
  95 "Never used a method"
  96 "Did not use a method at 1st intercourse";

 label define MTHUSE12
   1 "USED A METHOD"
   2 "DID NOT USE A METHOD"
  95 "NEVER USED A METHOD";

 label define METH12M1
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera injectable"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH12M2
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera injectable"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH12M3
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera injectable"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH12M4
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera injectable"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define MTHUSE3
   1 "USED A METHOD AT LAST INTERCOURSE IN PAST 3 MONTHS"
   2 "DID NOT USE A METHOD AT LAST INTERCOURSE IN PAST 3 MONTHS"
  95 "NEVER USED A METHOD";

 label define METH3M1
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH3M2
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH3M3
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define METH3M4
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define FMETHOD1
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define FMETHOD2
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define FMETHOD3
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define FMETHOD4
   1 "Pill"
   2 "Condom"
   3 "Partner's vasectomy"
   4 "Female sterilizing operation/tubal ligation"
   5 "Withdrawal"
   6 "Depo-Provera, injectables"
   7 "Hormonal implant (Norplant, Implanon, or Nexplanon)"
   8 "Calendar rhythm, Standard Days, or Cycle Beads method"
   9 "Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
  10 "Diaphragm"
  11 "Female condom, vaginal pouch"
  12 "Foam"
  13 "Jelly or cream"
  14 "Cervical cap"
  15 "Suppository, insert"
  16 "Today sponge"
  17 "IUD, coil, loop"
  18 "Emergency contraception"
  19 "Other method"
  20 "Respondent sterile (aside from sterilizing operation above)"
  21 "Respondent's partner sterile (aside from vasectomy above)"
  22 "Lunelle injectable"
  23 "Contraceptive patch"
  24 "Contraceptive ring";

 label define OLDWP01
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP02
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP03
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP04
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP05
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP06
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP07
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP08
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP09
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP10
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP11
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP12
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP13
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWP14
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR01
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR02
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR03
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR04
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR05
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR06
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR07
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR08
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR09
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR10
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR11
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR12
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR13
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define OLDWR14
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP01
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP02
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP03
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP04
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP05
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP06
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP07
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP08
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP09
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP10
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP11
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP12
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP13
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTRP14
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP01
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP02
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP03
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP04
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP05
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP06
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP07
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP08
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP09
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP10
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP11
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP12
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP13
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define WANTP14
   1 "LATER, OVERDUE"
   2 "RIGHT TIME"
   3 "TOO SOON, MISTIMED"
   4 "DIDN'T CARE, INDIFFERENT"
   5 "unwanted"
   6 "DON'T KNOW, NOT SURE";

 label define NWWANTRP01
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP02
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP03
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP04
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP05
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP06
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP07
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP08
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP09
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP10
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP11
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP12
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP13
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define NWWANTRP14
   1 "Later, overdue"
   2 "Right time"
   3 "Too soon: by less than 2 years"
   4 "Too soon: by 2 years or more"
   5 "Didn't care, indifferent"
   6 "Unwanted"
   7 "Don't know, not sure";

 label define WANTP5
   0 "No wanted pregnancies in last 5 years";

 label define STRLOPER_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FECUND_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INFERT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ANYMTHD_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NOSEX12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX3MO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CONSTAT1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CONSTAT2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CONSTAT3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CONSTAT4_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PILLR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CONDOMR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1MTHD1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1MTHD2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1MTHD3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define SEX1MTHD4_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MTHUSE12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH12M1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH12M2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH12M3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH12M4_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define MTHUSE3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH3M1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH3M2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH3M3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define METH3M4_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMETHOD1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMETHOD2_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMETHOD3_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FMETHOD4_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define DATEUSE1_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWP14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OLDWR14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTRP14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP01_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP02_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP03_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP04_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP05_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP06_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP07_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP08_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP09_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP10_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP11_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP13_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define NWWANTRP14_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define WANTP5_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTIT12
   1 "TITLE X CLINIC"
   2 "NON-TITLE X CLINIC";

 label define fptitmed
   1 "TITLE X CLINIC"
   2 "NON-TITLE X CLINIC";

 label define fptitste
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitbc
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitchk
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitcbc
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitcst
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitec
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitcec
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitpre
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitabo
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitpap
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitpel
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitprn
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitppr
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fptitstd
   1 "CLINIC: TITLE X=YES HEALTH DEPT=YES"
   2 "CLINIC: TITLE X=YES HEALTH DEPT=NO"
   3 "CLINIC: TITLE X=NO HEALTH DEPT=YES"
   4 "CLINIC: TITLE X=NO HEALTH DEPT=NO"
   5 "CLINIC: TITLE X=YES AGENCY UNKNOWN"
   6 "CLINIC: TITLE X=NO AGENCY UNKNOWN"
   7 "EMPLOYER OR COMPANY CLINIC"
   8 "PRIVATE DOCTOR'S OFFICE OR HMO"
   9 "HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
  10 "SOME OTHER PLACE";

 label define fpregfp
   1 "yes"
   2 "no";

 label define fpregmed
   1 "yes"
   2 "no";

 label define FPTIT12_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITMED_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITSTE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITBC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITCHK_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITCBC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITCST_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITEC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITCEC_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITPRE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITABO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITPAP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITPEL_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITPRN_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITPPR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITSTD_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPREGFP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPREGMED_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define intent
   1 "R INTENDS TO HAVE (MORE) CHILDREN"
   2 "R DOES NOT INTEND TO HAVE (MORE) CHILDREN"
   3 "R DOES NOT KNOW HER INTENT";

 label define addexp
   0 "NO ADDITIONAL BIRTHS"
   5 ".5 ADDITIONAL BIRTHS"
  10 "1 ADDITIONAL BIRTH"
  15 "1.5 ADDITIONAL BIRTHS"
  20 "2 ADDITIONAL BIRTHS"
  25 "2.5 ADDITIONAL BIRTHS"
  30 "3 ADDITIONAL BIRTHS"
  35 "3.5 ADDITIONAL BIRTHS"
  40 "4 ADDITIONAL BIRTHS"
  45 "4.5 ADDITIONAL BIRTHS"
  50 "5 ADDITIONAL BIRTHS"
  55 "5.5 ADDITIONAL BIRTHS"
  60 "6 ADDITIONAL BIRTHS"
  65 "6.5 ADDITIONAL BIRTHS"
  70 "7 ADDITIONAL BIRTHS"
  75 "7.5 ADDITIONAL BIRTHS"
  80 "8 ADDITIONAL BIRTHS"
  85 "8.5 ADDITIONAL BIRTHS"
  90 "9 ADDITIONAL BIRTHS"
  95 "9.5 ADDITIONAL BIRTHS";

 label define INTENT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ADDEXP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define anyprghp
   1 "yes"
   2 "no";

 label define anymschp
   1 "yes"
   2 "no";

 label define infever
   1 "yes"
   2 "no";

 label define ovulate
   1 "reported"
   2 "NOT REPORTED";

 label define tubes
   1 "reported"
   2 "NOT REPORTED";

 label define infertr
   1 "reported"
   2 "NOT REPORTED";

 label define inferth
   1 "reported"
   2 "NOT REPORTED";

 label define advice
   1 "reported"
   2 "NOT REPORTED";

 label define insem
   1 "reported"
   2 "NOT REPORTED";

 label define invitro
   1 "reported"
   2 "NOT REPORTED";

 label define endomet
   1 "reported"
   2 "NOT REPORTED";

 label define fibroids
   1 "reported"
   2 "NOT REPORTED";

 label define pidtreat
   1 "yes"
   2 "no";

 label define evhivtst
   0 "NO HIV TEST REPORTED"
   1 "YES, ONLY AS PART OF BLOOD DONATION"
   2 "YES, ONLY OUTSIDE OF BLOOD DONATION"
   3 "YES, IN BOTH CONTEXTS";

 label define fptithiv
   1 "Clinic: Title X=yes; health department=yes"
   2 "Clinic: Title X=yes; health department=no"
   3 "Clinic: Title X=no; health department=yes"
   4 "Clinic: Title X=no; health department=no"
   5 "Clinic: Title X=yes; agency unknown"
   6 "Clinic: Title X=no; agency unknown"
   7 "Employer or company clinic/worksite"
   8 "Private Doctor's office or HMO"
   9 "Hospital emergency room/regular room/urgent care"
  10 "Home"
  11 "Military site"
  12 "Lab or blood bank"
  13 "Some other place";

 label define ANYPRGHP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ANYMSCHP_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INFEVER_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define OVULATE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define TUBES_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INFERTR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INFERTH_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ADVICE_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INSEM_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define INVITRO_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define ENDOMET_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FIBROIDS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PIDTREAT_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define EVHIVTST_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define FPTITHIV_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define CURR_INS
   1 "Currently covered by private health insurance or Medi-Gap"
   2 "Currently covered by Medicaid, CHIP, or a state-sponsored health plan"
   3 "Currently covered by Medicare, military health care, or other government health care"
   4 "Currently covered only by a single-service plan, only by the Indian Health Service, or currently not covered by health insurance";

 label define metro
   1 "PRINCIPAL CITY OF MSA"
   2 "OTHER MSA"
   3 "NOT MSA";

 label define religion
   1 "NO RELIGION"
   2 "catholic"
   3 "protestant"
   4 "OTHER RELIGIONS";

 label define laborfor
   1 "Working full-time"
   2 "Working part-time"
   3 "Working, but on vacation, strike, or had temporary illness"
   4 "Working - maternity or family leave"
   5 "Not working but looking for work"
   6 "In school"
   7 "Keeping house"
   8 "Caring for family"
   9 "Other";

 label define CURR_INS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define RELIGION_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define LABORFOR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define poverty
  50 "50 percent of poverty level"
 700 "700 percent of poverty level or greater";

 label define totincr
   1 "Under $5000"
   2 "$5000-$7499"
   3 "$7500-$9999"
   4 "$10,000-$12,499"
   5 "$12,500-$14,999"
   6 "$15,000-$19,999"
   7 "$20,000-$24,999"
   8 "$25,000-$29,999"
   9 "$30,000-$34,999"
  10 "$35,000-$39,999"
  11 "$40,000-$49,999"
  12 "$50,000-$59,999"
  13 "$60,000-$74,999"
  14 "$75,000-$99,999"
  15 "$100,000 or more";

 label define pubassis
   1 "Yes (received public assistance in [INTERVIEW YEAR-1])"
   2 "No (did not receive public assistance in [INTERVIEW YEAR-1])";

 label define POVERTY_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define TOTINCR_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define PUBASSIS_I
   0 "QUESTIONNAIRE DATA (NOT IMPUTED)"
   1 "MULTIPLE REGRESSION IMPUTATION"
   2 "LOGICAL IMPUTATION";

 label define secu
   1 "1"
   2 "2"
   3 "3"
   4 "4";

 label define cmintvw
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define cmlstyr
9997 "Not ascertained"
9998 "Refused"
9999 "Don't know";

 label define CMJAN3YR
1345 "January 2012"
1357 "January 2013"
1369 "January 2014"
1381 "January 2015"
1393 "January 2016";

 label define CMJAN4YR
1333 "January 2011"
1345 "January 2012"
1357 "January 2013"
1369 "January 2014"
1381 "January 2015";

 label define CMJAN5YR
1321 "January 2010"
1333 "January 2011"
1345 "January 2012"
1357 "January 2013"
1369 "January 2014";

 label define phase
   1 "First 10 weeks of quarter"
   2 "Last 2 weeks of quarter (double sample)";

 label values rscrninf rscrninf ;
 label values rscrage rscrage ;
 label values rscrhisp rscrhisp ;
 label values rscrrace rscrrace ;
 label values AGE_A AGE_A ;
 label values AGE_R AGE_R ;
 label values agescrn agescrn ;
 label values hisp hisp ;
 label values hispgrp hispgrp ;
 label values PRIMLANG1 PRIMLANG1 ;
 label values PRIMLANG2 PRIMLANG2 ;
 label values PRIMLANG3 PRIMLANG3 ;
 label values roscnt roscnt ;
 label values numchild numchild ;
 label values HHKIDS18 HHKIDS18 ;
 label values DAUGHT918 DAUGHT918 ;
 label values SON918 SON918 ;
 label values nonbiokids nonbiokids ;
 label values marstat marstat ;
 label values fmarstat fmarstat ;
 label values fmarit fmarit ;
 label values evrmarry evrmarry ;
 label values hplocale hplocale ;
 label values manrel manrel ;
 label values goschol goschol ;
 label values vaca vaca ;
 label values higrade higrade ;
 label values compgrd compgrd ;
 label values dipged dipged ;
 label values EARNHS_Y EARNHS_Y ;
 label values hischgrd hischgrd ;
 label values lstgrade lstgrade ;
 label values MYSCHOL_Y MYSCHOL_Y ;
 label values havedeg havedeg ;
 label values degrees degrees ;
 label values EARNBA_Y EARNBA_Y ;
 label values expschl expschl ;
 label values expgrade expgrade ;
 label values wthparnw wthparnw ;
 label values onown onown ;
 label values ONOWN18 ONOWN18 ;
 label values intact intact ;
 label values parmarr parmarr ;
 label values INTACT18 INTACT18 ;
 label values LVSIT14F LVSIT14F ;
 label values LVSIT14M LVSIT14M ;
 label values womrasdu womrasdu ;
 label values momdegre momdegre ;
 label values momworkd momworkd ;
 label values momfstch momfstch ;
 label values MOM18 MOM18 ;
 label values manrasdu manrasdu ;
 label values fosterev fosterev ;
 label values mnyfster mnyfster ;
 label values durfster durfster ;
 label values agefster agefster ;
 label values menarche menarche ;
 label values pregnowq pregnowq ;
 label values maybpreg maybpreg ;
 label values everpreg everpreg ;
 label values currpreg currpreg ;
 label values moscurrp moscurrp ;
 label values hasbabes hasbabes ;
 label values cmlastlb cmlastlb ;
 label values cmlstprg cmlstprg ;
 label values nplaced nplaced ;
 label values ndied ndied ;
 label values nadoptv nadoptv ;
 label values totplacd totplacd ;
 label values otherkid otherkid ;
 label values nothrkid nothrkid ;
 label values relothkd relothkd ;
 label values adptotkd adptotkd ;
 label values tryadopt tryadopt ;
 label values tryeithr tryeithr ;
 label values NBAGECAME1 NBAGECAME1 ;
 label values othkdfos othkdfos ;
 label values RELOTHKD2 RELOTHKD2 ;
 label values ADPTOTKD2 ADPTOTKD2 ;
 label values TRYADOPT2 TRYADOPT2 ;
 label values TRYEITHR2 TRYEITHR2 ;
 label values NBAGECAME2 NBAGECAME2 ;
 label values OTHKDFOS2 OTHKDFOS2 ;
 label values RELOTHKD3 RELOTHKD3 ;
 label values ADPTOTKD3 ADPTOTKD3 ;
 label values TRYADOPT3 TRYADOPT3 ;
 label values TRYEITHR3 TRYEITHR3 ;
 label values NBAGECAME3 NBAGECAME3 ;
 label values OTHKDFOS3 OTHKDFOS3 ;
 label values RELOTHKD4 RELOTHKD4 ;
 label values ADPTOTKD4 ADPTOTKD4 ;
 label values TRYADOPT4 TRYADOPT4 ;
 label values TRYEITHR4 TRYEITHR4 ;
 label values NBAGECAME4 NBAGECAME4 ;
 label values OTHKDFOS4 OTHKDFOS4 ;
 label values RELOTHKD5 RELOTHKD5 ;
 label values ADPTOTKD5 ADPTOTKD5 ;
 label values TRYADOPT5 TRYADOPT5 ;
 label values TRYEITHR5 TRYEITHR5 ;
 label values NBAGECAME5 NBAGECAME5 ;
 label values OTHKDFOS5 OTHKDFOS5 ;
 label values RELOTHKD6 RELOTHKD6 ;
 label values ADPTOTKD6 ADPTOTKD6 ;
 label values TRYADOPT6 TRYADOPT6 ;
 label values TRYEITHR6 TRYEITHR6 ;
 label values NBAGECAME6 NBAGECAME6 ;
 label values OTHKDFOS6 OTHKDFOS6 ;
 label values RELOTHKD7 RELOTHKD7 ;
 label values ADPTOTKD7 ADPTOTKD7 ;
 label values TRYADOPT7 TRYADOPT7 ;
 label values TRYEITHR7 TRYEITHR7 ;
 label values NBAGECAME7 NBAGECAME7 ;
 label values OTHKDFOS7 OTHKDFOS7 ;
 label values RELOTHKD8 RELOTHKD8 ;
 label values ADPTOTKD8 ADPTOTKD8 ;
 label values TRYADOPT8 TRYADOPT8 ;
 label values TRYEITHR8 TRYEITHR8 ;
 label values NBAGECAME8 NBAGECAME8 ;
 label values OTHKDFOS8 OTHKDFOS8 ;
 label values RELOTHKD9 RELOTHKD9 ;
 label values ADPTOTKD9 ADPTOTKD9 ;
 label values TRYADOPT9 TRYADOPT9 ;
 label values TRYEITHR9 TRYEITHR9 ;
 label values NBAGECAME9 NBAGECAME9 ;
 label values OTHKDFOS9 OTHKDFOS9 ;
 label values RELOTHKD10 RELOTHKD10 ;
 label values ADPTOTKD10 ADPTOTKD10 ;
 label values TRYADOPT10 TRYADOPT10 ;
 label values TRYEITHR10 TRYEITHR10 ;
 label values NBAGECAME10 NBAGECAME10 ;
 label values OTHKDFOS10 OTHKDFOS10 ;
 label values RELOTHKD11 RELOTHKD11 ;
 label values ADPTOTKD11 ADPTOTKD11 ;
 label values TRYADOPT11 TRYADOPT11 ;
 label values TRYEITHR11 TRYEITHR11 ;
 label values NBAGECAME11 NBAGECAME11 ;
 label values OTHKDFOS11 OTHKDFOS11 ;
 label values RELOTHKD12 RELOTHKD12 ;
 label values ADPTOTKD12 ADPTOTKD12 ;
 label values TRYADOPT12 TRYADOPT12 ;
 label values TRYEITHR12 TRYEITHR12 ;
 label values NBAGECAME12 NBAGECAME12 ;
 label values OTHKDFOS12 OTHKDFOS12 ;
 label values RELOTHKD13 RELOTHKD13 ;
 label values ADPTOTKD13 ADPTOTKD13 ;
 label values TRYADOPT13 TRYADOPT13 ;
 label values TRYEITHR13 TRYEITHR13 ;
 label values NBAGECAME13 NBAGECAME13 ;
 label values OTHKDFOS13 OTHKDFOS13 ;
 label values RELOTHKD14 RELOTHKD14 ;
 label values ADPTOTKD14 ADPTOTKD14 ;
 label values TRYADOPT14 TRYADOPT14 ;
 label values TRYEITHR14 TRYEITHR14 ;
 label values NBAGECAME14 NBAGECAME14 ;
 label values OTHKDFOS14 OTHKDFOS14 ;
 label values RELOTHKD15 RELOTHKD15 ;
 label values ADPTOTKD15 ADPTOTKD15 ;
 label values TRYADOPT15 TRYADOPT15 ;
 label values TRYEITHR15 TRYEITHR15 ;
 label values NBAGECAME15 NBAGECAME15 ;
 label values OTHKDFOS15 OTHKDFOS15 ;
 label values RELOTHKD16 RELOTHKD16 ;
 label values ADPTOTKD16 ADPTOTKD16 ;
 label values TRYADOPT16 TRYADOPT16 ;
 label values TRYEITHR16 TRYEITHR16 ;
 label values NBAGECAME16 NBAGECAME16 ;
 label values OTHKDFOS16 OTHKDFOS16 ;
 label values RELOTHKD17 RELOTHKD17 ;
 label values ADPTOTKD17 ADPTOTKD17 ;
 label values TRYADOPT17 TRYADOPT17 ;
 label values TRYEITHR17 TRYEITHR17 ;
 label values NBAGECAME17 NBAGECAME17 ;
 label values OTHKDFOS17 OTHKDFOS17 ;
 label values RELOTHKD18 RELOTHKD18 ;
 label values ADPTOTKD18 ADPTOTKD18 ;
 label values TRYADOPT18 TRYADOPT18 ;
 label values TRYEITHR18 TRYEITHR18 ;
 label values NBAGECAME18 NBAGECAME18 ;
 label values OTHKDFOS18 OTHKDFOS18 ;
 label values everadpt everadpt ;
 label values seekadpt seekadpt ;
 label values contagem contagem ;
 label values trylong trylong ;
 label values knowadpt knowadpt ;
 label values evwntano evwntano ;
 label values evcontag evcontag ;
 label values turndown turndown ;
 label values yquittry yquittry ;
 label values APROCESS1 APROCESS1 ;
 label values APROCESS2 APROCESS2 ;
 label values APROCESS3 APROCESS3 ;
 label values hrdembryo hrdembryo ;
 label values SRCEMBRYO_1 SRCEMBRYO_1 ;
 label values SRCEMBRYO_2 SRCEMBRYO_2 ;
 label values SRCEMBRYO_3 SRCEMBRYO_3 ;
 label values SRCEMBRYO_4 SRCEMBRYO_4 ;
 label values SRCEMBRYO_5 SRCEMBRYO_5 ;
 label values timesmar timesmar ;
 label values hsbverif hsbverif ;
 label values hxagemar hxagemar ;
 label values lvtoghx lvtoghx ;
 label values STRTOGHX_Y STRTOGHX_Y ;
 label values engaghx engaghx ;
 label values HSBRACE1 HSBRACE1 ;
 label values HSBNRACE1 HSBNRACE1 ;
 label values chedmarn chedmarn ;
 label values marbefhx marbefhx ;
 label values kidshx kidshx ;
 label values numkdshx numkdshx ;
 label values kidlivhx kidlivhx ;
 label values CHKID18A CHKID18A ;
 label values CHKID18B CHKID18B ;
 label values WHRCHKDS1 WHRCHKDS1 ;
 label values WHRCHKDS2 WHRCHKDS2 ;
 label values WHRCHKDS3 WHRCHKDS3 ;
 label values supporch supporch ;
 label values biohusbx biohusbx ;
 label values bionumhx bionumhx ;
 label values HXAGEMAR2 HXAGEMAR2 ;
 label values LVTOGHX2 LVTOGHX2 ;
 label values STRTOGHX_Y2 STRTOGHX_Y2 ;
 label values ENGAGHX2 ENGAGHX2 ;
 label values HSBRACE2 HSBRACE2 ;
 label values HSBNRACE2 HSBNRACE2 ;
 label values CHEDMARN2 CHEDMARN2 ;
 label values MARBEFHX2 MARBEFHX2 ;
 label values KIDSHX2 KIDSHX2 ;
 label values NUMKDSHX2 NUMKDSHX2 ;
 label values KIDLIVHX2 KIDLIVHX2 ;
 label values CHKID18A2 CHKID18A2 ;
 label values CHKID18B2 CHKID18B2 ;
 label values WHRCHKDS5 WHRCHKDS5 ;
 label values WHRCHKDS6 WHRCHKDS6 ;
 label values SUPPORCH2 SUPPORCH2 ;
 label values BIOHUSBX2 BIOHUSBX2 ;
 label values BIONUMHX2 BIONUMHX2 ;
 label values HXAGEMAR3 HXAGEMAR3 ;
 label values LVTOGHX3 LVTOGHX3 ;
 label values STRTOGHX_Y3 STRTOGHX_Y3 ;
 label values ENGAGHX3 ENGAGHX3 ;
 label values HSBRACE3 HSBRACE3 ;
 label values HSBNRACE3 HSBNRACE3 ;
 label values CHEDMARN3 CHEDMARN3 ;
 label values MARBEFHX3 MARBEFHX3 ;
 label values KIDSHX3 KIDSHX3 ;
 label values NUMKDSHX3 NUMKDSHX3 ;
 label values KIDLIVHX3 KIDLIVHX3 ;
 label values CHKID18A3 CHKID18A3 ;
 label values CHKID18B3 CHKID18B3 ;
 label values WHRCHKDS9 WHRCHKDS9 ;
 label values WHRCHKDS10 WHRCHKDS10 ;
 label values SUPPORCH3 SUPPORCH3 ;
 label values BIOHUSBX3 BIOHUSBX3 ;
 label values BIONUMHX3 BIONUMHX3 ;
 label values HXAGEMAR4 HXAGEMAR4 ;
 label values LVTOGHX4 LVTOGHX4 ;
 label values STRTOGHX_Y4 STRTOGHX_Y4 ;
 label values ENGAGHX4 ENGAGHX4 ;
 label values HSBRACE4 HSBRACE4 ;
 label values HSBNRACE4 HSBNRACE4 ;
 label values CHEDMARN4 CHEDMARN4 ;
 label values MARBEFHX4 MARBEFHX4 ;
 label values KIDSHX4 KIDSHX4 ;
 label values NUMKDSHX4 NUMKDSHX4 ;
 label values KIDLIVHX4 KIDLIVHX4 ;
 label values CHKID18A4 CHKID18A4 ;
 label values CHKID18B4 CHKID18B4 ;
 label values WHRCHKDS13 WHRCHKDS13 ;
 label values WHRCHKDS14 WHRCHKDS14 ;
 label values SUPPORCH4 SUPPORCH4 ;
 label values BIOHUSBX4 BIOHUSBX4 ;
 label values BIONUMHX4 BIONUMHX4 ;
 label values cmmarrch cmmarrch ;
 label values prevhusb prevhusb ;
 label values WNSTRTCP_Y WNSTRTCP_Y ;
 label values cpherage cpherage ;
 label values cphisage cphisage ;
 label values CPENGAG1 CPENGAG1 ;
 label values willmarr willmarr ;
 label values curcohrace curcohrace ;
 label values curcohnrace curcohnrace ;
 label values cpeduc cpeduc ;
 label values cpmarbef cpmarbef ;
 label values cpkids cpkids ;
 label values cpnumkds cpnumkds ;
 label values cpkidliv cpkidliv ;
 label values CPKID18A CPKID18A ;
 label values CPKID18B CPKID18B ;
 label values WHRCPKDS1 WHRCPKDS1 ;
 label values WHRCPKDS2 WHRCPKDS2 ;
 label values WHRCPKDS3 WHRCPKDS3 ;
 label values supporcp supporcp ;
 label values biocp biocp ;
 label values bionumcp bionumcp ;
 label values cmstrthp cmstrthp ;
 label values liveoth liveoth ;
 label values evrcohab evrcohab ;
 label values hmothmen hmothmen ;
 label values prevcohb prevcohb ;
 label values STRTOTHX_Y STRTOTHX_Y ;
 label values heragecx heragecx ;
 label values hisagecx hisagecx ;
 label values ENGAG1CX ENGAG1CX ;
 label values COH1RACE COH1RACE ;
 label values COH1NRACE COH1NRACE ;
 label values marevcx marevcx ;
 label values cxkids cxkids ;
 label values biofcpx biofcpx ;
 label values bionumcx bionumcx ;
 label values STPTOGCX_Y STPTOGCX_Y ;
 label values STRTOTHX_Y2 STRTOTHX_Y2 ;
 label values HERAGECX2 HERAGECX2 ;
 label values HISAGECX2 HISAGECX2 ;
 label values ENGAG1CX2 ENGAG1CX2 ;
 label values MAREVCX2 MAREVCX2 ;
 label values CXKIDS2 CXKIDS2 ;
 label values BIOFCPX2 BIOFCPX2 ;
 label values BIONUMCX2 BIONUMCX2 ;
 label values STPTOGCX_Y2 STPTOGCX_Y2 ;
 label values STRTOTHX_Y3 STRTOTHX_Y3 ;
 label values HERAGECX3 HERAGECX3 ;
 label values HISAGECX3 HISAGECX3 ;
 label values ENGAG1CX3 ENGAG1CX3 ;
 label values MAREVCX3 MAREVCX3 ;
 label values CXKIDS3 CXKIDS3 ;
 label values BIOFCPX3 BIOFCPX3 ;
 label values BIONUMCX3 BIONUMCX3 ;
 label values STPTOGCX_Y3 STPTOGCX_Y3 ;
 label values STRTOTHX_Y4 STRTOTHX_Y4 ;
 label values HERAGECX4 HERAGECX4 ;
 label values HISAGECX4 HISAGECX4 ;
 label values ENGAG1CX4 ENGAG1CX4 ;
 label values MAREVCX4 MAREVCX4 ;
 label values CXKIDS4 CXKIDS4 ;
 label values BIOFCPX4 BIOFCPX4 ;
 label values BIONUMCX4 BIONUMCX4 ;
 label values STPTOGCX_Y4 STPTOGCX_Y4 ;
 label values cohchance cohchance ;
 label values marrchance marrchance ;
 label values pmarcoh pmarcoh ;
 label values eversex eversex ;
 label values rhadsex rhadsex ;
 label values ynosex ynosex ;
 label values grfstsx grfstsx ;
 label values sxmtonce sxmtonce ;
 label values TALKPAR1 TALKPAR1 ;
 label values TALKPAR2 TALKPAR2 ;
 label values TALKPAR3 TALKPAR3 ;
 label values TALKPAR4 TALKPAR4 ;
 label values TALKPAR5 TALKPAR5 ;
 label values TALKPAR6 TALKPAR6 ;
 label values TALKPAR7 TALKPAR7 ;
 label values sedno sedno ;
 label values SEDNOLC1 SEDNOLC1 ;
 label values SEDNOLC2 SEDNOLC2 ;
 label values SEDNOLC3 SEDNOLC3 ;
 label values SEDNOLC4 SEDNOLC4 ;
 label values sednog sednog ;
 label values sednosx sednosx ;
 label values sedbc sedbc ;
 label values SEDBCLC1 SEDBCLC1 ;
 label values SEDBCLC2 SEDBCLC2 ;
 label values SEDBCLC3 SEDBCLC3 ;
 label values SEDBCLC4 SEDBCLC4 ;
 label values sedbcg sedbcg ;
 label values sedbcsx sedbcsx ;
 label values sedwhbc sedwhbc ;
 label values SEDWHLC1 SEDWHLC1 ;
 label values SEDWHLC2 SEDWHLC2 ;
 label values SEDWHLC3 SEDWHLC3 ;
 label values SEDWHLC4 SEDWHLC4 ;
 label values sedwhbcg sedwhbcg ;
 label values sedwbcsx sedwbcsx ;
 label values sedcond sedcond ;
 label values SEDCONLC1 SEDCONLC1 ;
 label values SEDCONLC2 SEDCONLC2 ;
 label values SEDCONLC3 SEDCONLC3 ;
 label values SEDCONLC4 SEDCONLC4 ;
 label values sedcondg sedcondg ;
 label values sedconsx sedconsx ;
 label values sedstd sedstd ;
 label values SEDSTDLC1 SEDSTDLC1 ;
 label values SEDSTDLC2 SEDSTDLC2 ;
 label values SEDSTDLC3 SEDSTDLC3 ;
 label values SEDSTDLC4 SEDSTDLC4 ;
 label values sedstdg sedstdg ;
 label values sedstdsx sedstdsx ;
 label values sedhiv sedhiv ;
 label values SEDHIVLC1 SEDHIVLC1 ;
 label values SEDHIVLC2 SEDHIVLC2 ;
 label values SEDHIVLC3 SEDHIVLC3 ;
 label values SEDHIVLC4 SEDHIVLC4 ;
 label values sedhivg sedhivg ;
 label values sedhivsx sedhivsx ;
 label values sedabst sedabst ;
 label values SEDABLC1 SEDABLC1 ;
 label values SEDABLC2 SEDABLC2 ;
 label values SEDABLC3 SEDABLC3 ;
 label values SEDABLC4 SEDABLC4 ;
 label values sedabstg sedabstg ;
 label values sedabssx sedabssx ;
 label values sameman sameman ;
 label values whofstpr whofstpr ;
 label values knowfp knowfp ;
 label values stilfpsx stilfpsx ;
 label values LSTSEXFP_M LSTSEXFP_M ;
 label values LSTSEXFP_Y LSTSEXFP_Y ;
 label values cmlsexfp cmlsexfp ;
 label values cmfplast cmfplast ;
 label values fpothrel fpothrel ;
 label values fpeduc fpeduc ;
 label values fsexrace fsexrace ;
 label values fsexnrace fsexnrace ;
 label values fprn fprn ;
 label values WHICH1ST WHICH1ST ;
 label values sexafmen sexafmen ;
 label values PTSB4MAR PTSB4MAR ;
 label values WHOSNC1Y WHOSNC1Y ;
 label values matchfp matchfp ;
 label values matchhp matchhp ;
 label values P1YRELP P1YRELP ;
 label values cmlsex cmlsex ;
 label values P1YLSEX_M P1YLSEX_M ;
 label values P1YLSEX_Y P1YLSEX_Y ;
 label values P1YCURRP P1YCURRP ;
 label values pcurrnt pcurrnt ;
 label values MATCHFP2 MATCHFP2 ;
 label values MATCHHP2 MATCHHP2 ;
 label values P1YRELP2 P1YRELP2 ;
 label values CMLSEX2 CMLSEX2 ;
 label values P1YLSEX_M2 P1YLSEX_M2 ;
 label values P1YLSEX_Y2 P1YLSEX_Y2 ;
 label values P1YCURRP2 P1YCURRP2 ;
 label values PCURRNT2 PCURRNT2 ;
 label values MATCHFP3 MATCHFP3 ;
 label values MATCHHP3 MATCHHP3 ;
 label values P1YRELP3 P1YRELP3 ;
 label values CMLSEX3 CMLSEX3 ;
 label values P1YLSEX_M3 P1YLSEX_M3 ;
 label values P1YLSEX_Y3 P1YLSEX_Y3 ;
 label values P1YCURRP3 P1YCURRP3 ;
 label values PCURRNT3 PCURRNT3 ;
 label values P1YOTHREL P1YOTHREL ;
 label values P1YRAGE P1YRAGE ;
 label values P1YHSAGE P1YHSAGE ;
 label values P1YRF P1YRF ;
 label values P1YFSEX_M P1YFSEX_M ;
 label values P1YFSEX_Y P1YFSEX_Y ;
 label values cmfsex cmfsex ;
 label values cmfsextot cmfsextot ;
 label values P1YEDUC P1YEDUC ;
 label values P1YRACE1 P1YRACE1 ;
 label values P1YNRACE1 P1YNRACE1 ;
 label values P1YRN P1YRN ;
 label values P1YOTHREL2 P1YOTHREL2 ;
 label values P1YRAGE2 P1YRAGE2 ;
 label values P1YHSAGE2 P1YHSAGE2 ;
 label values P1YRF2 P1YRF2 ;
 label values P1YFSEX_M2 P1YFSEX_M2 ;
 label values P1YFSEX_Y2 P1YFSEX_Y2 ;
 label values CMFSEX2 CMFSEX2 ;
 label values CMFSEXTOT2 CMFSEXTOT2 ;
 label values P1YEDUC2 P1YEDUC2 ;
 label values P1YRACE2 P1YRACE2 ;
 label values P1YNRACE2 P1YNRACE2 ;
 label values P1YRN2 P1YRN2 ;
 label values P1YOTHREL3 P1YOTHREL3 ;
 label values P1YRAGE3 P1YRAGE3 ;
 label values P1YHSAGE3 P1YHSAGE3 ;
 label values P1YRF3 P1YRF3 ;
 label values P1YFSEX_M3 P1YFSEX_M3 ;
 label values P1YFSEX_Y3 P1YFSEX_Y3 ;
 label values CMFSEX3 CMFSEX3 ;
 label values CMFSEXTOT3 CMFSEXTOT3 ;
 label values P1YEDUC3 P1YEDUC3 ;
 label values P1YRACE3 P1YRACE3 ;
 label values P1YNRACE3 P1YNRACE3 ;
 label values P1YRN3 P1YRN3 ;
 label values currprtt currprtt ;
 label values currprts currprts ;
 label values CMCURRP1 CMCURRP1 ;
 label values CMCURRP2 CMCURRP2 ;
 label values CMCURRP3 CMCURRP3 ;
 label values evertubs evertubs ;
 label values essure essure ;
 label values everhyst everhyst ;
 label values everovrs everovrs ;
 label values everothr everothr ;
 label values whtooprc whtooprc ;
 label values onotfunc onotfunc ;
 label values dfnlstrl dfnlstrl ;
 label values anytubal anytubal ;
 label values hyst hyst ;
 label values ovarem ovarem ;
 label values othr othr ;
 label values anyfster anyfster ;
 label values anyopsmn anyopsmn ;
 label values whatopsm whatopsm ;
 label values dfnlstrm dfnlstrm ;
 label values anymster anymster ;
 label values anyvas anyvas ;
 label values othrm othrm ;
 label values DATFEMOP_Y DATFEMOP_Y ;
 label values plcfemop plcfemop ;
 label values PAYRSTER1 PAYRSTER1 ;
 label values PAYRSTER2 PAYRSTER2 ;
 label values PAYRSTER3 PAYRSTER3 ;
 label values rhadall rhadall ;
 label values hhadall hhadall ;
 label values FMEDREAS1 FMEDREAS1 ;
 label values FMEDREAS2 FMEDREAS2 ;
 label values FMEDREAS3 FMEDREAS3 ;
 label values FMEDREAS4 FMEDREAS4 ;
 label values FMEDREAS5 FMEDREAS5 ;
 label values bcreas bcreas ;
 label values bcwhyf bcwhyf ;
 label values mincdnnr mincdnnr ;
 label values DATFEMOP_Y2 DATFEMOP_Y2 ;
 label values PLCFEMOP2 PLCFEMOP2 ;
 label values PAYRSTER6 PAYRSTER6 ;
 label values PAYRSTER7 PAYRSTER7 ;
 label values PAYRSTER8 PAYRSTER8 ;
 label values RHADALL2 RHADALL2 ;
 label values HHADALL2 HHADALL2 ;
 label values FMEDREAS7 FMEDREAS7 ;
 label values FMEDREAS8 FMEDREAS8 ;
 label values FMEDREAS9 FMEDREAS9 ;
 label values FMEDREAS10 FMEDREAS10 ;
 label values FMEDREAS11 FMEDREAS11 ;
 label values BCREAS2 BCREAS2 ;
 label values BCWHYF2 BCWHYF2 ;
 label values MINCDNNR2 MINCDNNR2 ;
 label values DATFEMOP_Y3 DATFEMOP_Y3 ;
 label values PLCFEMOP3 PLCFEMOP3 ;
 label values PAYRSTER11 PAYRSTER11 ;
 label values PAYRSTER12 PAYRSTER12 ;
 label values PAYRSTER13 PAYRSTER13 ;
 label values RHADALL3 RHADALL3 ;
 label values HHADALL3 HHADALL3 ;
 label values FMEDREAS13 FMEDREAS13 ;
 label values FMEDREAS14 FMEDREAS14 ;
 label values FMEDREAS15 FMEDREAS15 ;
 label values FMEDREAS16 FMEDREAS16 ;
 label values FMEDREAS17 FMEDREAS17 ;
 label values BCREAS3 BCREAS3 ;
 label values BCWHYF3 BCWHYF3 ;
 label values MINCDNNR3 MINCDNNR3 ;
 label values DATFEMOP_Y4 DATFEMOP_Y4 ;
 label values PLCFEMOP4 PLCFEMOP4 ;
 label values PAYRSTER16 PAYRSTER16 ;
 label values PAYRSTER17 PAYRSTER17 ;
 label values PAYRSTER18 PAYRSTER18 ;
 label values RHADALL4 RHADALL4 ;
 label values HHADALL4 HHADALL4 ;
 label values FMEDREAS19 FMEDREAS19 ;
 label values FMEDREAS20 FMEDREAS20 ;
 label values FMEDREAS21 FMEDREAS21 ;
 label values FMEDREAS22 FMEDREAS22 ;
 label values FMEDREAS23 FMEDREAS23 ;
 label values BCREAS4 BCREAS4 ;
 label values BCWHYF4 BCWHYF4 ;
 label values MINCDNNR4 MINCDNNR4 ;
 label values OPERSAME1 OPERSAME1 ;
 label values OPERSAME2 OPERSAME2 ;
 label values OPERSAME3 OPERSAME3 ;
 label values OPERSAME4 OPERSAME4 ;
 label values OPERSAME5 OPERSAME5 ;
 label values OPERSAME6 OPERSAME6 ;
 label values DATEOPMN_Y DATEOPMN_Y ;
 label values withimop withimop ;
 label values VASJAN4YR VASJAN4YR ;
 label values placopmn placopmn ;
 label values PAYMSTER1 PAYMSTER1 ;
 label values PAYMSTER2 PAYMSTER2 ;
 label values rhadallm rhadallm ;
 label values hhadallm hhadallm ;
 label values MEDREAS1 MEDREAS1 ;
 label values MEDREAS2 MEDREAS2 ;
 label values bcreasm bcreasm ;
 label values bcwhym bcwhym ;
 label values mincdnmn mincdnmn ;
 label values revstubl revstubl ;
 label values DATRVSTB_Y DATRVSTB_Y ;
 label values revsvasx revsvasx ;
 label values DATRVVEX_Y DATRVVEX_Y ;
 label values tubs tubs ;
 label values vasect vasect ;
 label values rsurgstr rsurgstr ;
 label values psurgstr psurgstr ;
 label values onlytbvs onlytbvs ;
 label values rwantrvt rwantrvt ;
 label values manwantt manwantt ;
 label values rwantrev rwantrev ;
 label values manwantr manwantr ;
 label values posiblpg posiblpg ;
 label values reasimpr reasimpr ;
 label values posiblmn posiblmn ;
 label values reasimpp reasimpp ;
 label values canhaver canhaver ;
 label values REASDIFF1 REASDIFF1 ;
 label values REASDIFF2 REASDIFF2 ;
 label values REASDIFF3 REASDIFF3 ;
 label values REASDIFF4 REASDIFF4 ;
 label values REASDIFF5 REASDIFF5 ;
 label values canhavem canhavem ;
 label values pregnono pregnono ;
 label values REASNONO1 REASNONO1 ;
 label values REASNONO2 REASNONO2 ;
 label values REASNONO3 REASNONO3 ;
 label values rstrstat rstrstat ;
 label values pstrstat pstrstat ;
 label values lastper lastper ;
 label values TRYPREG12 TRYPREG12 ;
 label values pill pill ;
 label values condom condom ;
 label values vasectmy vasectmy ;
 label values depoprov depoprov ;
 label values widrawal widrawal ;
 label values rhythm rhythm ;
 label values sdaycbds sdaycbds ;
 label values tempsafe tempsafe ;
 label values patch patch ;
 label values ring ring ;
 label values mornpill mornpill ;
 label values ectimesx ectimesx ;
 label values ECREASON1 ECREASON1 ;
 label values ECREASON2 ECREASON2 ;
 label values ECREASON3 ECREASON3 ;
 label values ecrx ecrx ;
 label values ecwhere ecwhere ;
 label values ecwhen ecwhen ;
 label values OTHRMETH01 OTHRMETH01 ;
 label values OTHRMETH02 OTHRMETH02 ;
 label values OTHRMETH03 OTHRMETH03 ;
 label values OTHRMETH04 OTHRMETH04 ;
 label values OTHRMETH05 OTHRMETH05 ;
 label values OTHRMETH06 OTHRMETH06 ;
 label values OTHRMETH07 OTHRMETH07 ;
 label values EVIUDTYP1 EVIUDTYP1 ;
 label values EVIUDTYP2 EVIUDTYP2 ;
 label values EVIUDTYP3 EVIUDTYP3 ;
 label values newmeth newmeth ;
 label values everused everused ;
 label values methdiss methdiss ;
 label values METHSTOP01 METHSTOP01 ;
 label values METHSTOP02 METHSTOP02 ;
 label values METHSTOP03 METHSTOP03 ;
 label values METHSTOP04 METHSTOP04 ;
 label values METHSTOP05 METHSTOP05 ;
 label values METHSTOP06 METHSTOP06 ;
 label values METHSTOP07 METHSTOP07 ;
 label values METHSTOP08 METHSTOP08 ;
 label values METHSTOP09 METHSTOP09 ;
 label values METHSTOP10 METHSTOP10 ;
 label values whenpill whenpill ;
 label values REASPILL01 REASPILL01 ;
 label values REASPILL02 REASPILL02 ;
 label values REASPILL03 REASPILL03 ;
 label values REASPILL04 REASPILL04 ;
 label values REASPILL05 REASPILL05 ;
 label values REASPILL06 REASPILL06 ;
 label values REASPILL07 REASPILL07 ;
 label values REASPILL08 REASPILL08 ;
 label values REASPILL09 REASPILL09 ;
 label values STOPPILL1 STOPPILL1 ;
 label values STOPPILL2 STOPPILL2 ;
 label values STOPPILL3 STOPPILL3 ;
 label values STOPPILL4 STOPPILL4 ;
 label values STOPPILL5 STOPPILL5 ;
 label values STOPPILL6 STOPPILL6 ;
 label values whencond whencond ;
 label values REASCOND01 REASCOND01 ;
 label values REASCOND02 REASCOND02 ;
 label values REASCOND03 REASCOND03 ;
 label values REASCOND04 REASCOND04 ;
 label values REASCOND05 REASCOND05 ;
 label values REASCOND06 REASCOND06 ;
 label values REASCOND07 REASCOND07 ;
 label values STOPCOND1 STOPCOND1 ;
 label values STOPCOND2 STOPCOND2 ;
 label values wheniud wheniud ;
 label values TYPEIUD_1 TYPEIUD_1 ;
 label values TYPEIUD_2 TYPEIUD_2 ;
 label values TYPEIUD_3 TYPEIUD_3 ;
 label values REASIUD01 REASIUD01 ;
 label values REASIUD02 REASIUD02 ;
 label values REASIUD03 REASIUD03 ;
 label values REASIUD04 REASIUD04 ;
 label values REASIUD05 REASIUD05 ;
 label values REASIUD06 REASIUD06 ;
 label values REASIUD07 REASIUD07 ;
 label values REASIUD08 REASIUD08 ;
 label values STOPIUD1 STOPIUD1 ;
 label values STOPIUD2 STOPIUD2 ;
 label values STOPIUD3 STOPIUD3 ;
 label values STOPIUD4 STOPIUD4 ;
 label values STOPIUD5 STOPIUD5 ;
 label values LARC10 LARC10 ;
 label values larcremv larcremv ;
 label values REMOVWHY_1 REMOVWHY_1 ;
 label values REMOVWHY_2 REMOVWHY_2 ;
 label values REMOVWHY_3 REMOVWHY_3 ;
 label values REMOVWHY_4 REMOVWHY_4 ;
 label values REMOVWHY_5 REMOVWHY_5 ;
 label values removdif removdif ;
 label values REMVDIFY_1 REMVDIFY_1 ;
 label values REMVDIFY_2 REMVDIFY_2 ;
 label values REMVDIFY_3 REMVDIFY_3 ;
 label values FIRSMETH1 FIRSMETH1 ;
 label values FIRSMETH2 FIRSMETH2 ;
 label values FIRSMETH3 FIRSMETH3 ;
 label values FIRSMETH4 FIRSMETH4 ;
 label values numfirsm numfirsm ;
 label values drugdev drugdev ;
 label values DRUGDEV2 DRUGDEV2 ;
 label values DRUGDEV3 DRUGDEV3 ;
 label values DRUGDEV4 DRUGDEV4 ;
 label values FIRSTIME1 FIRSTIME1 ;
 label values FIRSTIME2 FIRSTIME2 ;
 label values usefstsx usefstsx ;
 label values cmfirsm cmfirsm ;
 label values MTHFSTSX1 MTHFSTSX1 ;
 label values MTHFSTSX2 MTHFSTSX2 ;
 label values MTHFSTSX3 MTHFSTSX3 ;
 label values MTHFSTSX4 MTHFSTSX4 ;
 label values WNFSTUSE_M WNFSTUSE_M ;
 label values WNFSTUSE_Y WNFSTUSE_Y ;
 label values cmfstuse cmfstuse ;
 label values fmethprs fmethprs ;
 label values FMETHPRS2 FMETHPRS2 ;
 label values FMETHPRS3 FMETHPRS3 ;
 label values FMETHPRS4 FMETHPRS4 ;
 label values agefstus agefstus ;
 label values placgotf placgotf ;
 label values PLACGOTF2 PLACGOTF2 ;
 label values PLACGOTF3 PLACGOTF3 ;
 label values PLACGOTF4 PLACGOTF4 ;
 label values usefrsts usefrsts ;
 label values MTHFRSTS1 MTHFRSTS1 ;
 label values MTHFRSTS2 MTHFRSTS2 ;
 label values MTHFRSTS3 MTHFRSTS3 ;
 label values MTHFRSTS4 MTHFRSTS4 ;
 label values INTR_EC3 INTR_EC3 ;
 label values monsx monsx ;
 label values MONSX2 MONSX2 ;
 label values MONSX3 MONSX3 ;
 label values MONSX4 MONSX4 ;
 label values MONSX5 MONSX5 ;
 label values MONSX6 MONSX6 ;
 label values MONSX7 MONSX7 ;
 label values MONSX8 MONSX8 ;
 label values MONSX9 MONSX9 ;
 label values MONSX10 MONSX10 ;
 label values MONSX11 MONSX11 ;
 label values MONSX12 MONSX12 ;
 label values MONSX13 MONSX13 ;
 label values MONSX14 MONSX14 ;
 label values MONSX15 MONSX15 ;
 label values MONSX16 MONSX16 ;
 label values MONSX17 MONSX17 ;
 label values MONSX18 MONSX18 ;
 label values MONSX19 MONSX19 ;
 label values MONSX20 MONSX20 ;
 label values MONSX21 MONSX21 ;
 label values MONSX22 MONSX22 ;
 label values MONSX23 MONSX23 ;
 label values MONSX24 MONSX24 ;
 label values MONSX25 MONSX25 ;
 label values MONSX26 MONSX26 ;
 label values MONSX27 MONSX27 ;
 label values MONSX28 MONSX28 ;
 label values MONSX29 MONSX29 ;
 label values MONSX30 MONSX30 ;
 label values MONSX31 MONSX31 ;
 label values MONSX32 MONSX32 ;
 label values MONSX33 MONSX33 ;
 label values MONSX34 MONSX34 ;
 label values MONSX35 MONSX35 ;
 label values MONSX36 MONSX36 ;
 label values MONSX37 MONSX37 ;
 label values MONSX38 MONSX38 ;
 label values MONSX39 MONSX39 ;
 label values MONSX40 MONSX40 ;
 label values MONSX41 MONSX41 ;
 label values MONSX42 MONSX42 ;
 label values MONSX43 MONSX43 ;
 label values MONSX44 MONSX44 ;
 label values MONSX45 MONSX45 ;
 label values MONSX46 MONSX46 ;
 label values MONSX47 MONSX47 ;
 label values MONSX48 MONSX48 ;
 label values cmstrtmc cmstrtmc ;
 label values cmendmc cmendmc ;
 label values INTR_ED4A INTR_ED4A ;
 label values MC1MONS1 MC1MONS1 ;
 label values MC1SIMSQ MC1SIMSQ ;
 label values MC1MONS2 MC1MONS2 ;
 label values MC1MONS3 MC1MONS3 ;
 label values DATBEGIN_M DATBEGIN_M ;
 label values DATBEGIN_Y DATBEGIN_Y ;
 label values cmdatbegin cmdatbegin ;
 label values CURRMETH1 CURRMETH1 ;
 label values CURRMETH2 CURRMETH2 ;
 label values CURRMETH3 CURRMETH3 ;
 label values CURRMETH4 CURRMETH4 ;
 label values LSTMONMETH1 LSTMONMETH1 ;
 label values LSTMONMETH2 LSTMONMETH2 ;
 label values LSTMONMETH3 LSTMONMETH3 ;
 label values LSTMONMETH4 LSTMONMETH4 ;
 label values PILL_12 PILL_12 ;
 label values DIAPH_12 DIAPH_12 ;
 label values IUD_12 IUD_12 ;
 label values IMPLANT_12 IMPLANT_12 ;
 label values DEPO_12 DEPO_12 ;
 label values CERVC_12 CERVC_12 ;
 label values MPILL_12 MPILL_12 ;
 label values PATCH_12 PATCH_12 ;
 label values RING_12 RING_12 ;
 label values METHX1 METHX1 ;
 label values METHX2 METHX2 ;
 label values METHX3 METHX3 ;
 label values METHX4 METHX4 ;
 label values METHX5 METHX5 ;
 label values METHX6 METHX6 ;
 label values METHX7 METHX7 ;
 label values METHX8 METHX8 ;
 label values METHX9 METHX9 ;
 label values METHX10 METHX10 ;
 label values METHX11 METHX11 ;
 label values METHX12 METHX12 ;
 label values METHX13 METHX13 ;
 label values METHX14 METHX14 ;
 label values METHX15 METHX15 ;
 label values METHX16 METHX16 ;
 label values METHX17 METHX17 ;
 label values METHX18 METHX18 ;
 label values METHX19 METHX19 ;
 label values METHX20 METHX20 ;
 label values METHX21 METHX21 ;
 label values METHX22 METHX22 ;
 label values METHX23 METHX23 ;
 label values METHX24 METHX24 ;
 label values METHX25 METHX25 ;
 label values METHX26 METHX26 ;
 label values METHX27 METHX27 ;
 label values METHX28 METHX28 ;
 label values METHX29 METHX29 ;
 label values METHX30 METHX30 ;
 label values METHX31 METHX31 ;
 label values METHX32 METHX32 ;
 label values METHX33 METHX33 ;
 label values METHX34 METHX34 ;
 label values METHX35 METHX35 ;
 label values METHX36 METHX36 ;
 label values METHX37 METHX37 ;
 label values METHX38 METHX38 ;
 label values METHX39 METHX39 ;
 label values METHX40 METHX40 ;
 label values METHX41 METHX41 ;
 label values METHX42 METHX42 ;
 label values METHX43 METHX43 ;
 label values METHX44 METHX44 ;
 label values METHX45 METHX45 ;
 label values METHX46 METHX46 ;
 label values METHX47 METHX47 ;
 label values METHX48 METHX48 ;
 label values METHX49 METHX49 ;
 label values METHX50 METHX50 ;
 label values METHX51 METHX51 ;
 label values METHX52 METHX52 ;
 label values METHX53 METHX53 ;
 label values METHX54 METHX54 ;
 label values METHX55 METHX55 ;
 label values METHX56 METHX56 ;
 label values METHX57 METHX57 ;
 label values METHX58 METHX58 ;
 label values METHX59 METHX59 ;
 label values METHX60 METHX60 ;
 label values METHX61 METHX61 ;
 label values METHX62 METHX62 ;
 label values METHX63 METHX63 ;
 label values METHX64 METHX64 ;
 label values METHX65 METHX65 ;
 label values METHX66 METHX66 ;
 label values METHX67 METHX67 ;
 label values METHX68 METHX68 ;
 label values METHX69 METHX69 ;
 label values METHX70 METHX70 ;
 label values METHX71 METHX71 ;
 label values METHX72 METHX72 ;
 label values METHX73 METHX73 ;
 label values METHX74 METHX74 ;
 label values METHX75 METHX75 ;
 label values METHX76 METHX76 ;
 label values METHX77 METHX77 ;
 label values METHX78 METHX78 ;
 label values METHX79 METHX79 ;
 label values METHX80 METHX80 ;
 label values METHX81 METHX81 ;
 label values METHX82 METHX82 ;
 label values METHX83 METHX83 ;
 label values METHX84 METHX84 ;
 label values METHX85 METHX85 ;
 label values METHX86 METHX86 ;
 label values METHX87 METHX87 ;
 label values METHX88 METHX88 ;
 label values METHX89 METHX89 ;
 label values METHX90 METHX90 ;
 label values METHX91 METHX91 ;
 label values METHX92 METHX92 ;
 label values METHX93 METHX93 ;
 label values METHX94 METHX94 ;
 label values METHX95 METHX95 ;
 label values METHX96 METHX96 ;
 label values METHX97 METHX97 ;
 label values METHX98 METHX98 ;
 label values METHX99 METHX99 ;
 label values METHX100 METHX100 ;
 label values METHX101 METHX101 ;
 label values METHX102 METHX102 ;
 label values METHX103 METHX103 ;
 label values METHX104 METHX104 ;
 label values METHX105 METHX105 ;
 label values METHX106 METHX106 ;
 label values METHX107 METHX107 ;
 label values METHX108 METHX108 ;
 label values METHX109 METHX109 ;
 label values METHX110 METHX110 ;
 label values METHX111 METHX111 ;
 label values METHX112 METHX112 ;
 label values METHX113 METHX113 ;
 label values METHX114 METHX114 ;
 label values METHX115 METHX115 ;
 label values METHX116 METHX116 ;
 label values METHX117 METHX117 ;
 label values METHX118 METHX118 ;
 label values METHX119 METHX119 ;
 label values METHX120 METHX120 ;
 label values METHX121 METHX121 ;
 label values METHX122 METHX122 ;
 label values METHX123 METHX123 ;
 label values METHX124 METHX124 ;
 label values METHX125 METHX125 ;
 label values METHX126 METHX126 ;
 label values METHX127 METHX127 ;
 label values METHX128 METHX128 ;
 label values METHX129 METHX129 ;
 label values METHX130 METHX130 ;
 label values METHX131 METHX131 ;
 label values METHX132 METHX132 ;
 label values METHX133 METHX133 ;
 label values METHX134 METHX134 ;
 label values METHX135 METHX135 ;
 label values METHX136 METHX136 ;
 label values METHX137 METHX137 ;
 label values METHX138 METHX138 ;
 label values METHX139 METHX139 ;
 label values METHX140 METHX140 ;
 label values METHX141 METHX141 ;
 label values METHX142 METHX142 ;
 label values METHX143 METHX143 ;
 label values METHX144 METHX144 ;
 label values METHX145 METHX145 ;
 label values METHX146 METHX146 ;
 label values METHX147 METHX147 ;
 label values METHX148 METHX148 ;
 label values METHX149 METHX149 ;
 label values METHX150 METHX150 ;
 label values METHX151 METHX151 ;
 label values METHX152 METHX152 ;
 label values METHX153 METHX153 ;
 label values METHX154 METHX154 ;
 label values METHX155 METHX155 ;
 label values METHX156 METHX156 ;
 label values METHX157 METHX157 ;
 label values METHX158 METHX158 ;
 label values METHX159 METHX159 ;
 label values METHX160 METHX160 ;
 label values METHX161 METHX161 ;
 label values METHX162 METHX162 ;
 label values METHX163 METHX163 ;
 label values METHX164 METHX164 ;
 label values METHX165 METHX165 ;
 label values METHX166 METHX166 ;
 label values METHX167 METHX167 ;
 label values METHX168 METHX168 ;
 label values METHX169 METHX169 ;
 label values METHX170 METHX170 ;
 label values METHX171 METHX171 ;
 label values METHX172 METHX172 ;
 label values METHX173 METHX173 ;
 label values METHX174 METHX174 ;
 label values METHX175 METHX175 ;
 label values METHX176 METHX176 ;
 label values METHX177 METHX177 ;
 label values METHX178 METHX178 ;
 label values METHX179 METHX179 ;
 label values METHX180 METHX180 ;
 label values METHX181 METHX181 ;
 label values METHX182 METHX182 ;
 label values METHX183 METHX183 ;
 label values METHX184 METHX184 ;
 label values METHX185 METHX185 ;
 label values METHX186 METHX186 ;
 label values METHX187 METHX187 ;
 label values METHX188 METHX188 ;
 label values METHX189 METHX189 ;
 label values METHX190 METHX190 ;
 label values METHX191 METHX191 ;
 label values METHX192 METHX192 ;
 label values NUMMULTX1 NUMMULTX1 ;
 label values NUMMULTX2 NUMMULTX2 ;
 label values NUMMULTX3 NUMMULTX3 ;
 label values NUMMULTX4 NUMMULTX4 ;
 label values NUMMULTX5 NUMMULTX5 ;
 label values NUMMULTX6 NUMMULTX6 ;
 label values NUMMULTX7 NUMMULTX7 ;
 label values NUMMULTX8 NUMMULTX8 ;
 label values NUMMULTX9 NUMMULTX9 ;
 label values NUMMULTX10 NUMMULTX10 ;
 label values NUMMULTX11 NUMMULTX11 ;
 label values NUMMULTX12 NUMMULTX12 ;
 label values NUMMULTX13 NUMMULTX13 ;
 label values NUMMULTX14 NUMMULTX14 ;
 label values NUMMULTX15 NUMMULTX15 ;
 label values NUMMULTX16 NUMMULTX16 ;
 label values NUMMULTX17 NUMMULTX17 ;
 label values NUMMULTX18 NUMMULTX18 ;
 label values NUMMULTX19 NUMMULTX19 ;
 label values NUMMULTX20 NUMMULTX20 ;
 label values NUMMULTX21 NUMMULTX21 ;
 label values NUMMULTX22 NUMMULTX22 ;
 label values NUMMULTX23 NUMMULTX23 ;
 label values NUMMULTX24 NUMMULTX24 ;
 label values NUMMULTX25 NUMMULTX25 ;
 label values NUMMULTX26 NUMMULTX26 ;
 label values NUMMULTX27 NUMMULTX27 ;
 label values NUMMULTX28 NUMMULTX28 ;
 label values NUMMULTX29 NUMMULTX29 ;
 label values NUMMULTX30 NUMMULTX30 ;
 label values NUMMULTX31 NUMMULTX31 ;
 label values NUMMULTX32 NUMMULTX32 ;
 label values NUMMULTX33 NUMMULTX33 ;
 label values NUMMULTX34 NUMMULTX34 ;
 label values NUMMULTX35 NUMMULTX35 ;
 label values NUMMULTX36 NUMMULTX36 ;
 label values NUMMULTX37 NUMMULTX37 ;
 label values NUMMULTX38 NUMMULTX38 ;
 label values NUMMULTX39 NUMMULTX39 ;
 label values NUMMULTX40 NUMMULTX40 ;
 label values NUMMULTX41 NUMMULTX41 ;
 label values NUMMULTX42 NUMMULTX42 ;
 label values NUMMULTX43 NUMMULTX43 ;
 label values NUMMULTX44 NUMMULTX44 ;
 label values NUMMULTX45 NUMMULTX45 ;
 label values NUMMULTX46 NUMMULTX46 ;
 label values NUMMULTX47 NUMMULTX47 ;
 label values NUMMULTX48 NUMMULTX48 ;
 label values SALMX1 SALMX1 ;
 label values SALMX2 SALMX2 ;
 label values SALMX3 SALMX3 ;
 label values SALMX4 SALMX4 ;
 label values SALMX5 SALMX5 ;
 label values SALMX6 SALMX6 ;
 label values SALMX7 SALMX7 ;
 label values SALMX8 SALMX8 ;
 label values SALMX9 SALMX9 ;
 label values SALMX10 SALMX10 ;
 label values SALMX11 SALMX11 ;
 label values SALMX12 SALMX12 ;
 label values SALMX13 SALMX13 ;
 label values SALMX14 SALMX14 ;
 label values SALMX15 SALMX15 ;
 label values SALMX16 SALMX16 ;
 label values SALMX17 SALMX17 ;
 label values SALMX18 SALMX18 ;
 label values SALMX19 SALMX19 ;
 label values SALMX20 SALMX20 ;
 label values SALMX21 SALMX21 ;
 label values SALMX22 SALMX22 ;
 label values SALMX23 SALMX23 ;
 label values SALMX24 SALMX24 ;
 label values SALMX25 SALMX25 ;
 label values SALMX26 SALMX26 ;
 label values SALMX27 SALMX27 ;
 label values SALMX28 SALMX28 ;
 label values SALMX29 SALMX29 ;
 label values SALMX30 SALMX30 ;
 label values SALMX31 SALMX31 ;
 label values SALMX32 SALMX32 ;
 label values SALMX33 SALMX33 ;
 label values SALMX34 SALMX34 ;
 label values SALMX35 SALMX35 ;
 label values SALMX36 SALMX36 ;
 label values SALMX37 SALMX37 ;
 label values SALMX38 SALMX38 ;
 label values SALMX39 SALMX39 ;
 label values SALMX40 SALMX40 ;
 label values SALMX41 SALMX41 ;
 label values SALMX42 SALMX42 ;
 label values SALMX43 SALMX43 ;
 label values SALMX44 SALMX44 ;
 label values SALMX45 SALMX45 ;
 label values SALMX46 SALMX46 ;
 label values SALMX47 SALMX47 ;
 label values SALMX48 SALMX48 ;
 label values SAYX1 SAYX1 ;
 label values SAYX2 SAYX2 ;
 label values SAYX3 SAYX3 ;
 label values SAYX4 SAYX4 ;
 label values SAYX5 SAYX5 ;
 label values SAYX6 SAYX6 ;
 label values SAYX7 SAYX7 ;
 label values SAYX8 SAYX8 ;
 label values SAYX9 SAYX9 ;
 label values SAYX10 SAYX10 ;
 label values SAYX11 SAYX11 ;
 label values SAYX12 SAYX12 ;
 label values SAYX13 SAYX13 ;
 label values SAYX14 SAYX14 ;
 label values SAYX15 SAYX15 ;
 label values SAYX16 SAYX16 ;
 label values SAYX17 SAYX17 ;
 label values SAYX18 SAYX18 ;
 label values SAYX19 SAYX19 ;
 label values SAYX20 SAYX20 ;
 label values SAYX21 SAYX21 ;
 label values SAYX22 SAYX22 ;
 label values SAYX23 SAYX23 ;
 label values SAYX24 SAYX24 ;
 label values SAYX25 SAYX25 ;
 label values SAYX26 SAYX26 ;
 label values SAYX27 SAYX27 ;
 label values SAYX28 SAYX28 ;
 label values SAYX29 SAYX29 ;
 label values SAYX30 SAYX30 ;
 label values SAYX31 SAYX31 ;
 label values SAYX32 SAYX32 ;
 label values SAYX33 SAYX33 ;
 label values SAYX34 SAYX34 ;
 label values SAYX35 SAYX35 ;
 label values SAYX36 SAYX36 ;
 label values SAYX37 SAYX37 ;
 label values SAYX38 SAYX38 ;
 label values SAYX39 SAYX39 ;
 label values SAYX40 SAYX40 ;
 label values SAYX41 SAYX41 ;
 label values SAYX42 SAYX42 ;
 label values SAYX43 SAYX43 ;
 label values SAYX44 SAYX44 ;
 label values SAYX45 SAYX45 ;
 label values SAYX46 SAYX46 ;
 label values SAYX47 SAYX47 ;
 label values SAYX48 SAYX48 ;
 label values SIMSEQX1 SIMSEQX1 ;
 label values SIMSEQX2 SIMSEQX2 ;
 label values SIMSEQX3 SIMSEQX3 ;
 label values SIMSEQX4 SIMSEQX4 ;
 label values SIMSEQX5 SIMSEQX5 ;
 label values SIMSEQX6 SIMSEQX6 ;
 label values SIMSEQX7 SIMSEQX7 ;
 label values SIMSEQX8 SIMSEQX8 ;
 label values SIMSEQX9 SIMSEQX9 ;
 label values SIMSEQX10 SIMSEQX10 ;
 label values SIMSEQX11 SIMSEQX11 ;
 label values SIMSEQX12 SIMSEQX12 ;
 label values SIMSEQX13 SIMSEQX13 ;
 label values SIMSEQX14 SIMSEQX14 ;
 label values SIMSEQX15 SIMSEQX15 ;
 label values SIMSEQX16 SIMSEQX16 ;
 label values SIMSEQX17 SIMSEQX17 ;
 label values SIMSEQX18 SIMSEQX18 ;
 label values SIMSEQX19 SIMSEQX19 ;
 label values SIMSEQX20 SIMSEQX20 ;
 label values SIMSEQX21 SIMSEQX21 ;
 label values SIMSEQX22 SIMSEQX22 ;
 label values SIMSEQX23 SIMSEQX23 ;
 label values SIMSEQX24 SIMSEQX24 ;
 label values SIMSEQX25 SIMSEQX25 ;
 label values SIMSEQX26 SIMSEQX26 ;
 label values SIMSEQX27 SIMSEQX27 ;
 label values SIMSEQX28 SIMSEQX28 ;
 label values SIMSEQX29 SIMSEQX29 ;
 label values SIMSEQX30 SIMSEQX30 ;
 label values SIMSEQX31 SIMSEQX31 ;
 label values SIMSEQX32 SIMSEQX32 ;
 label values SIMSEQX33 SIMSEQX33 ;
 label values SIMSEQX34 SIMSEQX34 ;
 label values SIMSEQX35 SIMSEQX35 ;
 label values SIMSEQX36 SIMSEQX36 ;
 label values SIMSEQX37 SIMSEQX37 ;
 label values SIMSEQX38 SIMSEQX38 ;
 label values SIMSEQX39 SIMSEQX39 ;
 label values SIMSEQX40 SIMSEQX40 ;
 label values SIMSEQX41 SIMSEQX41 ;
 label values SIMSEQX42 SIMSEQX42 ;
 label values SIMSEQX43 SIMSEQX43 ;
 label values SIMSEQX44 SIMSEQX44 ;
 label values SIMSEQX45 SIMSEQX45 ;
 label values SIMSEQX46 SIMSEQX46 ;
 label values SIMSEQX47 SIMSEQX47 ;
 label values SIMSEQX48 SIMSEQX48 ;
 label values uselstp uselstp ;
 label values wynolstp wynolstp ;
 label values hplstp hplstp ;
 label values LSTMTHP1 LSTMTHP1 ;
 label values LSTMTHP2 LSTMTHP2 ;
 label values LSTMTHP3 LSTMTHP3 ;
 label values LSTMTHP4 LSTMTHP4 ;
 label values lpiudtyp lpiudtyp ;
 label values usefstp usefstp ;
 label values FSTMTHP1 FSTMTHP1 ;
 label values FSTMTHP2 FSTMTHP2 ;
 label values FSTMTHP3 FSTMTHP3 ;
 label values FSTMTHP4 FSTMTHP4 ;
 label values USELSTP2 USELSTP2 ;
 label values WYNOLSTP2 WYNOLSTP2 ;
 label values HPLSTP2 HPLSTP2 ;
 label values LSTMTHP5 LSTMTHP5 ;
 label values LSTMTHP6 LSTMTHP6 ;
 label values LSTMTHP7 LSTMTHP7 ;
 label values LSTMTHP8 LSTMTHP8 ;
 label values LPIUDTYP2 LPIUDTYP2 ;
 label values USEFSTP2 USEFSTP2 ;
 label values FSTMTHP5 FSTMTHP5 ;
 label values FSTMTHP6 FSTMTHP6 ;
 label values FSTMTHP7 FSTMTHP7 ;
 label values FSTMTHP8 FSTMTHP8 ;
 label values USELSTP3 USELSTP3 ;
 label values WYNOLSTP3 WYNOLSTP3 ;
 label values HPLSTP3 HPLSTP3 ;
 label values LSTMTHP9 LSTMTHP9 ;
 label values LSTMTHP10 LSTMTHP10 ;
 label values LSTMTHP11 LSTMTHP11 ;
 label values LSTMTHP12 LSTMTHP12 ;
 label values LPIUDTYP3 LPIUDTYP3 ;
 label values USEFSTP3 USEFSTP3 ;
 label values FSTMTHP9 FSTMTHP9 ;
 label values FSTMTHP10 FSTMTHP10 ;
 label values FSTMTHP11 FSTMTHP11 ;
 label values FSTMTHP12 FSTMTHP12 ;
 label values wynotuse wynotuse ;
 label values hppregq hppregq ;
 label values DURTRY_N DURTRY_N ;
 label values DURTRY_P DURTRY_P ;
 label values WHYNOUSING1 WHYNOUSING1 ;
 label values WHYNOUSING2 WHYNOUSING2 ;
 label values WHYNOUSING3 WHYNOUSING3 ;
 label values WHYNOUSING4 WHYNOUSING4 ;
 label values WHYNOUSING5 WHYNOUSING5 ;
 label values WHYNOTPG1 WHYNOTPG1 ;
 label values WHYNOTPG2 WHYNOTPG2 ;
 label values mainnouse mainnouse ;
 label values YUSEPILL1 YUSEPILL1 ;
 label values YUSEPILL2 YUSEPILL2 ;
 label values YUSEPILL3 YUSEPILL3 ;
 label values YUSEPILL4 YUSEPILL4 ;
 label values YUSEPILL5 YUSEPILL5 ;
 label values YUSEPILL6 YUSEPILL6 ;
 label values YUSEPILL7 YUSEPILL7 ;
 label values iudtype iudtype ;
 label values YUSEIUD1 YUSEIUD1 ;
 label values YUSEIUD2 YUSEIUD2 ;
 label values YUSEIUD3 YUSEIUD3 ;
 label values YUSEIUD4 YUSEIUD4 ;
 label values YUSEIUD5 YUSEIUD5 ;
 label values YUSEIUD6 YUSEIUD6 ;
 label values ekmethod ekmethod ;
 label values curbcplc curbcplc ;
 label values numpills numpills ;
 label values CURBCPAY1 CURBCPAY1 ;
 label values CURBCPAY2 CURBCPAY2 ;
 label values CURBCPAY3 CURBCPAY3 ;
 label values curbcins curbcins ;
 label values NOUSEINS1 NOUSEINS1 ;
 label values NOUSEINS2 NOUSEINS2 ;
 label values NOUSEINS3 NOUSEINS3 ;
 label values curbcamt curbcamt ;
 label values NOCOST1 NOCOST1 ;
 label values NOCOST2 NOCOST2 ;
 label values PST4WKSX PST4WKSX ;
 label values PSWKCOND1 PSWKCOND1 ;
 label values PSWKCOND2 PSWKCOND2 ;
 label values COND1BRK COND1BRK ;
 label values COND1OFF COND1OFF ;
 label values condbrfl condbrfl ;
 label values condoff condoff ;
 label values misspill misspill ;
 label values P12MOCON P12MOCON ;
 label values pxnofreq pxnofreq ;
 label values BTHCON12 BTHCON12 ;
 label values MEDTST12 MEDTST12 ;
 label values BCCNS12 BCCNS12 ;
 label values STEROP12 STEROP12 ;
 label values STCNS12 STCNS12 ;
 label values EMCON12 EMCON12 ;
 label values ECCNS12 ECCNS12 ;
 label values NUMMTH12 NUMMTH12 ;
 label values PRGTST12 PRGTST12 ;
 label values ABORT12 ABORT12 ;
 label values PAP12 PAP12 ;
 label values PELVIC12 PELVIC12 ;
 label values PRENAT12 PRENAT12 ;
 label values PARTUM12 PARTUM12 ;
 label values STDSVC12 STDSVC12 ;
 label values BARRIER1 BARRIER1 ;
 label values BARRIER2 BARRIER2 ;
 label values BARRIER3 BARRIER3 ;
 label values BARRIER4 BARRIER4 ;
 label values BARRIER5 BARRIER5 ;
 label values BARRIER6 BARRIER6 ;
 label values NUMSVC12 NUMSVC12 ;
 label values numbcvis numbcvis ;
 label values BC12PLCX BC12PLCX ;
 label values BC12PLCX2 BC12PLCX2 ;
 label values BC12PLCX3 BC12PLCX3 ;
 label values BC12PLCX4 BC12PLCX4 ;
 label values BC12PLCX5 BC12PLCX5 ;
 label values BC12PLCX6 BC12PLCX6 ;
 label values BC12PLCX7 BC12PLCX7 ;
 label values BC12PLCX8 BC12PLCX8 ;
 label values BC12PLCX9 BC12PLCX9 ;
 label values BC12PLCX10 BC12PLCX10 ;
 label values BC12PLCX11 BC12PLCX11 ;
 label values BC12PLCX12 BC12PLCX12 ;
 label values BC12PLCX13 BC12PLCX13 ;
 label values BC12PLCX14 BC12PLCX14 ;
 label values BC12PLCX15 BC12PLCX15 ;
 label values idclinic idclinic ;
 label values TALKPROV_1 TALKPROV_1 ;
 label values TALKPROV_2 TALKPROV_2 ;
 label values TALKPROV_3 TALKPROV_3 ;
 label values whypstd whypstd ;
 label values whynostd whynostd ;
 label values bcclarc bcclarc ;
 label values BC12PAYX1 BC12PAYX1 ;
 label values BC12PAYX2 BC12PAYX2 ;
 label values BC12PAYX3 BC12PAYX3 ;
 label values BC12PAYX4 BC12PAYX4 ;
 label values BC12PAYX7 BC12PAYX7 ;
 label values BC12PAYX8 BC12PAYX8 ;
 label values BC12PAYX9 BC12PAYX9 ;
 label values BC12PAYX10 BC12PAYX10 ;
 label values BC12PAYX13 BC12PAYX13 ;
 label values BC12PAYX14 BC12PAYX14 ;
 label values BC12PAYX15 BC12PAYX15 ;
 label values BC12PAYX16 BC12PAYX16 ;
 label values BC12PAYX19 BC12PAYX19 ;
 label values BC12PAYX20 BC12PAYX20 ;
 label values BC12PAYX21 BC12PAYX21 ;
 label values BC12PAYX22 BC12PAYX22 ;
 label values BC12PAYX25 BC12PAYX25 ;
 label values BC12PAYX26 BC12PAYX26 ;
 label values BC12PAYX27 BC12PAYX27 ;
 label values BC12PAYX28 BC12PAYX28 ;
 label values BC12PAYX31 BC12PAYX31 ;
 label values BC12PAYX32 BC12PAYX32 ;
 label values BC12PAYX33 BC12PAYX33 ;
 label values BC12PAYX34 BC12PAYX34 ;
 label values BC12PAYX37 BC12PAYX37 ;
 label values BC12PAYX38 BC12PAYX38 ;
 label values BC12PAYX39 BC12PAYX39 ;
 label values BC12PAYX40 BC12PAYX40 ;
 label values BC12PAYX43 BC12PAYX43 ;
 label values BC12PAYX44 BC12PAYX44 ;
 label values BC12PAYX45 BC12PAYX45 ;
 label values BC12PAYX46 BC12PAYX46 ;
 label values BC12PAYX49 BC12PAYX49 ;
 label values BC12PAYX50 BC12PAYX50 ;
 label values BC12PAYX51 BC12PAYX51 ;
 label values BC12PAYX52 BC12PAYX52 ;
 label values BC12PAYX55 BC12PAYX55 ;
 label values BC12PAYX56 BC12PAYX56 ;
 label values BC12PAYX57 BC12PAYX57 ;
 label values BC12PAYX58 BC12PAYX58 ;
 label values BC12PAYX61 BC12PAYX61 ;
 label values BC12PAYX62 BC12PAYX62 ;
 label values BC12PAYX63 BC12PAYX63 ;
 label values BC12PAYX64 BC12PAYX64 ;
 label values BC12PAYX67 BC12PAYX67 ;
 label values BC12PAYX68 BC12PAYX68 ;
 label values BC12PAYX69 BC12PAYX69 ;
 label values BC12PAYX70 BC12PAYX70 ;
 label values BC12PAYX73 BC12PAYX73 ;
 label values BC12PAYX74 BC12PAYX74 ;
 label values BC12PAYX75 BC12PAYX75 ;
 label values BC12PAYX76 BC12PAYX76 ;
 label values BC12PAYX79 BC12PAYX79 ;
 label values BC12PAYX80 BC12PAYX80 ;
 label values BC12PAYX81 BC12PAYX81 ;
 label values BC12PAYX82 BC12PAYX82 ;
 label values BC12PAYX85 BC12PAYX85 ;
 label values BC12PAYX86 BC12PAYX86 ;
 label values BC12PAYX87 BC12PAYX87 ;
 label values BC12PAYX88 BC12PAYX88 ;
 label values REGCAR12_F_01 REGCAR12_F_01 ;
 label values REGCAR12_F_02 REGCAR12_F_02 ;
 label values REGCAR12_F_03 REGCAR12_F_03 ;
 label values REGCAR12_F_04 REGCAR12_F_04 ;
 label values REGCAR12_F_05 REGCAR12_F_05 ;
 label values REGCAR12_F_06 REGCAR12_F_06 ;
 label values REGCAR12_F_07 REGCAR12_F_07 ;
 label values REGCAR12_F_08 REGCAR12_F_08 ;
 label values REGCAR12_F_09 REGCAR12_F_09 ;
 label values REGCAR12_F_10 REGCAR12_F_10 ;
 label values REGCAR12_F_11 REGCAR12_F_11 ;
 label values REGCAR12_F_12 REGCAR12_F_12 ;
 label values REGCAR12_F_13 REGCAR12_F_13 ;
 label values REGCAR12_F_14 REGCAR12_F_14 ;
 label values REGCAR12_F_15 REGCAR12_F_15 ;
 label values everfpc everfpc ;
 label values KNDMDHLP01 KNDMDHLP01 ;
 label values KNDMDHLP02 KNDMDHLP02 ;
 label values KNDMDHLP03 KNDMDHLP03 ;
 label values KNDMDHLP04 KNDMDHLP04 ;
 label values KNDMDHLP05 KNDMDHLP05 ;
 label values KNDMDHLP06 KNDMDHLP06 ;
 label values KNDMDHLP07 KNDMDHLP07 ;
 label values KNDMDHLP08 KNDMDHLP08 ;
 label values KNDMDHLP09 KNDMDHLP09 ;
 label values lastpap lastpap ;
 label values mreaspap mreaspap ;
 label values agefpap agefpap ;
 label values AGEFPAP2 AGEFPAP2 ;
 label values ABNPAP3 ABNPAP3 ;
 label values intpap intpap ;
 label values pelwpap pelwpap ;
 label values lastpel lastpel ;
 label values mreaspel mreaspel ;
 label values agefpel agefpel ;
 label values AGEPEL2 AGEPEL2 ;
 label values intpel intpel ;
 label values evhpvtst evhpvtst ;
 label values hpvwpap hpvwpap ;
 label values lasthpv lasthpv ;
 label values mreashpv mreashpv ;
 label values agefhpv agefhpv ;
 label values AGEHPV2 AGEHPV2 ;
 label values inthpv inthpv ;
 label values asksmoke asksmoke ;
 label values askpreg askpreg ;
 label values askfolic askfolic ;
 label values talkdm talkdm ;
 label values provresp provresp ;
 label values provsaybc provsaybc ;
 label values provprebc provprebc ;
 label values provinfobc provinfobc ;
 label values rwant rwant ;
 label values probwant probwant ;
 label values pwant pwant ;
 label values jintend jintend ;
 label values jsureint jsureint ;
 label values jintendn jintendn ;
 label values jexpectl jexpectl ;
 label values jexpects jexpects ;
 label values jintnext jintnext ;
 label values intend intend ;
 label values sureint sureint ;
 label values intendn intendn ;
 label values expectl expectl ;
 label values expects expects ;
 label values intnext intnext ;
 label values hlpprg hlpprg ;
 label values howmanyr howmanyr ;
 label values SEEKWHO1 SEEKWHO1 ;
 label values SEEKWHO2 SEEKWHO2 ;
 label values TYPALLPG1 TYPALLPG1 ;
 label values TYPALLPG2 TYPALLPG2 ;
 label values TYPALLPG3 TYPALLPG3 ;
 label values TYPALLPG4 TYPALLPG4 ;
 label values TYPALLPG5 TYPALLPG5 ;
 label values TYPALLPG6 TYPALLPG6 ;
 label values whotest whotest ;
 label values OVUL12M OVUL12M ;
 label values whartin whartin ;
 label values INSEM12M INSEM12M ;
 label values OTMEDHEP1 OTMEDHEP1 ;
 label values OTMEDHEP2 OTMEDHEP2 ;
 label values OTMEDHEP3 OTMEDHEP3 ;
 label values OTMEDHEP4 OTMEDHEP4 ;
 label values inscovpg inscovpg ;
 label values FSTHLPPG_M FSTHLPPG_M ;
 label values FSTHLPPG_Y FSTHLPPG_Y ;
 label values CMPGVIS1 CMPGVIS1 ;
 label values TRYLONG2 TRYLONG2 ;
 label values UNIT_TRYLONG UNIT_TRYLONG ;
 label values hlppgnow hlppgnow ;
 label values RCNTPGH_M RCNTPGH_M ;
 label values RCNTPGH_Y RCNTPGH_Y ;
 label values cmpgvisl cmpgvisl ;
 label values numvstpg numvstpg ;
 label values prgvisit prgvisit ;
 label values hlpmc hlpmc ;
 label values TYPALLMC1 TYPALLMC1 ;
 label values TYPALLMC2 TYPALLMC2 ;
 label values TYPALLMC3 TYPALLMC3 ;
 label values TYPALLMC4 TYPALLMC4 ;
 label values TYPALLMC5 TYPALLMC5 ;
 label values miscnum miscnum ;
 label values INFRTPRB1 INFRTPRB1 ;
 label values INFRTPRB2 INFRTPRB2 ;
 label values INFRTPRB3 INFRTPRB3 ;
 label values INFRTPRB4 INFRTPRB4 ;
 label values INFRTPRB5 INFRTPRB5 ;
 label values duchfreq duchfreq ;
 label values pid pid ;
 label values pidsympt pidsympt ;
 label values pidtx pidtx ;
 label values LSTPIDTX_M LSTPIDTX_M ;
 label values LSTPIDTX_Y LSTPIDTX_Y ;
 label values cmpidlst cmpidlst ;
 label values diabetes diabetes ;
 label values gestdiab gestdiab ;
 label values uf uf ;
 label values ufsono ufsono ;
 label values ufcurr ufcurr ;
 label values ufdiagnos ufdiagnos ;
 label values uflimit uflimit ;
 label values UFTREAT_1 UFTREAT_1 ;
 label values UFTREAT_2 UFTREAT_2 ;
 label values UFTREAT_3 UFTREAT_3 ;
 label values UFTREAT_4 UFTREAT_4 ;
 label values UFTREAT_5 UFTREAT_5 ;
 label values UFTREAT_6 UFTREAT_6 ;
 label values UFTREAT_7 UFTREAT_7 ;
 label values UFTREAT_8 UFTREAT_8 ;
 label values endo endo ;
 label values endocurr endocurr ;
 label values endodiag endodiag ;
 label values endolim endolim ;
 label values ENDOTREAT_1 ENDOTREAT_1 ;
 label values ENDOTREAT_2 ENDOTREAT_2 ;
 label values ENDOTREAT_3 ENDOTREAT_3 ;
 label values ENDOTREAT_4 ENDOTREAT_4 ;
 label values ENDOTREAT_5 ENDOTREAT_5 ;
 label values ENDOTREAT_6 ENDOTREAT_6 ;
 label values ENDOTREAT_7 ENDOTREAT_7 ;
 label values ENDOTREAT_8 ENDOTREAT_8 ;
 label values ovuprob ovuprob ;
 label values pcos pcos ;
 label values PCOSSYMP_1 PCOSSYMP_1 ;
 label values PCOSSYMP_2 PCOSSYMP_2 ;
 label values PCOSSYMP_3 PCOSSYMP_3 ;
 label values PCOSSYMP_4 PCOSSYMP_4 ;
 label values PCOSSYMP_5 PCOSSYMP_5 ;
 label values PCOSSYMP_6 PCOSSYMP_6 ;
 label values deaf deaf ;
 label values blind blind ;
 label values difdecide difdecide ;
 label values difwalk difwalk ;
 label values difdress difdress ;
 label values difout difout ;
 label values evrcancer evrcancer ;
 label values agecancer agecancer ;
 label values precancer precancer ;
 label values mammog mammog ;
 label values AGEMAMM1 AGEMAMM1 ;
 label values REASMAMM1 REASMAMM1 ;
 label values clinexam clinexam ;
 label values famhyst famhyst ;
 label values MOMRISK70 MOMRISK70 ;
 label values MOMRISK40 MOMRISK40 ;
 label values alcorisk alcorisk ;
 label values bfeedrisk bfeedrisk ;
 label values donblood donblood ;
 label values hivtest hivtest ;
 label values nohivtst nohivtst ;
 label values WHENHIV_M WHENHIV_M ;
 label values WHENHIV_Y WHENHIV_Y ;
 label values cmhivtst cmhivtst ;
 label values hivtstyr hivtstyr ;
 label values hivresult hivresult ;
 label values whynoget whynoget ;
 label values plchiv plchiv ;
 label values RHHIVT1 RHHIVT1 ;
 label values RHHIVT21 RHHIVT21 ;
 label values RHHIVT22 RHHIVT22 ;
 label values hivtst hivtst ;
 label values prephiv prephiv ;
 label values talkdoct talkdoct ;
 label values AIDSTALK01 AIDSTALK01 ;
 label values AIDSTALK02 AIDSTALK02 ;
 label values AIDSTALK03 AIDSTALK03 ;
 label values AIDSTALK04 AIDSTALK04 ;
 label values AIDSTALK05 AIDSTALK05 ;
 label values AIDSTALK06 AIDSTALK06 ;
 label values AIDSTALK07 AIDSTALK07 ;
 label values AIDSTALK08 AIDSTALK08 ;
 label values AIDSTALK09 AIDSTALK09 ;
 label values AIDSTALK10 AIDSTALK10 ;
 label values AIDSTALK11 AIDSTALK11 ;
 label values retrovir retrovir ;
 label values preghiv preghiv ;
 label values evervacc evervacc ;
 label values HPVSHOT1 HPVSHOT1 ;
 label values HPVSEX1 HPVSEX1 ;
 label values vaccprob vaccprob ;
 label values bldpress bldpress ;
 label values highbp highbp ;
 label values bpmeds bpmeds ;
 label values NUTRINFO_1 NUTRINFO_1 ;
 label values NUTRINFO_2 NUTRINFO_2 ;
 label values NUTRINFO_3 NUTRINFO_3 ;
 label values NUTRINFO_4 NUTRINFO_4 ;
 label values NUTRINFO_5 NUTRINFO_5 ;
 label values usualcar usualcar ;
 label values uslplace uslplace ;
 label values USL12MOS USL12MOS ;
 label values currcov currcov ;
 label values COVERHOW01 COVERHOW01 ;
 label values COVERHOW02 COVERHOW02 ;
 label values COVERHOW03 COVERHOW03 ;
 label values parinsur parinsur ;
 label values INS_EXCH INS_EXCH ;
 label values INS_PREM INS_PREM ;
 label values COVER12 COVER12 ;
 label values numnocov numnocov ;
 label values sameadd sameadd ;
 label values brnout brnout ;
 label values relraisd relraisd ;
 label values ATTND14 ATTND14 ;
 label values relcurr relcurr ;
 label values reltrad reltrad ;
 label values FUNDAM1 FUNDAM1 ;
 label values FUNDAM2 FUNDAM2 ;
 label values FUNDAM3 FUNDAM3 ;
 label values FUNDAM4 FUNDAM4 ;
 label values reldlife reldlife ;
 label values attndnow attndnow ;
 label values milsvc milsvc ;
 label values WRK12MOS WRK12MOS ;
 label values FPT12MOS FPT12MOS ;
 label values DOLASTWK1 DOLASTWK1 ;
 label values DOLASTWK2 DOLASTWK2 ;
 label values DOLASTWK3 DOLASTWK3 ;
 label values DOLASTWK4 DOLASTWK4 ;
 label values DOLASTWK5 DOLASTWK5 ;
 label values DOLASTWK6 DOLASTWK6 ;
 label values rwrkst rwrkst ;
 label values WORKP12 WORKP12 ;
 label values rpayjob rpayjob ;
 label values rnumjob rnumjob ;
 label values rftptx rftptx ;
 label values rearnty rearnty ;
 label values SPLSTWK1 SPLSTWK1 ;
 label values SPLSTWK2 SPLSTWK2 ;
 label values SPLSTWK3 SPLSTWK3 ;
 label values SPLSTWK4 SPLSTWK4 ;
 label values SPLSTWK5 SPLSTWK5 ;
 label values spwrkst spwrkst ;
 label values sppayjob sppayjob ;
 label values spnumjob spnumjob ;
 label values spftptx spftptx ;
 label values spearnty spearnty ;
 label values samesex samesex ;
 label values chsuppor chsuppor ;
 label values reactslf reactslf ;
 label values chbother chbother ;
 label values acasilang acasilang ;
 label values genhealt genhealt ;
 label values bmicat bmicat ;
 label values drweigh drweigh ;
 label values tellwght tellwght ;
 label values wghtscrn wghtscrn ;
 label values engspeak engspeak ;
 label values casibirth casibirth ;
 label values casiloss casiloss ;
 label values casiabor casiabor ;
 label values casiadop casiadop ;
 label values nobedyr nobedyr ;
 label values stayrel stayrel ;
 label values evsuspen evsuspen ;
 label values gradsusp gradsusp ;
 label values SMK100 SMK100 ;
 label values agesmk agesmk ;
 label values SMOKE12 SMOKE12 ;
 label values smkstop smkstop ;
 label values DRINK12 DRINK12 ;
 label values UNIT30D UNIT30D ;
 label values DRINK30D DRINK30D ;
 label values drinkday drinkday ;
 label values BINGE30 BINGE30 ;
 label values drnkmost drnkmost ;
 label values BINGE12 BINGE12 ;
 label values POT12 POT12 ;
 label values COC12 COC12 ;
 label values CRACK12 CRACK12 ;
 label values CRYSTMTH12 CRYSTMTH12 ;
 label values INJECT12 INJECT12 ;
 label values vagsex vagsex ;
 label values agevagr agevagr ;
 label values condvag condvag ;
 label values whycondl whycondl ;
 label values getoralm getoralm ;
 label values givoralm givoralm ;
 label values condfell condfell ;
 label values anyoral anyoral ;
 label values timing timing ;
 label values analsex analsex ;
 label values condanal condanal ;
 label values oppsexany oppsexany ;
 label values oppsexgen oppsexgen ;
 label values condsexl condsexl ;
 label values opplifenum opplifenum ;
 label values oppyearnum oppyearnum ;
 label values VAGNUM12 VAGNUM12 ;
 label values ORALNUM12 ORALNUM12 ;
 label values ANALNUM12 ANALNUM12 ;
 label values bisexprt bisexprt ;
 label values nonmonog nonmonog ;
 label values NNONMONOG1 NNONMONOG1 ;
 label values NNONMONOG2 NNONMONOG2 ;
 label values NNONMONOG3 NNONMONOG3 ;
 label values MALSHT12 MALSHT12 ;
 label values prostfrq prostfrq ;
 label values johnfreq johnfreq ;
 label values HIVMAL12 HIVMAL12 ;
 label values givoralf givoralf ;
 label values getoralf getoralf ;
 label values femsex femsex ;
 label values samesexany samesexany ;
 label values samlifenum samlifenum ;
 label values samyearnum samyearnum ;
 label values SAMESEX1 SAMESEX1 ;
 label values fsamerel fsamerel ;
 label values mflastp mflastp ;
 label values dateapp dateapp ;
 label values attract attract ;
 label values ORIENT_A ORIENT_A ;
 label values ORIENT_B ORIENT_B ;
 label values confconc confconc ;
 label values timalon timalon ;
 label values RISKCHEK1 RISKCHEK1 ;
 label values RISKCHEK2 RISKCHEK2 ;
 label values RISKCHEK3 RISKCHEK3 ;
 label values RISKCHEK4 RISKCHEK4 ;
 label values chlamtst chlamtst ;
 label values STDOTHR12 STDOTHR12 ;
 label values STDTRT12 STDTRT12 ;
 label values gon gon ;
 label values chlam chlam ;
 label values herpes herpes ;
 label values genwarts genwarts ;
 label values syphilis syphilis ;
 label values evrinject evrinject ;
 label values evrshare evrshare ;
 label values earntype earntype ;
 label values earn earn ;
 label values EARNDK1 EARNDK1 ;
 label values EARNDK2 EARNDK2 ;
 label values EARNDK3 EARNDK3 ;
 label values EARNDK4 EARNDK4 ;
 label values toincwmy toincwmy ;
 label values totinc totinc ;
 label values FMINCDK1 FMINCDK1 ;
 label values FMINCDK2 FMINCDK2 ;
 label values FMINCDK3 FMINCDK3 ;
 label values FMINCDK4 FMINCDK4 ;
 label values FMINCDK5 FMINCDK5 ;
 label values pubasst pubasst ;
 label values PUBASTYP1 PUBASTYP1 ;
 label values foodstmp foodstmp ;
 label values wic wic ;
 label values hlptrans hlptrans ;
 label values hlpchldc hlpchldc ;
 label values hlpjob hlpjob ;
 label values freefood freefood ;
 label values hungry hungry ;
 label values MED_COST MED_COST ;
 label values ager ager ;
 label values fmarital fmarital ;
 label values rmarital rmarital ;
 label values educat educat ;
 label values hieduc hieduc ;
 label values hispanic hispanic ;
 label values race race ;
 label values HISPRACE2 HISPRACE2 ;
 label values numkdhh numkdhh ;
 label values numfmhh numfmhh ;
 label values hhfamtyp hhfamtyp ;
 label values hhpartyp hhpartyp ;
 label values nchildhh nchildhh ;
 label values hhkidtyp hhkidtyp ;
 label values cspbbhh cspbbhh ;
 label values cspbshh cspbshh ;
 label values cspokdhh cspokdhh ;
 label values intctfam intctfam ;
 label values PARAGE14 PARAGE14 ;
 label values educmom educmom ;
 label values AGEMOMB1 AGEMOMB1 ;
 label values AGER_I AGER_I ;
 label values FMARITAL_I FMARITAL_I ;
 label values RMARITAL_I RMARITAL_I ;
 label values EDUCAT_I EDUCAT_I ;
 label values HIEDUC_I HIEDUC_I ;
 label values HISPANIC_I HISPANIC_I ;
 label values RACE_I RACE_I ;
 label values HISPRACE2_I HISPRACE2_I ;
 label values NUMKDHH_I NUMKDHH_I ;
 label values NUMFMHH_I NUMFMHH_I ;
 label values HHFAMTYP_I HHFAMTYP_I ;
 label values HHPARTYP_I HHPARTYP_I ;
 label values NCHILDHH_I NCHILDHH_I ;
 label values HHKIDTYP_I HHKIDTYP_I ;
 label values CSPBBHH_I CSPBBHH_I ;
 label values CSPBSHH_I CSPBSHH_I ;
 label values CSPOKDHH_I CSPOKDHH_I ;
 label values INTCTFAM_I INTCTFAM_I ;
 label values PARAGE14_I PARAGE14_I ;
 label values EDUCMOM_I EDUCMOM_I ;
 label values AGEMOMB1_I AGEMOMB1_I ;
 label values rcurpreg rcurpreg ;
 label values pregnum pregnum ;
 label values compreg compreg ;
 label values lossnum lossnum ;
 label values abortion abortion ;
 label values lbpregs lbpregs ;
 label values parity parity ;
 label values BIRTHS5 BIRTHS5 ;
 label values BIRTH1 BIRTH1 ;
 label values OUTCOM01 OUTCOM01 ;
 label values OUTCOM02 OUTCOM02 ;
 label values OUTCOM03 OUTCOM03 ;
 label values OUTCOM04 OUTCOM04 ;
 label values OUTCOM05 OUTCOM05 ;
 label values OUTCOM06 OUTCOM06 ;
 label values OUTCOM07 OUTCOM07 ;
 label values OUTCOM08 OUTCOM08 ;
 label values OUTCOM09 OUTCOM09 ;
 label values OUTCOM10 OUTCOM10 ;
 label values OUTCOM11 OUTCOM11 ;
 label values OUTCOM12 OUTCOM12 ;
 label values OUTCOM13 OUTCOM13 ;
 label values OUTCOM14 OUTCOM14 ;
 label values DATEND01 DATEND01 ;
 label values DATEND02 DATEND02 ;
 label values DATEND03 DATEND03 ;
 label values DATEND04 DATEND04 ;
 label values DATEND05 DATEND05 ;
 label values DATEND06 DATEND06 ;
 label values DATEND07 DATEND07 ;
 label values DATEND08 DATEND08 ;
 label values DATEND09 DATEND09 ;
 label values DATEND10 DATEND10 ;
 label values DATEND11 DATEND11 ;
 label values DATEND12 DATEND12 ;
 label values DATEND13 DATEND13 ;
 label values DATEND14 DATEND14 ;
 label values DATCON01 DATCON01 ;
 label values DATCON02 DATCON02 ;
 label values DATCON03 DATCON03 ;
 label values DATCON04 DATCON04 ;
 label values DATCON05 DATCON05 ;
 label values DATCON06 DATCON06 ;
 label values DATCON07 DATCON07 ;
 label values DATCON08 DATCON08 ;
 label values DATCON09 DATCON09 ;
 label values DATCON10 DATCON10 ;
 label values DATCON11 DATCON11 ;
 label values DATCON12 DATCON12 ;
 label values DATCON13 DATCON13 ;
 label values DATCON14 DATCON14 ;
 label values MAROUT01 MAROUT01 ;
 label values MAROUT02 MAROUT02 ;
 label values MAROUT03 MAROUT03 ;
 label values MAROUT04 MAROUT04 ;
 label values MAROUT05 MAROUT05 ;
 label values MAROUT06 MAROUT06 ;
 label values MAROUT07 MAROUT07 ;
 label values MAROUT08 MAROUT08 ;
 label values MAROUT09 MAROUT09 ;
 label values MAROUT10 MAROUT10 ;
 label values MAROUT11 MAROUT11 ;
 label values MAROUT12 MAROUT12 ;
 label values MAROUT13 MAROUT13 ;
 label values MAROUT14 MAROUT14 ;
 label values RMAROUT01 RMAROUT01 ;
 label values RMAROUT02 RMAROUT02 ;
 label values RMAROUT03 RMAROUT03 ;
 label values RMAROUT04 RMAROUT04 ;
 label values RMAROUT05 RMAROUT05 ;
 label values RMAROUT06 RMAROUT06 ;
 label values RMAROUT07 RMAROUT07 ;
 label values RMAROUT08 RMAROUT08 ;
 label values RMAROUT09 RMAROUT09 ;
 label values RMAROUT10 RMAROUT10 ;
 label values RMAROUT11 RMAROUT11 ;
 label values RMAROUT12 RMAROUT12 ;
 label values RMAROUT13 RMAROUT13 ;
 label values RMAROUT14 RMAROUT14 ;
 label values MARCON01 MARCON01 ;
 label values MARCON02 MARCON02 ;
 label values MARCON03 MARCON03 ;
 label values MARCON04 MARCON04 ;
 label values MARCON05 MARCON05 ;
 label values MARCON06 MARCON06 ;
 label values MARCON07 MARCON07 ;
 label values MARCON08 MARCON08 ;
 label values MARCON09 MARCON09 ;
 label values MARCON10 MARCON10 ;
 label values MARCON11 MARCON11 ;
 label values MARCON12 MARCON12 ;
 label values MARCON13 MARCON13 ;
 label values MARCON14 MARCON14 ;
 label values RMARCON01 RMARCON01 ;
 label values RMARCON02 RMARCON02 ;
 label values RMARCON03 RMARCON03 ;
 label values RMARCON04 RMARCON04 ;
 label values RMARCON05 RMARCON05 ;
 label values RMARCON06 RMARCON06 ;
 label values RMARCON07 RMARCON07 ;
 label values RMARCON08 RMARCON08 ;
 label values RMARCON09 RMARCON09 ;
 label values RMARCON10 RMARCON10 ;
 label values RMARCON11 RMARCON11 ;
 label values RMARCON12 RMARCON12 ;
 label values RMARCON13 RMARCON13 ;
 label values RMARCON14 RMARCON14 ;
 label values cebow cebow ;
 label values cebowc cebowc ;
 label values DATBABY1 DATBABY1 ;
 label values lastpreg lastpreg ;
 label values PREG_INT1 PREG_INT1 ;
 label values PREG_INT2 PREG_INT2 ;
 label values PREG_INT3 PREG_INT3 ;
 label values PREG_INT4 PREG_INT4 ;
 label values RCURPREG_I RCURPREG_I ;
 label values PREGNUM_I PREGNUM_I ;
 label values COMPREG_I COMPREG_I ;
 label values LOSSNUM_I LOSSNUM_I ;
 label values ABORTION_I ABORTION_I ;
 label values LBPREGS_I LBPREGS_I ;
 label values PARITY_I PARITY_I ;
 label values BIRTHS5_I BIRTHS5_I ;
 label values OUTCOM01_I OUTCOM01_I ;
 label values OUTCOM02_I OUTCOM02_I ;
 label values OUTCOM03_I OUTCOM03_I ;
 label values OUTCOM04_I OUTCOM04_I ;
 label values OUTCOM05_I OUTCOM05_I ;
 label values OUTCOM06_I OUTCOM06_I ;
 label values OUTCOM07_I OUTCOM07_I ;
 label values OUTCOM08_I OUTCOM08_I ;
 label values OUTCOM09_I OUTCOM09_I ;
 label values OUTCOM10_I OUTCOM10_I ;
 label values OUTCOM11_I OUTCOM11_I ;
 label values OUTCOM12_I OUTCOM12_I ;
 label values OUTCOM13_I OUTCOM13_I ;
 label values OUTCOM14_I OUTCOM14_I ;
 label values DATEND01_I DATEND01_I ;
 label values DATEND02_I DATEND02_I ;
 label values DATEND03_I DATEND03_I ;
 label values DATEND04_I DATEND04_I ;
 label values DATEND05_I DATEND05_I ;
 label values DATEND06_I DATEND06_I ;
 label values DATEND07_I DATEND07_I ;
 label values DATEND08_I DATEND08_I ;
 label values DATEND09_I DATEND09_I ;
 label values DATEND10_I DATEND10_I ;
 label values DATEND11_I DATEND11_I ;
 label values DATEND12_I DATEND12_I ;
 label values DATEND13_I DATEND13_I ;
 label values DATEND14_I DATEND14_I ;
 label values AGEPRG01_I AGEPRG01_I ;
 label values AGEPRG02_I AGEPRG02_I ;
 label values AGEPRG03_I AGEPRG03_I ;
 label values AGEPRG04_I AGEPRG04_I ;
 label values AGEPRG05_I AGEPRG05_I ;
 label values AGEPRG06_I AGEPRG06_I ;
 label values AGEPRG07_I AGEPRG07_I ;
 label values AGEPRG08_I AGEPRG08_I ;
 label values AGEPRG09_I AGEPRG09_I ;
 label values AGEPRG10_I AGEPRG10_I ;
 label values AGEPRG11_I AGEPRG11_I ;
 label values AGEPRG12_I AGEPRG12_I ;
 label values AGEPRG13_I AGEPRG13_I ;
 label values AGEPRG14_I AGEPRG14_I ;
 label values DATCON01_I DATCON01_I ;
 label values DATCON02_I DATCON02_I ;
 label values DATCON03_I DATCON03_I ;
 label values DATCON04_I DATCON04_I ;
 label values DATCON05_I DATCON05_I ;
 label values DATCON06_I DATCON06_I ;
 label values DATCON07_I DATCON07_I ;
 label values DATCON08_I DATCON08_I ;
 label values DATCON09_I DATCON09_I ;
 label values DATCON10_I DATCON10_I ;
 label values DATCON11_I DATCON11_I ;
 label values DATCON12_I DATCON12_I ;
 label values DATCON13_I DATCON13_I ;
 label values DATCON14_I DATCON14_I ;
 label values AGECON01_I AGECON01_I ;
 label values AGECON02_I AGECON02_I ;
 label values AGECON03_I AGECON03_I ;
 label values AGECON04_I AGECON04_I ;
 label values AGECON05_I AGECON05_I ;
 label values AGECON06_I AGECON06_I ;
 label values AGECON07_I AGECON07_I ;
 label values AGECON08_I AGECON08_I ;
 label values AGECON09_I AGECON09_I ;
 label values AGECON10_I AGECON10_I ;
 label values AGECON11_I AGECON11_I ;
 label values AGECON12_I AGECON12_I ;
 label values AGECON13_I AGECON13_I ;
 label values AGECON14_I AGECON14_I ;
 label values MAROUT01_I MAROUT01_I ;
 label values MAROUT02_I MAROUT02_I ;
 label values MAROUT03_I MAROUT03_I ;
 label values MAROUT04_I MAROUT04_I ;
 label values MAROUT05_I MAROUT05_I ;
 label values MAROUT06_I MAROUT06_I ;
 label values MAROUT07_I MAROUT07_I ;
 label values MAROUT08_I MAROUT08_I ;
 label values MAROUT09_I MAROUT09_I ;
 label values MAROUT10_I MAROUT10_I ;
 label values MAROUT11_I MAROUT11_I ;
 label values MAROUT12_I MAROUT12_I ;
 label values MAROUT13_I MAROUT13_I ;
 label values MAROUT14_I MAROUT14_I ;
 label values RMAROUT01_I RMAROUT01_I ;
 label values RMAROUT02_I RMAROUT02_I ;
 label values RMAROUT03_I RMAROUT03_I ;
 label values RMAROUT04_I RMAROUT04_I ;
 label values RMAROUT05_I RMAROUT05_I ;
 label values RMAROUT06_I RMAROUT06_I ;
 label values RMAROUT07_I RMAROUT07_I ;
 label values RMAROUT08_I RMAROUT08_I ;
 label values RMAROUT09_I RMAROUT09_I ;
 label values RMAROUT10_I RMAROUT10_I ;
 label values RMAROUT11_I RMAROUT11_I ;
 label values RMAROUT12_I RMAROUT12_I ;
 label values RMAROUT13_I RMAROUT13_I ;
 label values RMAROUT14_I RMAROUT14_I ;
 label values MARCON01_I MARCON01_I ;
 label values MARCON02_I MARCON02_I ;
 label values MARCON03_I MARCON03_I ;
 label values MARCON04_I MARCON04_I ;
 label values MARCON05_I MARCON05_I ;
 label values MARCON06_I MARCON06_I ;
 label values MARCON07_I MARCON07_I ;
 label values MARCON08_I MARCON08_I ;
 label values MARCON09_I MARCON09_I ;
 label values MARCON10_I MARCON10_I ;
 label values MARCON11_I MARCON11_I ;
 label values MARCON12_I MARCON12_I ;
 label values MARCON13_I MARCON13_I ;
 label values MARCON14_I MARCON14_I ;
 label values RMARCON01_I RMARCON01_I ;
 label values RMARCON02_I RMARCON02_I ;
 label values RMARCON03_I RMARCON03_I ;
 label values RMARCON04_I RMARCON04_I ;
 label values RMARCON05_I RMARCON05_I ;
 label values RMARCON06_I RMARCON06_I ;
 label values RMARCON07_I RMARCON07_I ;
 label values RMARCON08_I RMARCON08_I ;
 label values RMARCON09_I RMARCON09_I ;
 label values RMARCON10_I RMARCON10_I ;
 label values RMARCON11_I RMARCON11_I ;
 label values RMARCON12_I RMARCON12_I ;
 label values RMARCON13_I RMARCON13_I ;
 label values RMARCON14_I RMARCON14_I ;
 label values CEBOW_I CEBOW_I ;
 label values CEBOWC_I CEBOWC_I ;
 label values DATBABY1_I DATBABY1_I ;
 label values AGEBABY1_I AGEBABY1_I ;
 label values fmarno fmarno ;
 label values MARDAT01 MARDAT01 ;
 label values MARDAT02 MARDAT02 ;
 label values MARDAT03 MARDAT03 ;
 label values MARDAT04 MARDAT04 ;
 label values MARDIS01 MARDIS01 ;
 label values MARDIS02 MARDIS02 ;
 label values MARDIS03 MARDIS03 ;
 label values MARDIS04 MARDIS04 ;
 label values MAREND01 MAREND01 ;
 label values MAREND02 MAREND02 ;
 label values MAREND03 MAREND03 ;
 label values MAREND04 MAREND04 ;
 label values MAR1DISS MAR1DISS ;
 label values DD1REMAR DD1REMAR ;
 label values MAR1BIR1 MAR1BIR1 ;
 label values MAR1CON1 MAR1CON1 ;
 label values CON1MAR1 CON1MAR1 ;
 label values B1PREMAR B1PREMAR ;
 label values cohever cohever ;
 label values evmarcoh evmarcoh ;
 label values pmarrno pmarrno ;
 label values nonmarr nonmarr ;
 label values timescoh timescoh ;
 label values COHAB1 COHAB1 ;
 label values cohstat cohstat ;
 label values cohout cohout ;
 label values COH1DUR COH1DUR ;
 label values hadsex hadsex ;
 label values sexonce sexonce ;
 label values sexever sexever ;
 label values VRY1STAG VRY1STAG ;
 label values SEX1AGE SEX1AGE ;
 label values VRY1STSX VRY1STSX ;
 label values DATESEX1 DATESEX1 ;
 label values sexmar sexmar ;
 label values SEX1FOR SEX1FOR ;
 label values sexunion sexunion ;
 label values sexout sexout ;
 label values fpdur fpdur ;
 label values PARTS1YR PARTS1YR ;
 label values lsexdate lsexdate ;
 label values lsexpreg lsexpreg ;
 label values SEX3MO SEX3MO ;
 label values NUMP3MOS NUMP3MOS ;
 label values lsexrage lsexrage ;
 label values PARTDUR1 PARTDUR1 ;
 label values PARTDUR2 PARTDUR2 ;
 label values PARTDUR3 PARTDUR3 ;
 label values RELATP1 RELATP1 ;
 label values RELATP2 RELATP2 ;
 label values RELATP3 RELATP3 ;
 label values lifprtnr lifprtnr ;
 label values FMARNO_I FMARNO_I ;
 label values CSPBIOKD_I CSPBIOKD_I ;
 label values MARDAT01_I MARDAT01_I ;
 label values MARDAT02_I MARDAT02_I ;
 label values MARDAT03_I MARDAT03_I ;
 label values MARDAT04_I MARDAT04_I ;
 label values MARDIS01_I MARDIS01_I ;
 label values MARDIS02_I MARDIS02_I ;
 label values MARDIS03_I MARDIS03_I ;
 label values MARDIS04_I MARDIS04_I ;
 label values MAREND01_I MAREND01_I ;
 label values MAREND02_I MAREND02_I ;
 label values MAREND03_I MAREND03_I ;
 label values MAREND04_I MAREND04_I ;
 label values FMAR1AGE_I FMAR1AGE_I ;
 label values AGEDISS1_I AGEDISS1_I ;
 label values AGEDD1_I AGEDD1_I ;
 label values MAR1DISS_I MAR1DISS_I ;
 label values DD1REMAR_I DD1REMAR_I ;
 label values MAR1BIR1_I MAR1BIR1_I ;
 label values MAR1CON1_I MAR1CON1_I ;
 label values CON1MAR1_I CON1MAR1_I ;
 label values B1PREMAR_I B1PREMAR_I ;
 label values COHEVER_I COHEVER_I ;
 label values EVMARCOH_I EVMARCOH_I ;
 label values PMARRNO_I PMARRNO_I ;
 label values NONMARR_I NONMARR_I ;
 label values TIMESCOH_I TIMESCOH_I ;
 label values COHAB1_I COHAB1_I ;
 label values COHSTAT_I COHSTAT_I ;
 label values COHOUT_I COHOUT_I ;
 label values COH1DUR_I COH1DUR_I ;
 label values HADSEX_I HADSEX_I ;
 label values SEXEVER_I SEXEVER_I ;
 label values VRY1STAG_I VRY1STAG_I ;
 label values SEX1AGE_I SEX1AGE_I ;
 label values VRY1STSX_I VRY1STSX_I ;
 label values DATESEX1_I DATESEX1_I ;
 label values SEXONCE_I SEXONCE_I ;
 label values SEXMAR_I SEXMAR_I ;
 label values SEX1FOR_I SEX1FOR_I ;
 label values SEXUNION_I SEXUNION_I ;
 label values SEXOUT_I SEXOUT_I ;
 label values FPDUR_I FPDUR_I ;
 label values PARTS1YR_I PARTS1YR_I ;
 label values LSEXDATE_I LSEXDATE_I ;
 label values SEXP3MO_I SEXP3MO_I ;
 label values NUMP3MOS_I NUMP3MOS_I ;
 label values LSEXRAGE_I LSEXRAGE_I ;
 label values PARTDUR1_I PARTDUR1_I ;
 label values PARTDUR2_I PARTDUR2_I ;
 label values PARTDUR3_I PARTDUR3_I ;
 label values RELATP1_I RELATP1_I ;
 label values RELATP2_I RELATP2_I ;
 label values RELATP3_I RELATP3_I ;
 label values LIFPRTNR_I LIFPRTNR_I ;
 label values strloper strloper ;
 label values fecund fecund ;
 label values ANYBC36 ANYBC36 ;
 label values NOSEX36 NOSEX36 ;
 label values infert infert ;
 label values ANYBC12 ANYBC12 ;
 label values anymthd anymthd ;
 label values NOSEX12 NOSEX12 ;
 label values SEXP3MO SEXP3MO ;
 label values CONSTAT1 CONSTAT1 ;
 label values CONSTAT2 CONSTAT2 ;
 label values CONSTAT3 CONSTAT3 ;
 label values CONSTAT4 CONSTAT4 ;
 label values pillr pillr ;
 label values condomr condomr ;
 label values SEX1MTHD1 SEX1MTHD1 ;
 label values SEX1MTHD2 SEX1MTHD2 ;
 label values SEX1MTHD3 SEX1MTHD3 ;
 label values SEX1MTHD4 SEX1MTHD4 ;
 label values MTHUSE12 MTHUSE12 ;
 label values METH12M1 METH12M1 ;
 label values METH12M2 METH12M2 ;
 label values METH12M3 METH12M3 ;
 label values METH12M4 METH12M4 ;
 label values MTHUSE3 MTHUSE3 ;
 label values METH3M1 METH3M1 ;
 label values METH3M2 METH3M2 ;
 label values METH3M3 METH3M3 ;
 label values METH3M4 METH3M4 ;
 label values FMETHOD1 FMETHOD1 ;
 label values FMETHOD2 FMETHOD2 ;
 label values FMETHOD3 FMETHOD3 ;
 label values FMETHOD4 FMETHOD4 ;
 label values OLDWP01 OLDWP01 ;
 label values OLDWP02 OLDWP02 ;
 label values OLDWP03 OLDWP03 ;
 label values OLDWP04 OLDWP04 ;
 label values OLDWP05 OLDWP05 ;
 label values OLDWP06 OLDWP06 ;
 label values OLDWP07 OLDWP07 ;
 label values OLDWP08 OLDWP08 ;
 label values OLDWP09 OLDWP09 ;
 label values OLDWP10 OLDWP10 ;
 label values OLDWP11 OLDWP11 ;
 label values OLDWP12 OLDWP12 ;
 label values OLDWP13 OLDWP13 ;
 label values OLDWP14 OLDWP14 ;
 label values OLDWR01 OLDWR01 ;
 label values OLDWR02 OLDWR02 ;
 label values OLDWR03 OLDWR03 ;
 label values OLDWR04 OLDWR04 ;
 label values OLDWR05 OLDWR05 ;
 label values OLDWR06 OLDWR06 ;
 label values OLDWR07 OLDWR07 ;
 label values OLDWR08 OLDWR08 ;
 label values OLDWR09 OLDWR09 ;
 label values OLDWR10 OLDWR10 ;
 label values OLDWR11 OLDWR11 ;
 label values OLDWR12 OLDWR12 ;
 label values OLDWR13 OLDWR13 ;
 label values OLDWR14 OLDWR14 ;
 label values WANTRP01 WANTRP01 ;
 label values WANTRP02 WANTRP02 ;
 label values WANTRP03 WANTRP03 ;
 label values WANTRP04 WANTRP04 ;
 label values WANTRP05 WANTRP05 ;
 label values WANTRP06 WANTRP06 ;
 label values WANTRP07 WANTRP07 ;
 label values WANTRP08 WANTRP08 ;
 label values WANTRP09 WANTRP09 ;
 label values WANTRP10 WANTRP10 ;
 label values WANTRP11 WANTRP11 ;
 label values WANTRP12 WANTRP12 ;
 label values WANTRP13 WANTRP13 ;
 label values WANTRP14 WANTRP14 ;
 label values WANTP01 WANTP01 ;
 label values WANTP02 WANTP02 ;
 label values WANTP03 WANTP03 ;
 label values WANTP04 WANTP04 ;
 label values WANTP05 WANTP05 ;
 label values WANTP06 WANTP06 ;
 label values WANTP07 WANTP07 ;
 label values WANTP08 WANTP08 ;
 label values WANTP09 WANTP09 ;
 label values WANTP10 WANTP10 ;
 label values WANTP11 WANTP11 ;
 label values WANTP12 WANTP12 ;
 label values WANTP13 WANTP13 ;
 label values WANTP14 WANTP14 ;
 label values NWWANTRP01 NWWANTRP01 ;
 label values NWWANTRP02 NWWANTRP02 ;
 label values NWWANTRP03 NWWANTRP03 ;
 label values NWWANTRP04 NWWANTRP04 ;
 label values NWWANTRP05 NWWANTRP05 ;
 label values NWWANTRP06 NWWANTRP06 ;
 label values NWWANTRP07 NWWANTRP07 ;
 label values NWWANTRP08 NWWANTRP08 ;
 label values NWWANTRP09 NWWANTRP09 ;
 label values NWWANTRP10 NWWANTRP10 ;
 label values NWWANTRP11 NWWANTRP11 ;
 label values NWWANTRP12 NWWANTRP12 ;
 label values NWWANTRP13 NWWANTRP13 ;
 label values NWWANTRP14 NWWANTRP14 ;
 label values WANTP5 WANTP5 ;
 label values STRLOPER_I STRLOPER_I ;
 label values FECUND_I FECUND_I ;
 label values INFERT_I INFERT_I ;
 label values ANYMTHD_I ANYMTHD_I ;
 label values NOSEX12_I NOSEX12_I ;
 label values SEX3MO_I SEX3MO_I ;
 label values CONSTAT1_I CONSTAT1_I ;
 label values CONSTAT2_I CONSTAT2_I ;
 label values CONSTAT3_I CONSTAT3_I ;
 label values CONSTAT4_I CONSTAT4_I ;
 label values PILLR_I PILLR_I ;
 label values CONDOMR_I CONDOMR_I ;
 label values SEX1MTHD1_I SEX1MTHD1_I ;
 label values SEX1MTHD2_I SEX1MTHD2_I ;
 label values SEX1MTHD3_I SEX1MTHD3_I ;
 label values SEX1MTHD4_I SEX1MTHD4_I ;
 label values MTHUSE12_I MTHUSE12_I ;
 label values METH12M1_I METH12M1_I ;
 label values METH12M2_I METH12M2_I ;
 label values METH12M3_I METH12M3_I ;
 label values METH12M4_I METH12M4_I ;
 label values MTHUSE3_I MTHUSE3_I ;
 label values METH3M1_I METH3M1_I ;
 label values METH3M2_I METH3M2_I ;
 label values METH3M3_I METH3M3_I ;
 label values METH3M4_I METH3M4_I ;
 label values FMETHOD1_I FMETHOD1_I ;
 label values FMETHOD2_I FMETHOD2_I ;
 label values FMETHOD3_I FMETHOD3_I ;
 label values FMETHOD4_I FMETHOD4_I ;
 label values DATEUSE1_I DATEUSE1_I ;
 label values OLDWP01_I OLDWP01_I ;
 label values OLDWP02_I OLDWP02_I ;
 label values OLDWP03_I OLDWP03_I ;
 label values OLDWP04_I OLDWP04_I ;
 label values OLDWP05_I OLDWP05_I ;
 label values OLDWP06_I OLDWP06_I ;
 label values OLDWP07_I OLDWP07_I ;
 label values OLDWP08_I OLDWP08_I ;
 label values OLDWP09_I OLDWP09_I ;
 label values OLDWP10_I OLDWP10_I ;
 label values OLDWP11_I OLDWP11_I ;
 label values OLDWP12_I OLDWP12_I ;
 label values OLDWP13_I OLDWP13_I ;
 label values OLDWP14_I OLDWP14_I ;
 label values OLDWR01_I OLDWR01_I ;
 label values OLDWR02_I OLDWR02_I ;
 label values OLDWR03_I OLDWR03_I ;
 label values OLDWR04_I OLDWR04_I ;
 label values OLDWR05_I OLDWR05_I ;
 label values OLDWR06_I OLDWR06_I ;
 label values OLDWR07_I OLDWR07_I ;
 label values OLDWR08_I OLDWR08_I ;
 label values OLDWR09_I OLDWR09_I ;
 label values OLDWR10_I OLDWR10_I ;
 label values OLDWR11_I OLDWR11_I ;
 label values OLDWR12_I OLDWR12_I ;
 label values OLDWR13_I OLDWR13_I ;
 label values OLDWR14_I OLDWR14_I ;
 label values WANTRP01_I WANTRP01_I ;
 label values WANTRP02_I WANTRP02_I ;
 label values WANTRP03_I WANTRP03_I ;
 label values WANTRP04_I WANTRP04_I ;
 label values WANTRP05_I WANTRP05_I ;
 label values WANTRP06_I WANTRP06_I ;
 label values WANTRP07_I WANTRP07_I ;
 label values WANTRP08_I WANTRP08_I ;
 label values WANTRP09_I WANTRP09_I ;
 label values WANTRP10_I WANTRP10_I ;
 label values WANTRP11_I WANTRP11_I ;
 label values WANTRP12_I WANTRP12_I ;
 label values WANTRP13_I WANTRP13_I ;
 label values WANTRP14_I WANTRP14_I ;
 label values WANTP01_I WANTP01_I ;
 label values WANTP02_I WANTP02_I ;
 label values WANTP03_I WANTP03_I ;
 label values WANTP04_I WANTP04_I ;
 label values WANTP05_I WANTP05_I ;
 label values WANTP06_I WANTP06_I ;
 label values WANTP07_I WANTP07_I ;
 label values WANTP08_I WANTP08_I ;
 label values WANTP09_I WANTP09_I ;
 label values WANTP10_I WANTP10_I ;
 label values WANTP11_I WANTP11_I ;
 label values WANTP12_I WANTP12_I ;
 label values WANTP13_I WANTP13_I ;
 label values WANTP14_I WANTP14_I ;
 label values NWWANTRP01_I NWWANTRP01_I ;
 label values NWWANTRP02_I NWWANTRP02_I ;
 label values NWWANTRP03_I NWWANTRP03_I ;
 label values NWWANTRP04_I NWWANTRP04_I ;
 label values NWWANTRP05_I NWWANTRP05_I ;
 label values NWWANTRP06_I NWWANTRP06_I ;
 label values NWWANTRP07_I NWWANTRP07_I ;
 label values NWWANTRP08_I NWWANTRP08_I ;
 label values NWWANTRP09_I NWWANTRP09_I ;
 label values NWWANTRP10_I NWWANTRP10_I ;
 label values NWWANTRP11_I NWWANTRP11_I ;
 label values NWWANTRP12_I NWWANTRP12_I ;
 label values NWWANTRP13_I NWWANTRP13_I ;
 label values NWWANTRP14_I NWWANTRP14_I ;
 label values WANTP5_I WANTP5_I ;
 label values FPTIT12 FPTIT12 ;
 label values fptitmed fptitmed ;
 label values fptitste fptitste ;
 label values fptitbc fptitbc ;
 label values fptitchk fptitchk ;
 label values fptitcbc fptitcbc ;
 label values fptitcst fptitcst ;
 label values fptitec fptitec ;
 label values fptitcec fptitcec ;
 label values fptitpre fptitpre ;
 label values fptitabo fptitabo ;
 label values fptitpap fptitpap ;
 label values fptitpel fptitpel ;
 label values fptitprn fptitprn ;
 label values fptitppr fptitppr ;
 label values fptitstd fptitstd ;
 label values fpregfp fpregfp ;
 label values fpregmed fpregmed ;
 label values FPTIT12_I FPTIT12_I ;
 label values FPTITMED_I FPTITMED_I ;
 label values FPTITSTE_I FPTITSTE_I ;
 label values FPTITBC_I FPTITBC_I ;
 label values FPTITCHK_I FPTITCHK_I ;
 label values FPTITCBC_I FPTITCBC_I ;
 label values FPTITCST_I FPTITCST_I ;
 label values FPTITEC_I FPTITEC_I ;
 label values FPTITCEC_I FPTITCEC_I ;
 label values FPTITPRE_I FPTITPRE_I ;
 label values FPTITABO_I FPTITABO_I ;
 label values FPTITPAP_I FPTITPAP_I ;
 label values FPTITPEL_I FPTITPEL_I ;
 label values FPTITPRN_I FPTITPRN_I ;
 label values FPTITPPR_I FPTITPPR_I ;
 label values FPTITSTD_I FPTITSTD_I ;
 label values FPREGFP_I FPREGFP_I ;
 label values FPREGMED_I FPREGMED_I ;
 label values intent intent ;
 label values addexp addexp ;
 label values INTENT_I INTENT_I ;
 label values ADDEXP_I ADDEXP_I ;
 label values anyprghp anyprghp ;
 label values anymschp anymschp ;
 label values infever infever ;
 label values ovulate ovulate ;
 label values tubes tubes ;
 label values infertr infertr ;
 label values inferth inferth ;
 label values advice advice ;
 label values insem insem ;
 label values invitro invitro ;
 label values endomet endomet ;
 label values fibroids fibroids ;
 label values pidtreat pidtreat ;
 label values evhivtst evhivtst ;
 label values fptithiv fptithiv ;
 label values ANYPRGHP_I ANYPRGHP_I ;
 label values ANYMSCHP_I ANYMSCHP_I ;
 label values INFEVER_I INFEVER_I ;
 label values OVULATE_I OVULATE_I ;
 label values TUBES_I TUBES_I ;
 label values INFERTR_I INFERTR_I ;
 label values INFERTH_I INFERTH_I ;
 label values ADVICE_I ADVICE_I ;
 label values INSEM_I INSEM_I ;
 label values INVITRO_I INVITRO_I ;
 label values ENDOMET_I ENDOMET_I ;
 label values FIBROIDS_I FIBROIDS_I ;
 label values PIDTREAT_I PIDTREAT_I ;
 label values EVHIVTST_I EVHIVTST_I ;
 label values FPTITHIV_I FPTITHIV_I ;
 label values CURR_INS CURR_INS ;
 label values metro metro ;
 label values religion religion ;
 label values laborfor laborfor ;
 label values CURR_INS_I CURR_INS_I ;
 label values RELIGION_I RELIGION_I ;
 label values LABORFOR_I LABORFOR_I ;
 label values poverty poverty ;
 label values totincr totincr ;
 label values pubassis pubassis ;
 label values POVERTY_I POVERTY_I ;
 label values TOTINCR_I TOTINCR_I ;
 label values PUBASSIS_I PUBASSIS_I ;
 label values secu secu ;
 label values cmintvw cmintvw ;
 label values cmlstyr cmlstyr ;
 label values CMJAN3YR CMJAN3YR ;
 label values CMJAN4YR CMJAN4YR ;
 label values CMJAN5YR CMJAN5YR ;
 label values quarter quarter ;
 label values phase phase ;
 label values intvwyear intvwyear ;

#delimit cr

/********************************************************************

 Section 4: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace
