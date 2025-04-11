## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
library(ggh4x)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
summary_df <- pull_summary_data(state_x = "US", time_max = 365 * 5) |>
    dplyr::filter(metric == "cume_new_infectious") |>
    dplyr::filter(vaccine_coverage %in% c(-.95, 1))

calib_df <- dplyr::tibble(
    pathogen = c("measles", "rubella", "diphtheria", "polio"),
    time = 365 * 5 - 30,
    winsorized_mean = c(1475, 25, 1.5, 1),
    p025 = c(1475, 25, 1.5, 1),
    p975 = c(1475, 25, 1.5, 1),
) |>
    categorize_pathogens()

calib_df <- dplyr::bind_rows(
    calib_df |>
        dplyr::mutate(vaccine_coverage = 1),
    calib_df |>
        dplyr::mutate(vaccine_coverage = -.95)
) |>
    categorize_vaccine_coverage()

## Cumulative infections over time by pathogen and vaccine coverage ----
p1 <- ggplot2::ggplot(summary_df, ggplot2::aes(
    x = time,
    y = winsorized_mean,
    ymin = p025,
    ymax = p975
)) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    # ggplot2::facet_grid(vaccine_coverage_cat~pathogen_cat, scales = "free_y") +
    ggh4x::facet_grid2(
        dplyr::vars(vaccine_coverage_cat),
        dplyr::vars(pathogen_cat),
        scales = "free_y",
        independent = "y"
    ) +
    ggplot2::geom_point(data = calib_df,
        ggplot2::aes(x = time,
            y = winsorized_mean),
        color = "red",
        size = 2) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "right"
    ) +
    ggplot2::scale_x_continuous(
        "Time (years)",
        breaks = seq(0, 365 * 5, 365 * 1),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 10)
    ) +
    ggplot2::scale_y_continuous(
        "Cumulative incident infections at 95% vaccine coverage (95% UI)",
        expand = c(.05, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    )

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS1_cume_infections_calibration.pdf"),
    p1,
    width = 12,
    height = 8,
    scale = .8,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS1_cume_infections_calibration.jpg"),
    p1,
    width = 12,
    height = 8,
    scale = .8,
    dpi = 1200
)
readr::write_csv(
    summary_df |>
        dplyr::select(
            pathogen_cat,
            metric_cat,
            state,
            vaccine_coverage_cat,
            time,
            winsorized_mean,
            mean,
            p025,
            p975
        ),
    here::here("output", "figS1_cume_infections_calibration.csv")
)
