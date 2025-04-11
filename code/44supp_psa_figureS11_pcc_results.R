## Imports ----
library(tidyverse)
library(here)
source(here::here("code", "utils.R"))
source(here::here("code", "mk_nytimes.R"))

## Data ----
pcc_df <- readRDS(here::here("data", "psa_pcc_results.RDS")) |>
    dplyr::filter(vaccine_coverage %in% c(0, .25, .5, .75, .9, 1, 1.1))

pcc_df <- pcc_df |>
    categorize_pathogens() |>
    categorize_vaccine_coverage() |>
    categorize_psa_parameters() |>
    dplyr::arrange(state, pathogen_cat, vaccine_coverage_cat) |>
    dplyr::mutate(ypos = as.numeric(parameter_cat) * 2) |>
    dplyr::mutate(
        ypos = dplyr::case_when(
            vaccine_coverage == 0   ~ ypos - .6,
            vaccine_coverage == .25 ~ ypos - .4,
            vaccine_coverage == .5  ~ ypos - .2,
            vaccine_coverage == .75 ~ ypos + 0,
            vaccine_coverage == .9  ~ ypos + .2,
            vaccine_coverage == 1   ~ ypos + .4,
            vaccine_coverage == 1.1 ~ ypos + .6
        )
    )

ylab <- c(
    "Vaccine-reduced transmission",
    rev(
        c(
            "     Ages: 0-4",
            "     Ages: 5-9",
            "     Ages: 10-14",
            "     Ages: 15-19",
            "     Ages: 20-24",
            "     Ages: 25-29",
            "     Ages: 30-34",
            "     Ages: 35-39",
            "     Ages: 40-44",
            "     Ages: 45-49",
            "     Ages: 50-54",
            "     Ages: 55-59",
            "     Ages: 60-64",
            "     Ages: 65-69",
            "     Ages: 70-74",
            "     Ages: 75-79",
            "     Ages: 80-84",
            "     Ages: 85+"
        )
    ),
    "Initial immunity",
    "Importation rate",
    "Reproduction number"
)

p1 <- ggplot2::ggplot(
    pcc_df,
    ggplot2::aes(
        y = ypos,
        x = estimate,
        xmin = lower,
        xmax = upper,
        color = vaccine_coverage_cat,
        group = vaccine_coverage_cat
    )
) +
    ggplot2::geom_vline(xintercept = 0,
        color = "black",
        alpha = .5) +
    ggplot2::annotate(
        "rect",
        xmin = -Inf,
        xmax = Inf,
        ymin = c(2.75, 43),
        ymax = c(40.75, 45),
        fill = "gray",
        alpha = .25
    ) +
    ggplot2::geom_errorbarh(height = 0, alpha = .7) +
    ggplot2::geom_point(alpha = .7) +
    ggplot2::facet_grid(~pathogen_cat, scales = "free_y") +
    ggplot2::scale_x_continuous(
        "Partial rank correlation coefficient (95% CI)",
        limits = c(-1, 1),
        expand = c(0, .05)
    ) +
    ggplot2::scale_y_continuous(
        "Model parameter",
        breaks = seq(2, 44, 2),
        labels = ylab,
        limits = c(1, 45),
        expand = c(0, 0)
    ) +
    ggsci::scale_color_jama(name = "Vaccine coverage") +
    mk_nytimes(
        legend.position = "right",
        axis.text.y = ggplot2::element_text(hjust = 0),
        panel.border = ggplot2::element_rect(
            color = "grey",
            fill = NA,
            size = .75
        )
    )

## Save ----
ggplot2::ggsave(
    here::here("plots", "figS11_psa_pcc_results.pdf"),
    p1,
    width = 12,
    height = 8,
    scale = 1,
    device = grDevices::cairo_pdf
)
ggplot2::ggsave(
    here::here("plots", "figS11_psa_pcc_results.jpg"),
    p1,
    width = 12,
    height = 8,
    scale = 1,
    dpi = 1200
)
readr::write_csv(
    pcc_df |>
        dplyr::select(
            pathogen_cat,
            vaccine_coverage_cat,
            parameter_cat,
            state,
            estimate,
            lower,
            upper
        ),
    here::here("output", "figS11_psa_pcc_results.csv")
)
