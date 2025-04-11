## Imports ----
library(tidyverse)
library(here)
library(usmap)
library(patchwork)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
state_total_py <- readRDS(here::here("data", "state_persontime.RDS"))

summary_df <- pull_summary_data(time_max = 365 * 25) |>
    dplyr::filter(
        time %in% c(365 * 25 - 1),
        state != "US",
        metric == "cume_new_infectious"
    )

summary_df <- summary_df |>
    dplyr::left_join(
        state_total_py |>
            dplyr::select(state, person_years = person_years_25),
        by = "state"
    ) |>
    dplyr::left_join(usmap::us_map("states") |>
        dplyr::select(state = abbr, geom))

## Helper functions ----
plot_old_map <- function(df, pathogen_x, vaccine_x, legend = TRUE) {
    temp_x <- summary_df |>
        dplyr::filter(pathogen == pathogen_x,
            vaccine_coverage == vaccine_x) |>
        dplyr::mutate(w_mean =  winsorized_mean / person_years * 100000)

    p1 <- ggplot2::ggplot(temp_x, ggplot2::aes(fill = w_mean)) +
        ggplot2::geom_sf(ggplot2::aes(geometry = geom), color = "white") +
        mk_nytimes(
            axis.text.y = ggplot2::element_blank(),
            axis.text.x = ggplot2::element_blank(),
            axis.line = ggplot2::element_blank(),
            axis.ticks = ggplot2::element_blank(),
            axis.title.y = ggplot2::element_blank(),
            axis.title.x = ggplot2::element_blank(),
            panel.grid = ggplot2::element_blank(),
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(),
            panel.grid.major.x = ggplot2::element_blank(),
            panel.grid.major.y = ggplot2::element_blank(),
            panel.grid.minor.x = ggplot2::element_blank(),
            panel.grid.minor.y = ggplot2::element_blank(),
            # plot.margin = unit(c(0, 0, 0, 0), "cm"),
            legend.position = "bottom",
            panel.background = ggplot2::element_rect(fill = "transparent", colour = NA),
            plot.background = ggplot2::element_rect(fill = "transparent", colour = NA)) +
        ggplot2::scale_x_continuous(expand = c(0, 0)) +
        ggplot2::scale_fill_viridis_c(
            name = "Cumulative infections per 100,000 person-years",
            direction = -1,
            end = .9,
            labels = scales::label_number(big.mark = ","),
            guide = ggplot2::guide_colorbar(
                theme = ggplot2::theme(
                    legend.title.position = "top",
                    legend.key.width = ggplot2::unit(15, "lines"),
                    legend.key.height = ggplot2::unit(.75, "lines")
                )
            )
        )

    if (!legend) {
        p1 <- p1 + ggplot2::theme(legend.position = "none")
    }

    p1
}

## All pathogens at 50% ----
map_measles <- plot_old_map(summary_df, "measles", .5) +
    ggplot2::labs(title = "Measles")
map_rubella <- plot_old_map(summary_df, "rubella", .5) +
    ggplot2::labs(title = "Rubella")
map_diphtheria <- plot_old_map(summary_df, "diphtheria", .5) +
    ggplot2::labs(title = "Diphtheria")
map_polio <- plot_old_map(summary_df, "polio", .5) +
    ggplot2::labs(title = "Polio")

### Combine ----
p_map <- map_measles +
    map_rubella +
    map_diphtheria +
    map_polio +
    patchwork::plot_layout(ncol = 2)

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS4_map_50percent.pdf"),
    p_map,
    width = 11,
    height = 11,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS4_map_50percent.jpg"),
    p_map,
    width = 11,
    height = 11,
    dpi = 1200
)
readr::write_csv(
    summary_df |>
        dplyr::filter(vaccine_coverage == .5) |>
        dplyr::select(
            pathogen_cat,
            metric_cat,
            pathogen_cat,
            state,
            mean,
            winsorized_mean,
            p025,
            p975,
            person_years,
            geom
        ),
    here::here("output", "figS4_map_50percent.csv")
)

## All pathogens at current levels ----
map_measles <- plot_old_map(summary_df, "measles", 1) +
    ggplot2::labs(title = "Measles")
map_rubella <- plot_old_map(summary_df, "rubella", 1) +
    ggplot2::labs(title = "Rubella")
map_diphtheria <- plot_old_map(summary_df, "diphtheria", 1) +
    ggplot2::labs(title = "Diphtheria")
map_polio <- plot_old_map(summary_df, "polio", 1) +
    ggplot2::labs(title = "Polio")

### Combine ----
p_map <- map_measles +
    map_rubella +
    map_diphtheria +
    map_polio +
    patchwork::plot_layout(ncol = 2)

### Save ----
ggplot2::ggsave(
    here::here("plots", "figS5_map_current_levels.pdf"),
    p_map,
    width = 11,
    height = 11,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS5_map_current_levels.jpg"),
    p_map,
    width = 11,
    height = 11,
    dpi = 1200
)
readr::write_csv(
    summary_df |>
        dplyr::filter(vaccine_coverage == 1) |>
        dplyr::select(
            pathogen_cat,
            metric_cat,
            pathogen_cat,
            state,
            mean,
            winsorized_mean,
            p025,
            p975,
            person_years,
            geom
        ),
    here::here("output", "figS5_map_current_levels.csv")
)

## All pathogens at 25% lower levels ----
map_measles <- plot_old_map(summary_df, "measles", .75) +
    ggplot2::labs(title = "Measles")
map_rubella <- plot_old_map(summary_df, "rubella", .75) +
    ggplot2::labs(title = "Rubella")
map_diphtheria <- plot_old_map(summary_df, "diphtheria", .75) +
    ggplot2::labs(title = "Diphtheria")
map_polio <- plot_old_map(summary_df, "polio", .75) +
    ggplot2::labs(title = "Polio")

## Combine ----
p_map <- map_measles +
    map_rubella +
    map_diphtheria +
    map_polio +
    patchwork::plot_layout(ncol = 2)

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS6_map_25lower.pdf"),
    p_map,
    width = 11,
    height = 11,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS6_map_25lower.jpg"),
    p_map,
    width = 11,
    height = 11,
    dpi = 1200
)
readr::write_csv(
    summary_df |>
        dplyr::filter(vaccine_coverage == .75) |>
        dplyr::select(
            pathogen_cat,
            metric_cat,
            pathogen_cat,
            state,
            mean,
            winsorized_mean,
            p025,
            p975,
            person_years,
            geom
        ),
    here::here("output", "figS6_map_25lower.csv")
)
