## Imports ----
library(tidyverse)
library(fs)
library(here)
library(arrow)
library(duckdb)
library(ggsci)
source(here::here("code", "mk_nytimes.R"))
source(here::here("code", "utils.R"))

## Plot comparison ----
con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
supp_result <- dplyr::tbl(con, "read_parquet('supp_analyses/measles_lowerR0_summary.parquet')") |>
    dplyr::filter(
        time <= 365 * 25,
        metric == "cume_new_infectious",
        state == "US"
    ) |>
    dplyr::collect()

us_final <- pull_summary_data(
    state_x = "US",
    vaccine_x = c(.9, .95, 1, 1.05, 1.1),
    time_max = 365 * 30
) |>
    dplyr::filter(
        pathogen == "measles",
        time <= 365 * 25,
        metric == "cume_new_infectious"
    ) |>
    dplyr::mutate(r0 = 12) |>
    dplyr::mutate(mean = winsorized_mean)

results_df <- us_final |>
    dplyr::bind_rows(supp_result) |>
    categorize_vaccine_coverage() |>
    categorize_pathogens() |>
    categorize_metric() |>
    dplyr::mutate(r0_cat = factor(r0,
        levels = 10:13,
        labels = c("10", "11", "12 (Primary)", "13"),
        ordered = TRUE
    ))

p1 <- ggplot2::ggplot(
    results_df,
    ggplot2::aes(
        x = time,
        y = mean,
        ymin = p025,
        ymax = p975,
        color = r0_cat,
        fill = r0_cat,
        group = r0_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~vaccine_coverage_cat, scales = "free_y") +
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
        "Cumulative incident infections (95% UI)",
        expand = c(.01, 0),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())
    ) +
    ggsci::scale_color_lancet(name = "Reproduction number") +
    ggsci::scale_fill_lancet(name = "Reproduction number")

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS99_measles_lowerR0_over_time.pdf"),
    p1,
    width = 10,
    height = 6,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS99_measles_lowerR0_over_time.jpg"),
    p1,
    width = 10,
    height = 6,
    scale = 1,
    dpi = 1200
)
