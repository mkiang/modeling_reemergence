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
supp_result <- dplyr::tbl(con, "read_parquet('supp_analyses/popweighted_importation_summary.parquet')") |>
    dplyr::filter(
        time <= 365 * 25,
        metric == "cume_new_infectious",
        state == "US"
    ) |>
    dplyr::mutate(result_type = "popweighted_importation") |>
    dplyr::collect()

us_final <- pull_summary_data(
    state_x = "US",
    vaccine_x = c(0, .25, .5, .75, .9, 1),
    time_max = 365 * 30
) |>
    dplyr::filter(
        time <= 365 * 25,
        metric == "cume_new_infectious"
    ) |>
    dplyr::mutate(result_type = "primary")

results_df <- us_final |>
    dplyr::bind_rows(supp_result) |>
    categorize_vaccine_coverage() |>
    categorize_pathogens() |>
    categorize_metric() |>
    dplyr::mutate(result_cat = factor(result_type,
        levels = c("popweighted_importation", "primary"),
        labels = c("Population-weighted\nimportation", "Primary result"),
        ordered = TRUE
    )) |>
    dplyr::filter(vaccine_coverage %in% c(0, .25, .5, .75, .9, 1))

p1 <- ggplot2::ggplot(
    results_df,
    ggplot2::aes(
        x = time,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        color = result_cat,
        fill = result_cat,
        group = result_cat
    )
) +
    ggplot2::geom_ribbon(alpha = .25, color = NA) +
    ggplot2::geom_line() +
    ggh4x::facet_grid2(dplyr::vars(pathogen_cat),
        dplyr::vars(vaccine_coverage_cat),
        scales = "free_y",
        independent = "y"
    ) +
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
    ggsci::scale_fill_bmj(name = "Result type") +
    ggsci::scale_color_bmj(name = "Result type")

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS99_popweighted_importation_over_time.pdf"),
    p1,
    width = 14,
    height = 8,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS99_popweighted_importation_over_time.jpg"),
    p1,
    width = 14,
    height = 8,
    scale = 1,
    dpi = 1200
)
