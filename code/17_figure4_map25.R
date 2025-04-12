## Imports ----
library(tidyverse)
library(here)
library(usmap)
library(patchwork)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## CONSTANTS ----
fig_layout <- "
AAAAAAAA###
AAAAAAAA###
AAAAAAAABBB
AAAAAAAABBB
AAAAAAAABBB
AAAAAAAA###
"

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
discretize_rate <- function(df, pathogen_x, vaccine_x, breaks_x, rev = TRUE) {
    temp_x <- summary_df |>
        dplyr::filter(pathogen == pathogen_x,
            vaccine_coverage == vaccine_x) |>
        dplyr::mutate(w_mean =  mean / person_years * 100000)

    temp_x$cut_rate <- cut(
        temp_x$w_mean,
        breaks = breaks_x,
        include.lowest = TRUE,
        right = TRUE,
        ordered = TRUE
    )

    if (rev) {
        temp_x$cut_rate <- forcats::fct_rev(temp_x$cut_rate)
    }

    temp_x
}

plot_bare_histogram <- function(df) {
    ggplot2::ggplot(df, ggplot2::aes(x = cut_rate, fill = cut_rate)) +
        ggplot2::geom_bar(color = NA) +
        ggplot2::coord_flip() +
        ggplot2::theme(
            plot.title = ggplot2::element_text(size = 9),
            axis.text.y = ggplot2::element_text(size = 7),
            axis.text.x = ggplot2::element_text(size = 7),
            axis.line = ggplot2::element_blank(),
            axis.ticks = ggplot2::element_blank(),
            axis.title.y = ggplot2::element_blank(),
            plot.margin = ggplot2::unit(c(0, 0, 0, 0), "cm"),
            legend.position = "none",
            panel.background = ggplot2::element_rect(fill = "transparent", colour = NA),
            plot.background = ggplot2::element_rect(fill = "transparent", colour = NA)) +
        ggplot2::scale_fill_viridis_d(name = NULL,
            # option = "B",
            direction = -1,
            end = .9)
}

plot_map <- function(df) {
    p1 <- ggplot2::ggplot(df, ggplot2::aes(fill = cut_rate)) +
        ggplot2::geom_sf(ggplot2::aes(geometry = geom), color = "white") +
        ggplot2::scale_fill_viridis_d(name = NULL,
            # option = "B",
            direction = -1,
            end = .9) +
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
            plot.margin = ggplot2::unit(c(0, 0, 0, 0), "cm"),
            legend.position = "none",
            panel.background = ggplot2::element_rect(fill = "transparent", colour = NA),
            plot.background = ggplot2::element_rect(fill = "transparent", colour = NA)) +
        ggplot2::scale_x_continuous(expand = c(0, 0))

    p1
}

## Measles at 25% reduction ----
temp_df <- discretize_rate(
    summary_df,
    "measles",
    .75,
    c(-Inf, seq(150, 400, 50), Inf),
    rev = FALSE
)
plot_bare_histogram(temp_df)
p_inset <- plot_bare_histogram(temp_df) +
    ggplot2::scale_x_discrete(NULL,
        labels = rev(c(">400", "350", "300", "250", "200", "150", "<150"))) +
    ggplot2::scale_y_continuous(
        NULL,
        expand = c(0, 0),
        limits = c(0, 25)
    ) +
    ggplot2::geom_hline(yintercept = seq(0, 25, 5), color = "white") +
    ggplot2::labs(title = "Cumulative cases per\n100,000 person-years")
p_map <- plot_map(temp_df) +
    ggplot2::labs(title = "A) Measles")
map_measles <- p_map + p_inset + patchwork::plot_layout(design = fig_layout)
map_measles

map_measles_notitle <- plot_map(temp_df) + 
    p_inset + patchwork::plot_layout(design = fig_layout)

## Rubella at 25% reduction ----
temp_df <- discretize_rate(summary_df, 
                           "rubella", 
                           .75,
    c(-Inf, .01, .011, .012, .013, .014, .015, Inf),
    rev = FALSE)
plot_bare_histogram(temp_df)
p_inset <- plot_bare_histogram(temp_df) +
    ggplot2::scale_x_discrete(NULL,
        labels = rev(c(">.015", ".014", ".013", ".012", ".011", ".01", "<.01"))) +
    ggplot2::scale_y_continuous(
        NULL,
        expand = c(0, 0),
        limits = c(0, 30)
    ) +
    ggplot2::geom_hline(yintercept = seq(0, 30, 5), color = "white") +
    ggplot2::labs(title = "Cumulative cases per\n100,000 person-years")
p_map <- plot_map(temp_df) +
    ggplot2::labs(title = "B) Rubella")
map_rubella <- p_map + p_inset + patchwork::plot_layout(design = fig_layout)
map_rubella

## Diphtheria at 25% reduction ----
temp_df <- discretize_rate(summary_df, 
                           "diphtheria", 
                           .75,
    c(-Inf, .01, .011, .012, .013, .014, .015, Inf)/100,
    rev = FALSE)
plot_bare_histogram(temp_df)
p_inset <- plot_bare_histogram(temp_df) +
    ggplot2::scale_x_discrete(NULL,
        labels = rev(c(">.00015", ".00014", ".00013", ".00012", ".00011", ".0001", "<.0001"))) +
    ggplot2::scale_y_continuous(
        NULL,
        expand = c(0, 0),
        limits = c(0, 20)
    ) +
    ggplot2::geom_hline(yintercept = seq(0, 20, 5), color = "white") +
    ggplot2::labs(title = "Cumulative cases per\n100,000 person-years")
p_map <- plot_map(temp_df) +
    ggplot2::labs(title = "C) Diphtheria")
map_diphtheria <- p_map + p_inset + patchwork::plot_layout(design = fig_layout)
map_diphtheria

## Polio at 25% reduction ----
temp_df <- discretize_rate(summary_df, 
                           "polio", 
                           .75,
    c(-Inf, seq(.1, 2.75, .5), Inf),
    rev = FALSE)
plot_bare_histogram(temp_df)
p_inset <- plot_bare_histogram(temp_df) +
    ggplot2::scale_x_discrete(NULL,
        labels = rev(c(">2.6", "2.1", "1.6", "1.1", "0.6", "0.1", "<0.1"))) +
    ggplot2::scale_y_continuous(
        NULL,
        expand = c(0, 0),
        limits = c(0, 20)
    ) +
    ggplot2::geom_hline(yintercept = seq(0, 20, 5), color = "white") +
    ggplot2::labs(title = "Cumulative cases per\n100,000 person-years")
p_map <- plot_map(temp_df) +
    ggplot2::labs(title = "D) Polio")
map_polio <- p_map + p_inset + patchwork::plot_layout(design = fig_layout)
map_polio

## Save ----
ggplot2::ggsave(
    here::here("plots", "fig4a_map_measles_25percent.pdf"),
    map_measles,
    width = 11,
    height = 5.75,
    scale = .7,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig4a_map_measles_25percent.jpg"),
    map_measles,
    width = 11,
    height = 5.75,
    scale = .7,
    dpi = 1200
)
ggplot2::ggsave(
    here::here("plots", "github_header_image.jpg"),
    map_measles_notitle,
    width = 11,
    height = 5.75,
    scale = .7,
    dpi = 600
)
ggplot2::ggsave(
    here::here("plots", "fig4b_map_rubella_25percent.pdf"),
    map_rubella,
    width = 11,
    height = 5.75,
    scale = .7,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig4b_map_rubella_25percent.jpg"),
    map_rubella,
    width = 11,
    height = 5.75,
    scale = .7,
    dpi = 1200
)
ggplot2::ggsave(
    here::here("plots", "fig4c_map_diphtheria_25percent.pdf"),
    map_diphtheria,
    width = 11,
    height = 5.75,
    scale = .7,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig4c_map_diphtheria_25percent.jpg"),
    map_diphtheria,
    width = 11,
    height = 5.75,
    scale = .7,
    dpi = 1200
)
ggplot2::ggsave(
    here::here("plots", "fig4d_map_polio_25percent.pdf"),
    map_polio,
    width = 11,
    height = 5.75,
    scale = .7,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "fig4d_map_polio_25percent.jpg"),
    map_polio,
    width = 11,
    height = 5.75,
    scale = .7,
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
    here::here("output", "fig4_map_vaccine25.csv")
)
