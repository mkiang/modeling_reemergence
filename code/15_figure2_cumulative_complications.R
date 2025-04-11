## Imports ----
library(tidyverse)
library(duckdb)
library(here)
library(ggsci)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
complications_df <- readRDS(here::here("data", "complications_df.RDS")) |>
    dplyr::group_by(vaccine_coverage, pathogen, complication) |>
    dplyr::filter(grepl("cume", complication),
        vaccine_coverage >= .5,
        time %in% c(365 * 25, 365 * 25 - 1),
        complication != "cume_hearing_loss",
        !grepl("\\_lower|\\_upper", complication)) |>
    dplyr::select(-prob_gte1) |>
    dplyr::slice_max(time) |>
    dplyr::ungroup() |>
    dplyr::arrange(vaccine_coverage, complication)

## Assumes probability of hospitalizations or death are independent
## across pathogens, which is how we model it.
collapsed_df <- complications_df |>
    dplyr::select(-dplyr::ends_with("cat"), -vaccine_coverage_cat_short, -sd, -median) |>
    dplyr::ungroup() |>
    dplyr::filter(complication %in% c("cume_death", "cume_hospitalization")) |>
    dplyr::mutate(pathogen = "all_pathogens",
        time = 365 * 25) |>
    dplyr::group_by(vaccine_coverage, pathogen, complication, time) |>
    dplyr::summarize(dplyr::across(mean:p975, sum)) |>
    dplyr::ungroup()

combined_df <- complications_df |>
    dplyr::bind_rows(collapsed_df) |>
    categorize_complications() |>
    categorize_pathogens() |>
    categorize_vaccine_coverage() |>
    dplyr::filter(!(
        complication %in% c("cume_death", "cume_hospitalization") &
            pathogen != "all_pathogens"
    )) |>
    dplyr::arrange(vaccine_coverage, complication) |>
    dplyr::mutate(xpos = dplyr::case_when(
        complication == "cume_death" ~ vaccine_coverage + .02,
        complication == "cume_hospitalization" ~ vaccine_coverage + .01,
        complication == "cume_crs" ~ vaccine_coverage - .01,
        complication == "cume_neurological" ~ vaccine_coverage - .01,
        TRUE ~ vaccine_coverage
    ))

p1 <- ggplot2::ggplot(combined_df,
    ggplot2::aes(x = vaccine_coverage,
        y = mean + 1,
        ymin = p025 + 1,
        ymax = p975 + 1)) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^7.2,
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
        "Mean (95% UI) cumulative number of complications after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^(0:7.2),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    ggplot2::facet_wrap(~complication_cat, scales = "free_x", nrow = 2)

## Save ----
ggplot2::ggsave(
    here::here("plots", "fig2_cumulative_complications.pdf"),
    p1,
    width = 10,
    height = 7.5,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig2_cumulative_complications.jpg"),
    p1,
    width = 10,
    height = 7.5,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    combined_df |>
        dplyr::select(
            vaccine_coverage_cat,
            pathogen_cat,
            complication_cat,
            mean,
            p025,
            p975
        ),
    here::here("output", "fig2_complications_data.csv")
)
