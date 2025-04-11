## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
library(ggh4x)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
summary_holder <- readRDS(here::here("data", "endemic_timing_summary.RDS")) |>
    filter(vaccine_coverage >= .5,
        metric == "endemic_time")

facet_scales <- list(
    ## Measles
    dplyr::filter(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current levels\n[87.7%, 95.6%]", "+10%"),
        sec.axis = ggplot2::sec_axis(~.,
            breaks = seq(.5, 1.1, .05),
            labels = summary_holder |>
                dplyr::filter(pathogen == "measles") |>
                dplyr::arrange(vaccine_coverage) |>
                dplyr::mutate(label = sprintf("%0.1f%% (%s)",
                    round(n_finite / n_sims * 100, 1), prettyNum(n_finite, big.mark = ","))) |>
                dplyr::pull(label)
        )
    ),
    ## Rubella
    ggplot2::scale_y_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current levels\n[87.7%, 95.6%]", "+10%"),
        sec.axis = ggplot2::sec_axis(~.,
            breaks = seq(.5, 1.1, .05),
            labels = summary_holder |>
                dplyr::filter(pathogen == "rubella") |>
                dplyr::arrange(vaccine_coverage) |>
                dplyr::mutate(label = sprintf("%0.1f%% (%s)",
                    round(n_finite / n_sims * 100, 1), prettyNum(n_finite, big.mark = ","))) |>
                dplyr::pull(label)
        )
    ),
    ## Diphtheria
    ggplot2::scale_y_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current levels\n[77.6%, 91.3%]", "+10%"),
        sec.axis = ggplot2::sec_axis(~.,
            breaks = seq(.5, 1.1, .05),
            labels = summary_holder |>
                dplyr::filter(pathogen == "diphtheria") |>
                dplyr::arrange(vaccine_coverage) |>
                dplyr::mutate(label = sprintf("%0.1f%% (%s)",
                    round(n_finite / n_sims * 100, 1), prettyNum(n_finite, big.mark = ","))) |>
                dplyr::pull(label)
        )
    ),
    ## Polio
    ggplot2::scale_y_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current levels\n[89.7%, 97.0%]", "+10%"),
        sec.axis = ggplot2::sec_axis(~.,
            breaks = seq(.5, 1.1, .05),
            labels = summary_holder |>
                dplyr::filter(pathogen == "polio") |>
                dplyr::arrange(vaccine_coverage) |>
                dplyr::mutate(label = sprintf("%0.1f%% (%s)",
                    round(n_finite / n_sims * 100, 1), prettyNum(n_finite, big.mark = ","))) |>
                dplyr::pull(label)
        )
    )
)

## Plot ----
p1 <- ggplot2::ggplot(summary_holder,
    ggplot2::aes(x = mean,
        xmin = p025,
        xmax = p975,
        y = vaccine_coverage,
        alpha = n_finite)) +
    ggplot2::annotate(
        "rect",
        ymin = 1 - .025,
        ymax = 1 + .025,
        xmin = 0,
        xmax = 365 * 25,
        fill = "gray",
        alpha = .25
    ) +
    ggplot2::geom_errorbarh(height = 0) +
    ggplot2::geom_point(ggplot2::aes(size = n_finite)) +
    ggplot2::scale_y_continuous("Vaccine coverage relative to current levels",
        breaks = seq(.5, 1.1, .1),
        limits = c(.48, 1.12),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels", "+10%")) +
    ggplot2::scale_x_continuous(
        "Time to endemicity (years)",
        labels = function(x) round(x / 365),
        breaks = seq(0, 365 * 25, 365 * 5),
        expand = c(0, 0)
    ) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "bottom") +
    ggplot2::facet_wrap(~pathogen_cat, scales = "free", strip.position = "top", nrow = 2) +
    ggh4x::facetted_pos_scales(y = facet_scales)    +
    ggplot2::labs(y = "Vaccine coverage relative to current levels") +
    ggplot2::scale_size_binned_area(
        "Probability of\nreaching endemicity",
        max_size = 4,
        labels = function(x) {
            sprintf("%0.1f", round(x / 2000 * 100, 1))
        }
    ) +
    ggplot2::scale_alpha_binned(
        "Probability of\nreaching endemicity",
        labels = function(x) {
            sprintf("%0.1f", round(x / 2000 * 100, 1))
        }
    )

## Save ----
ggplot2::ggsave(
    here::here("plots", "fig3_endemic_timing.pdf"),
    p1,
    width = 11,
    height = 8,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig3_endemic_timing.jpg"),
    p1,
    width = 11,
    height = 8,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    summary_holder |>
        dplyr::select(
            pathogen_cat,
            vaccine_coverage_cat,
            n_sims,
            n_finite,
            mean,
            p025,
            p975
        ),
    here::here("output", "fig3_endemic_timing.csv")
)
