## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggh4x)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
us_final <- pull_summary_data(
    state_x = "US",
    time_max = 365 * 25
) |>
    dplyr::filter(time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        vaccine_coverage >= .5)

vaccine_ranges <- analytic_immunity |>
    dplyr::filter(age <= 20) |>
    dplyr::group_by(pathogen, st_abb, st_name) |>
    dplyr::summarize(current_vaccination = mean(estimate)) |>
    dplyr::group_by(pathogen) |>
    dplyr::summarize(current_vac_min = min(current_vaccination),
        current_vac_max = max(current_vaccination),
        .groups = "drop")

## Plot ----
facet_scales <- list(
    ## Measles
    ggplot2::scale_x_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels\n[87.7%, 95.6%]", "+10%")
    ),
    ## Rubella
    ggplot2::scale_x_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels\n[87.7%, 95.6%]", "+10%")
    ),
    ## Diphtheria
    ggplot2::scale_x_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels\n[77.6%, 91.3%]", "+10%")
    ),
    ## Polio
    ggplot2::scale_x_continuous(
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels\n[89.7%, 97.0%]", "+10%")
    )
)

p1 <- ggplot2::ggplot(
    us_final,
    ggplot2::aes(
        x = vaccine_coverage,
        y = winsorized_mean,
        ymin = p025,
        ymax = p975,
        group = vaccine_coverage_cat_short
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^8,
        fill = "gray",
        alpha = .25
    ) +
    ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of incident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^(0:8),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    ggplot2::facet_wrap(~pathogen_cat, scales = "free_x", nrow = 2) +
    ggh4x::facetted_pos_scales(x = facet_scales) +
    ggplot2::labs(x = "Vaccine coverage relative to current levels")

## Save ----
ggplot2::ggsave(
    here::here("plots", "fig1_cumulative_infections.pdf"),
    p1,
    width = 8,
    height = 8,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig1_cumulative_infections.jpg"),
    p1,
    width = 8,
    height = 8,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    us_final |>
        dplyr::select(
            metric_cat,
            pathogen_cat,
            vaccine_coverage_cat,
            state,
            winsorized_mean,
            mean,
            p025,
            p975
        ),
    here::here("output", "fig1_cumulative_infections.csv")
)
