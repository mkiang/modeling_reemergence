## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
complications_df <- readRDS(here::here("data", "complications_df.RDS")) |>
    dplyr::filter(!is.na(prob_gte1),
        complication != "hearing_loss",
        !grepl("\\_lower|\\_upper", complication)) |>
    dplyr::select(-mean, -sd, -median, -p025, -p250, -p750, -p975) |>
    dplyr::filter(vaccine_coverage %in% c(.75, .5, 1))

## Assumes probability of hospitalizations or death are independent
## across pathogens, which is how we model it.
collapsed_df <- complications_df |>
    dplyr::ungroup() |>
    dplyr::filter(!is.na(prob_gte1),
        complication %in% c("death", "hospitalization")) |>
    dplyr::mutate(pathogen = "all_pathogens") |>
    dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
    dplyr::summarize(prob_gte1 = min(sum(prob_gte1), 1)) |>
    dplyr::ungroup()

combined_df <- complications_df |>
    dplyr::bind_rows(collapsed_df) |>
    categorize_complications() |>
    categorize_pathogens() |>
    categorize_vaccine_coverage() |>
    dplyr::filter(!(
        complication %in% c("death", "hospitalization") &
            pathogen != "all_pathogens"
    ))

p1 <- ggplot2::ggplot(
    combined_df,
    ggplot2::aes(x = time, y = prob_gte1, color = complication_cat)
) +
    ggplot2::geom_line(size = 1, alpha = .9) +
    ggsci::scale_color_npg(name = "Infection-related complication") +
    ggplot2::scale_x_continuous(
        "Time (years)",
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x)
            x / 365,
        expand = c(0, 10),
        limits = c(0, 365 * 25 - 1)
    ) +
    ggplot2::scale_y_continuous("Probability of at least one infection-related complication", expand = c(.01, 0)) +
    mk_nytimes(legend.position = "right",
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
    )) +
    ggplot2::facet_grid(~vaccine_coverage_cat)

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS3_complication_timing.pdf"),
    p1,
    width = 8,
    height = 4,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS3_complication_timing.jpg"),
    p1,
    width = 8,
    height = 4,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    combined_df |>
        dplyr::filter(time %% 30 == 0 | time %in% c(0, 365 * 25)) |>
        dplyr::select(
            vaccine_coverage_cat,
            pathogen_cat,
            complication_cat,
            time,
            prob_gte1
        ),
    here::here("output", "figS3_complications_data.csv")
)
