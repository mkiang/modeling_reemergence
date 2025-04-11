## Imports ----
library(tidyverse)
library(here)
library(geofacet)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
summary_df <- pull_summary_data(time_max = 365 * 25) |>
    dplyr::filter(
        time %in% c(365 * 25 - 1),
        state != "US",
        metric == "cume_new_infectious"
    )

## Measles ----
temp_df <- summary_df |>
    dplyr::filter(pathogen == "measles") |>
    dplyr::rename(code = state)

grid_labels <- purrr::map_dfr(.x = c("DC", datasets::state.abb),
    .f = ~ {
        dplyr::tibble(code = .x,
            vaccination_rate = return_current_vaccination(state_abbrev = .x,
                pathogen_x = "measles"))
    }) |>
    dplyr::right_join(geofacet::us_state_grid1) |>
    dplyr::mutate(code_label = sprintf("%s (%0.1f%%)", code, round(vaccination_rate * 100, 1))) |>
    dplyr::select(code, name, row, col, dplyr::everything()) |>
    dplyr::select(-vaccination_rate)

map_measles <- ggplot2::ggplot(
    temp_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = winsorized_mean + 1,
        ymin = p025 + 1,
        ymax = p975 + 1,
        group = vaccine_coverage_cat_short
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^7,
        fill = "gray",
        alpha = .25
    ) +
    # ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = c(.5, .75, 1.1),
        limits = c(.47, 1.13),
        labels = c("-50%", "-25%", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of incident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^c(0, 2, 4, 6),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    geofacet::facet_geo(~code, grid = grid_labels, label = "code_label")

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS7_state_level_measles_results.pdf"),
    map_measles,
    width = 11,
    height = 8,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS7_state_level_measles_results.jpg"),
    map_measles,
    width = 11,
    height = 8,
    scale = 1.2,
    dpi = 1200
)

## Rubella ----
temp_df <- summary_df |>
    dplyr::filter(pathogen == "rubella") |>
    dplyr::rename(code = state)

grid_labels <- purrr::map_dfr(.x = c("DC", datasets::state.abb),
    .f = ~ {
        dplyr::tibble(code = .x,
            vaccination_rate = return_current_vaccination(state_abbrev = .x,
                pathogen_x = "rubella"))
    }) |>
    dplyr::right_join(geofacet::us_state_grid1) |>
    dplyr::mutate(code_label = sprintf("%s (%0.1f%%)", code, round(vaccination_rate * 100, 1))) |>
    dplyr::select(code, name, row, col, dplyr::everything()) |>
    dplyr::select(-vaccination_rate)

map_rubella <- ggplot2::ggplot(
    temp_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = winsorized_mean + 1,
        ymin = p025 + 1,
        ymax = p975 + 1,
        group = vaccine_coverage_cat_short
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^7,
        fill = "gray",
        alpha = .25
    ) +
    # ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = c(.5, .75, 1.1),
        limits = c(.47, 1.13),
        labels = c("-50%", "-25%", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of incident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^c(0, 2, 4, 6),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    geofacet::facet_geo(~code, grid = grid_labels, label = "code_label")

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS8_state_level_rubella_results.pdf"),
    map_rubella,
    width = 11,
    height = 8,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS8_state_level_rubella_results.jpg"),
    map_rubella,
    width = 11,
    height = 8,
    scale = 1.2,
    dpi = 1200
)

## Diphtheria ----
temp_df <- summary_df |>
    dplyr::filter(pathogen == "diphtheria") |>
    dplyr::rename(code = state)

grid_labels <- purrr::map_dfr(.x = c("DC", datasets::state.abb),
    .f = ~ {
        dplyr::tibble(code = .x,
            vaccination_rate = return_current_vaccination(state_abbrev = .x,
                pathogen_x = "diphtheria"))
    }) |>
    dplyr::right_join(geofacet::us_state_grid1) |>
    dplyr::mutate(code_label = sprintf("%s (%0.1f%%)", code, round(vaccination_rate * 100, 1))) |>
    dplyr::select(code, name, row, col, dplyr::everything()) |>
    dplyr::select(-vaccination_rate)

map_diphtheria <- ggplot2::ggplot(
    temp_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = winsorized_mean + 1,
        ymin = p025 + 1,
        ymax = p975 + 1,
        group = vaccine_coverage_cat_short
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^7,
        fill = "gray",
        alpha = .25
    ) +
    # ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = c(.5, .75, 1.1),
        limits = c(.47, 1.13),
        labels = c("-50%", "-25%", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of incident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^c(0, 2, 4, 6),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    geofacet::facet_geo(~code, grid = grid_labels, label = "code_label")

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS9_state_level_diphtheria_results.pdf"),
    map_diphtheria,
    width = 11,
    height = 8,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS9_state_level_diphtheria_results.jpg"),
    map_diphtheria,
    width = 11,
    height = 8,
    scale = 1.2,
    dpi = 1200
)

## Polio ----
temp_df <- summary_df |>
    dplyr::filter(pathogen == "polio") |>
    dplyr::rename(code = state)

grid_labels <- purrr::map_dfr(.x = c("DC", datasets::state.abb),
    .f = ~ {
        dplyr::tibble(code = .x,
            vaccination_rate = return_current_vaccination(state_abbrev = .x,
                pathogen_x = "polio"))
    }) |>
    dplyr::right_join(geofacet::us_state_grid1) |>
    dplyr::mutate(code_label = sprintf("%s (%0.1f%%)", code, round(vaccination_rate * 100, 1))) |>
    dplyr::select(code, name, row, col, dplyr::everything()) |>
    dplyr::select(-vaccination_rate)

map_polio <- ggplot2::ggplot(
    temp_df,
    ggplot2::aes(
        x = vaccine_coverage,
        y = winsorized_mean + 1,
        ymin = p025 + 1,
        ymax = p975 + 1,
        group = vaccine_coverage_cat_short
    )
) +
    ggplot2::annotate(
        "rect",
        xmin = 1 - .025,
        xmax = 1 + .025,
        ymin = 1,
        ymax = 10^7,
        fill = "gray",
        alpha = .25
    ) +
    # ggplot2::annotation_logticks(sides = "l", alpha = .5) +
    ggplot2::geom_errorbar(width = 0) +
    ggplot2::geom_point(size = 1.25, alpha = .8) +
    ggplot2::scale_x_continuous("Vaccine coverage relative to current levels",
        breaks = c(.5, .75, 1.1),
        limits = c(.47, 1.13),
        labels = c("-50%", "-25%", "+10%")) +
    ggplot2::scale_y_continuous(
        "Mean (95% UI) cumulative number of incident cases after 25 years (log)",
        trans = "log10",
        # labels = scales::number_format(big.mark = ","),
        labels = scales::label_log(base = 10, digits = 1),
        breaks = 10^c(0, 2, 4, 6),
        expand = c(0, 0)
    ) +
    mk_nytimes(panel.border = ggplot2::element_rect(
        color = "grey",
        fill = NA,
        size = .75
    )) +
    geofacet::facet_geo(~code, grid = grid_labels, label = "code_label")

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS10_state_level_polio_results.pdf"),
    map_polio,
    width = 11,
    height = 8,
    scale = 1.2,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS10_state_level_polio_results.jpg"),
    map_polio,
    width = 11,
    height = 8,
    scale = 1.2,
    dpi = 1200
)

## Save csv ----
readr::write_csv(
    summary_df |>
        dplyr::select(
            pathogen_cat,
            vaccine_coverage_cat,
            state,
            mean = winsorized_mean,
            p025,
            p975
        ),
    here::here("output", "figS7-S10_state_level_results.csv")
)
