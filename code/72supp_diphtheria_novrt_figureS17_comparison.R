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
supp_result <- dplyr::tbl(con, "read_parquet('supp_analyses/diphtheria_novrt_summary.parquet')") |>
    dplyr::filter(
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        state == "US",
        vaccine_coverage >= .5
    ) |>
    dplyr::collect()

us_final <- pull_summary_data(
    state_x = "US",
    time_max = 365 * 30
) |>
    dplyr::filter(
        pathogen == "diphtheria",
        time == 365 * 25 - 1,
        metric == "cume_new_infectious",
        vaccine_coverage >= .5
    )

### Combine ----
combined_df <- dplyr::bind_rows(
    us_final |>
        dplyr::transmute(pathogen,
            vaccine_coverage,
            state,
            mean = winsorized_mean,
            p025,
            p975,
            result = "primary"),
    supp_result |>
        dplyr::transmute(pathogen,
            vaccine_coverage,
            state,
            mean = winsorized_mean,
            p025,
            p975,
            result = "no_vrt")
) |>
    categorize_vaccine_coverage() |>
    categorize_pathogens() |>
    dplyr::mutate(result_cat = factor(result,
        levels = c("no_vrt", "primary"),
        labels = c("No vaccine-reduced\ntransmission", "Primary result"),
        ordered = TRUE
    )) |>
    dplyr::arrange(pathogen_cat, vaccine_coverage_cat) |>
    dplyr::mutate(vaccine_coverage =
        dplyr::case_when(result == "no_vrt" ~ vaccine_coverage - .01,
            result == "primary" ~ vaccine_coverage + .01))

p1 <- ggplot2::ggplot(
    combined_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = mean,
        ymin = p025,
        ymax = p975,
        group = result_cat,
        color = result_cat,
        shape = result_cat,
        alpha = result_cat
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
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = seq(.5, 1.1, .1),
        limits = c(.475, 1.125),
        labels = c("-50%", "-40%", "-30%", "-20%", "-10%", "Current\nlevels", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of\nincident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^(0:8),
        expand = c(0, 0)
    ) +
    ggsci::scale_color_jama(name = "Result type") +
    ggplot2::scale_shape_manual(name = "Result type", values = c(17, 16)) +
    ggplot2::scale_alpha_manual(name = "Result type", values = c(1, .25)) +
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
    here::here("plots", "figS17_diphtheria_novrt_comparison.pdf"),
    p1,
    width = 6,
    height = 3,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS17_diphtheria_novrt_comparison.jpg"),
    p1,
    width = 6,
    height = 3,
    scale = 1.2,
    dpi = 1200
)
