## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
endemic_df <- readRDS(here::here("data", "endemic_timing_full_results.RDS")) |>
    dplyr::filter(vaccine_coverage %in% c(0, .25, 0.5, 0.75, 0.9, 1))

p1 <- ggplot2::ggplot(
    endemic_df,
    ggplot2::aes(
        x = endemic_time,
        y = prop_susceptible,
        color = vaccine_coverage_cat
    )
) +
    ggplot2::geom_point(alpha = .25,
        size = 2) +
    ggplot2::scale_y_continuous(
        "Susceptible population one year before endemicity",
        limits = c(0, NA),
        labels = scales::percent
    ) +
    ggplot2::scale_x_continuous(
        "Time to endemicity (years)",
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 28),
        limits = c(0, 365 * 25)
    ) +
    ggplot2::guides(colour = ggplot2::guide_legend(override.aes = list(alpha = 1))) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    ggplot2::facet_wrap(~pathogen_cat) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "right"
    )

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS14_susceptibility_vs_endemic_timing.pdf"),
    p1,
    width = 11,
    height = 7,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS14_susceptibility_vs_endemic_timing.jpg"),
    p1,
    width = 11,
    height = 7,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    endemic_df |>
        dplyr::select(
            pathogen_cat,
            vaccine_coverage_cat,
            endemic_time,
            prop_susceptible
        ) |>
        dplyr::filter(is.finite(endemic_time)),
    here::here("output", "figS14_susceptibility_vs_endemic_timing.csv")
)
