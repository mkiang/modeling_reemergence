## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
library(ggh4x)
library(patchwork)
library(ggmagnify) ## remotes::install_github("hughjonesd/ggmagnify")
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
summary_df <- pull_summary_data(
    state_x = "US",
    time_max = 365 * 25,
    vaccine_x = c(0, .25, 0.5, 0.75, 0.9, 1, 1.1)
) |>
    dplyr::filter(metric == "cume_new_infectious")

## Cumulative infections over time by pathogen and vaccine coverage ----

### Preferred version ----
p1a <- ggplot2::ggplot(
    summary_df |> filter(pathogen == "measles"),
    ggplot2::aes(
        x = dplyr::filter,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        color = vaccine_coverage_cat,
        fill = vaccine_coverage_cat,
        group = vaccine_coverage_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    ggplot2::facet_grid(pathogen_cat ~ .) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "right",
        axis.text.x = ggplot2::element_blank()
    ) +
    ggplot2::scale_x_continuous(
        NULL,
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 10)
    ) +
    ggplot2::scale_y_continuous(
        "Cumulative incident infections (95% UI)",
        expand = c(.01, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    ggsci::scale_fill_jama(name = "Vaccine coverage") +
    ggplot2::coord_cartesian(ylim = c(0, 100500000)) +
    ggmagnify::geom_magnify(
        from = c(365 * 20, 365 * 25, 0, 1000000),
        to = c(365, 365 * 12, 25000000, 95500000),
        axes = "xy",
    )

p1b <- ggplot2::ggplot(
    summary_df |> dplyr::filter(pathogen == "rubella"),
    ggplot2::aes(
        x = time,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        color = vaccine_coverage_cat,
        fill = vaccine_coverage_cat,
        group = vaccine_coverage_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    facet_grid(pathogen_cat ~ .) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "right",
        axis.text.x = ggplot2::element_blank()
    ) +
    ggplot2::scale_x_continuous(
        NULL,
        # "Time (years)",
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 10)
    ) +
    ggplot2::scale_y_continuous(
        NULL,
        # "Cumulative incident infections (95% UI)",
        expand = c(.01, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    ggsci::scale_fill_jama(name = "Vaccine coverage") +
    ggplot2::coord_cartesian(ylim = c(0, 100500000)) +
    ggmagnify::geom_magnify(
        from = c(365 * 20, 365 * 25, 0, 1500),
        to = c(365, 365 * 12, 25000000, 95500000),
        axes = "xy",
    )

p1c <- ggplot2::ggplot(
    summary_df |> dplyr::filter(pathogen == "diphtheria"),
    ggplot2::aes(
        x = time,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        color = vaccine_coverage_cat,
        fill = vaccine_coverage_cat,
        group = vaccine_coverage_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    ggplot2::facet_grid(pathogen_cat ~ .) +
    mk_nytimes(
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        ),
        legend.position = "right",
        axis.text.x = ggplot2::element_blank()
    ) +
    ggplot2::scale_x_continuous(
        NULL,
        # "Time (years)",
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 10)
    ) +
    ggplot2::scale_y_continuous(
        NULL,
        # "Cumulative incident infections (95% UI)",
        expand = c(.01, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    ggsci::scale_fill_jama(name = "Vaccine coverage") +
    ggplot2::coord_cartesian(ylim = c(0, 100500000)) +
    ggmagnify::geom_magnify(
        from = c(365 * 20, 365 * 25, 0, 100),
        to = c(365, 365 * 12, 25000000, 95500000),
        axes = "xy",
    )

p1d <- ggplot2::ggplot(
    summary_df |> dplyr::filter(pathogen == "polio"),
    ggplot2::aes(
        x = time,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        color = vaccine_coverage_cat,
        fill = vaccine_coverage_cat,
        group = vaccine_coverage_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    ggplot2::facet_grid(pathogen_cat ~ .) +
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
        breaks = seq(0, 365 * 25, 365 * 5),
        labels = function(x) {
            x / 365
        },
        expand = c(0, 10)
    ) +
    ggplot2::scale_y_continuous(
        NULL,
        # "Cumulative incident infections (95% UI)",
        expand = c(.01, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    ggsci::scale_fill_jama(name = "Vaccine coverage") +
    ggplot2::coord_cartesian(ylim = c(0, 100500000)) +
    ggmagnify::geom_magnify(
        from = c(365 * 20, 365 * 25, 0, 40000),
        to = c(365, 365 * 12, 25000000, 95500000),
        axes = "xy",
    )

#### Save ----
p_combined <- p1a + p1b + p1c + p1d + patchwork::plot_layout(ncol = 1, guides = "collect")
ggplot2::ggsave(
    here::here("plots", "figS2_cume_infections_over_time.pdf"),
    p_combined,
    width = 7,
    height = 7,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS2_cume_infections_over_time.jpg"),
    p_combined,
    width = 7,
    height = 7,
    scale = 1.2,
    dpi = 1200
)
readr::write_csv(
    summary_df |>
        dplyr::select(
            pathogen_cat,
            vaccine_coverage_cat,
            time,
            winsorized_mean,
            p025,
            p975
        ),
    here::here("output", "figS2_cume_infections_over_time.csv")
)
