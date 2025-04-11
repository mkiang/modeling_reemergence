## Imports ----
library(tidyverse)
library(fs)
library(here)
library(arrow)
library(ggsci)
source(here::here("code", "mk_nytimes.R"))
source(here::here("code", "utils.R"))

## Plot comparison ----
## Data
con <- duckdb::dbConnect(duckdb::duckdb(), read_only = TRUE)
supp_result <- dplyr::tbl(con, "read_parquet('supp_analyses/measles_lowerR0_summary.parquet')") |>
    dplyr::filter(
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        state == "US"
    ) |>
    dplyr::collect()

us_final <- pull_summary_data(
    state_x = "US",
    time_max = 365 * 30
) |>
    dplyr::filter(
        pathogen == "measles",
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        vaccine_coverage %in% c(.9, .95, 1, 1.05, 1.1)
    ) |>
    dplyr::mutate(r0 = 12)

### Combine ----
combined_df <- dplyr::bind_rows(
    us_final |>
        dplyr::transmute(pathogen, r0, vaccine_coverage, state, mean = winsorized_mean, p025, p975),
    supp_result |>
        dplyr::transmute(pathogen, r0, vaccine_coverage, state, mean, p025, p975)
) |>
    categorize_vaccine_coverage() |>
    categorize_pathogens() |>
    dplyr::mutate(r0_cat = factor(r0,
        levels = 10:13,
        labels = c("10", "11", "12 (Primary)", "13"),
        ordered = TRUE
    )) |>
    dplyr::arrange(pathogen_cat, vaccine_coverage_cat, r0) |>
    dplyr::mutate(vaccine_coverage = dplyr::case_when(
        r0 == 10 ~ vaccine_coverage - .006,
        r0 == 11 ~ vaccine_coverage - .002,
        r0 == 12 ~ vaccine_coverage + .002,
        r0 == 13 ~ vaccine_coverage + .006
    ))

p1 <- ggplot2::ggplot(
    combined_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = mean,
        ymin = p025,
        ymax = p975,
        group = r0_cat,
        color = r0_cat,
        fill = r0_cat
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
    ggplot2::geom_ribbon(alpha = .1, color = NA) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = seq(.9, 1.1, .05),
        # limits = c(.475, 1.125),
        labels = c("-10%", "-5%", "Current\nlevels", "+5%", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of\nincident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^(0:8),
        expand = c(0, 0)
    ) +
    ggsci::scale_color_lancet(name = "Reproduction number") +
    ggsci::scale_fill_lancet(name = "Reproduction number") +
    mk_nytimes(
        panel.grid.major.x = ggplot2::element_blank(),
        legend.position = "right",
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
    ))

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS18_measles_lowerR0_comparison.pdf"),
    p1,
    width = 6,
    height = 3,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS18_measles_lowerR0_comparison.jpg"),
    p1,
    width = 6,
    height = 3,
    scale = 1.2,
    dpi = 1200
)
