# palettes ----

#' Return a fonction to interpolate a Bordeaux Metropole palette.
#'
#' @param name_palette Character. Name of the palette. Should be one of "continous", "continous2", "discrete", "discrete2", "divergent" or "divergent2".
#' @param reverse Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.
#' @param ... Additional arguments to pass to colorRampPalette().
#'
#' @importFrom grDevices colorRampPalette
#'
#' @return A function to interpolate a Bordeaux Metropole palette.
#' @export
#'
#' @examples
#' create_palette_bdxmetro("continuous")(6)
#' create_palette_bdxmetro("discrete")(6)
#' create_palette_bdxmetro("divergent")(6)
create_palette_bdxmetro <- function(name_palette = "continuous", reverse = FALSE, ...) {

  palette <- palettes_bdxmetro[[name_palette]]

  if (reverse == TRUE) {

    palette <- rev(palette)

  }

  colorRampPalette(palette, ...)

}

# scale functions ----

#' Show colors of a Bordeaux Metropole palette.
#'
#' @param colors Vector. Colors of the palette created with create_palette_bdxmetro().
#' @param show_codes Boolean. Indicates if hexadecimal codes should be printed or not. Default is FALSE.
#'
#' @importFrom tibble tibble
#' @importFrom ggplot2 ggplot aes geom_rect scale_fill_manual labs theme element_blank guides
#'
#' @return A ggplot2 plot.
#' @export
#'
#' @examples
#' show_palette_bdxmetro(create_palette_bdxmetro("continuous")(6))
#' show_palette_bdxmetro(create_palette_bdxmetro("discrete")(6))
#' show_palette_bdxmetro(create_palette_bdxmetro("discrete")(6), show_codes = TRUE)
show_palette_bdxmetro <- function(colors, show_codes = FALSE) {

  names(colors) <- colors

  plot_palette <- tibble(
    xmin = 0:(length(colors) - 1),
    xmax = 1:length(colors),
    ymin = rep(0, length(colors)),
    ymax = rep(1, length(colors)),
    col = colors
  ) %>%
    ggplot() +
    aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, fill = col) +
    geom_rect() +
    scale_fill_manual(values = colors) +
    labs(fill = "Hexadecimal codes") +
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.background = element_blank()
    )

  if (show_codes == FALSE) {

    plot_palette <- plot_palette +
      guides(fill = "none")
  }

  plot_palette

}

#' Continuous color scale constructor for Bordeaux Metropole colors.
#'
#' @param name_palette Character. Name of the palette. Should be one of "continous", "continous2", "divergent" or "divergent2".
#' @param reverse Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.
#' @param ... Additional arguments to pass to scale_color_gradientn().
#'
#' @importFrom ggplot2 scale_color_gradientn
#'
#' @return A scale function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, y = Sepal.Length, color = Sepal.Length) +
#'   geom_point() +
#'   scale_color_bdxmetro_continuous()
scale_color_bdxmetro_continuous <- function(name_palette = "continuous", reverse = FALSE, ...) {

  scale_color_gradientn(colors = create_palette_bdxmetro(name_palette, reverse = reverse)(256), ...)

}

#' Continuous fill scale constructor for Bordeaux Metropole colors.
#'
#' @param name_palette Character. Name of the palette. Should be one of "continous", "continous2", "divergent" or "divergent2".
#' @param reverse Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.
#' @param ... Additional arguments to pass to scale_fill_gradientn().
#'
#' @importFrom ggplot2 scale_fill_gradientn
#'
#' @return A scale function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = faithfuld) +
#'   aes(x = waiting, y = eruptions, fill = density) +
#'   geom_tile() +
#'   scale_fill_bdxmetro_continuous()
scale_fill_bdxmetro_continuous <- function(name_palette = "continuous", reverse = FALSE, ...) {

  scale_fill_gradientn(colors = create_palette_bdxmetro(name_palette, reverse = reverse)(256), ...)

}

#' Discrete color scale constructor for Bordeaux Metropole colors.
#'
#' @param name_palette Character. Name of the palette. Should be one of "discrete", "discrete2", "discrete3" (long).
#' @param reverse Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.
#' @param ... Additional arguments to pass to scale_color_manual().
#'
#' @importFrom ggplot2 scale_color_manual
#'
#' @return A scale function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, y = Sepal.Length, color = Species) +
#'   geom_point() +
#'   scale_color_bdxmetro_discrete()
scale_color_bdxmetro_discrete <- function(name_palette = "discrete", reverse = FALSE, ...) {

  palette <- unname(palettes_bdxmetro[[name_palette]])

  if (reverse == TRUE) {
    palette <- rev(palette)
  }

  scale_color_manual(values = palette)

}

#' Discrete fill scale constructor for Bordeaux Metropole colors.
#'
#' @param name_palette Character. Name of the palette. Should be one of "discrete", "discrete2", "discrete3" (long).
#' @param reverse Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.
#' @param ... Additional arguments to pass to scale_fill_manual().
#'
#' @importFrom ggplot2 scale_fill_manual
#'
#' @return A scale function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.8) +
#'   scale_fill_bdxmetro_discrete()
scale_fill_bdxmetro_discrete <- function(name_palette = "discrete", reverse = FALSE, ...) {

  palette <- unname(palettes_bdxmetro[[name_palette]])

  if (reverse == TRUE) {
    palette <- rev(palette)
  }

  scale_fill_manual(values = palette, ...)

}

# themes ----

#' Light theme constructor for Bordeaux Metropole design.
#'
#' @param regular_font_family Character. Regular font family. Default is Roboto.
#' @param light_font_family Character. Light font family. Default is Roboto Light.
#' @param main_text_color Character. Color for the main text color (i.e. the darkest).
#' @param secondary_text_color Character. Color for the seconday text color (i.e. the lightest).
#' @param plot_title_family Character. Font family for the plot title.
#' @param plot_title_color Character. Color for the plot title.
#' @param plot_title_size Numeric. Size for the plot title.
#' @param plot_subtitle_family Character. Font family for the plot subtitle.
#' @param plot_subtitle_color Character. Color for the plot subtitle.
#' @param plot_subtitle_size Numeric. Size for the plot subtitle.
#' @param axis_title_family Character. Font family for the axis titles (both x and y).
#' @param axis_title_color Character. Color for the the axis titles (both x and y).
#' @param axis_title_size Numeric. Size for the the axis titles (both x and y).
#' @param axis_text_family Character. Font family for the axis texts (both x and y).
#' @param axis_text_color Character. Color for the the axis texts (both x and y).
#' @param axis_text_size Numeric. Size for the the axis texts (both x and y).
#' @param legend_title_family Character. Font family for the legend title.
#' @param legend_title_color Character. Color for the legend title.
#' @param legend_title_size Numeric. Size for the legend title.
#' @param legend_text_family Character. Font family for the legend text.
#' @param legend_text_color Character. Color for the legend text.
#' @param legend_text_size Numeric. Size for the legend text.
#' @param legend_background_color Character. Color for the legend background.
#' @param legend_key_color Character. Color for the legend key.
#' @param facet_text_family Character. Font family for the facets texts.
#' @param facet_text_color Character. Color for the facets texts.
#' @param facet_text_size Numeric. Size for the facets texts.
#' @param facet_background Character. Color for the facets background.
#' @param facet_background_border Character. Color for the facets borders.
#' @param plot_caption_family Character. Font family for the caption.
#' @param plot_caption_color Character. Color for the caption.
#' @param plot_caption_size Numeric. Size for the caption.
#' @param panel_background_color Character. Color for the panel background.
#' @param panel_grid_color Character. Color for the panel grids.
#' @param plot_background_color Character. Color for the plot background.
#' @param plot_background_border_color Character. Color for the border of the plot background.
#'
#' @importFrom ggplot2 theme element_text element_blank element_rect element_line
#'
#' @return A ggplot2 theme function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(bdxmetroidentity)
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   scale_fill_bdxmetro_discrete() +
#'   labs(title = "Largeur des sépales des iris",
#'        subtitle = "Ceci est un graphique qui respecte la charte Bordeaux Metropole",
#'        x = "Largeur des sépales",
#'        y = "Densité",
#'        fill = "Variété d'iris",
#'        caption = "Light mode") +
#'   theme_bdxmetro_light()
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   scale_fill_bdxmetro_discrete() +
#'   guides(fill = "none") +
#'   labs(title = "Largeur des sépales des iris",
#'        subtitle = "Ceci est un graphique qui respecte la charte Bordeaux Metropole",
#'        x = "Largeur des sépales",
#'        y = "Densité",
#'        fill = "Variété d'iris",
#'        caption = "Dark mode") +
#'   facet_grid(rows = vars(Species)) +
#'   theme_bdxmetro_light()
theme_bdxmetro_light <- function(regular_font_family = "Roboto",
                                 light_font_family = "Roboto Light",
                                 main_text_color = "#292930",
                                 secondary_text_color = "#B0B0B0",
                                 plot_title_family = light_font_family,
                                 plot_title_color = main_text_color,
                                 plot_title_size = 20,
                                 plot_subtitle_family = light_font_family,
                                 plot_subtitle_color = main_text_color,
                                 plot_subtitle_size = 12,
                                 axis_title_family = regular_font_family,
                                 axis_title_color = main_text_color,
                                 axis_title_size = 11,
                                 axis_text_family = regular_font_family,
                                 axis_text_color = secondary_text_color,
                                 axis_text_size = 9,
                                 legend_title_family = regular_font_family,
                                 legend_title_color = main_text_color,
                                 legend_title_size = 11,
                                 legend_text_family = regular_font_family,
                                 legend_text_color = main_text_color,
                                 legend_text_size = 9,
                                 legend_background_color = "white",
                                 legend_key_color = "white",
                                 facet_text_family = regular_font_family,
                                 facet_text_color = secondary_text_color,
                                 facet_text_size = 12,
                                 facet_background = "white",
                                 facet_background_border = secondary_text_color,
                                 plot_caption_family = regular_font_family,
                                 plot_caption_color = secondary_text_color,
                                 plot_caption_size = 9,
                                 panel_background_color = "white",
                                 panel_grid_color = "#F5F5F5",
                                 plot_background_color = "white",
                                 plot_background_border_color = "white") {

  theme(
    plot.title = element_text(family = plot_title_family,
                              color = plot_title_color,
                              size = plot_title_size),
    plot.subtitle = element_text(family = plot_subtitle_family,
                                 color = plot_subtitle_color,
                                 size = plot_subtitle_size),
    axis.title = element_text(family = axis_title_family,
                              color = axis_title_color,
                              size = axis_title_size),
    axis.text = element_text(family = axis_text_family,
                             color = axis_text_color,
                             size = axis_text_size),
    axis.ticks = element_blank(),
    legend.title = element_text(family = legend_title_family,
                                color = legend_title_color,
                                size = legend_title_size),
    legend.text = element_text(family = legend_text_family,
                               color = legend_text_color,
                               size = legend_text_size),
    legend.background = element_rect(fill = legend_background_color),
    legend.key = element_rect(color = legend_key_color,
                              fill = legend_key_color),
    strip.text = element_text(family = facet_text_family,
                              color = facet_text_color,
                              size = facet_text_size),
    strip.background = element_rect(fill = facet_background,
                                    color = facet_background_border),
    plot.caption = element_text(family = plot_caption_family,
                                color = plot_caption_color,
                                size = plot_caption_size),
    panel.background = element_rect(fill = panel_background_color,
                                    color = plot_background_border_color),
    panel.grid = element_line(color = panel_grid_color,)
  )

}

#' Dark theme constructor for Bordeaux Metropole design.
#'
#' @inheritParams theme_bdxmetro_light
#'
#' @importFrom ggplot2 theme element_text element_blank element_rect element_line
#'
#' @return A ggplot2 theme function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(bdxmetroidentity)
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   scale_fill_bdxmetro_discrete() +
#'   labs(title = "Largeur des sépales des iris",
#'        subtitle = "Ceci est un graphique qui respecte la charte Bordeaux Metropole",
#'        x = "Largeur des sépales",
#'        y = "Densité",
#'        fill = "Variété d'iris",
#'        caption = "Dark mode") +
#'   theme_bdxmetro_dark()
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   scale_fill_bdxmetro_discrete() +
#'   guides(fill = "none") +
#'   labs(title = "Largeur des sépales des iris",
#'        subtitle = "Ceci est un graphique qui respecte la charte Bordeaux Metropole",
#'        x = "Largeur des sépales",
#'        y = "Densité",
#'        fill = "Variété d'iris",
#'        caption = "Dark mode") +
#'   facet_grid(rows = vars(Species)) +
#'   theme_bdxmetro_dark()
theme_bdxmetro_dark <- function(regular_font_family = "Roboto",
                                light_font_family = "Roboto Light",
                                main_text_color = "white",
                                secondary_text_color = "#9f9f9f",
                                plot_title_family = light_font_family,
                                plot_title_color = main_text_color,
                                plot_title_size = 20,
                                plot_subtitle_family = light_font_family,
                                plot_subtitle_color = main_text_color,
                                plot_subtitle_size = 12,
                                axis_title_family = regular_font_family,
                                axis_title_color = main_text_color,
                                axis_title_size = 11,
                                axis_text_family = regular_font_family,
                                axis_text_color = secondary_text_color,
                                axis_text_size = 9,
                                legend_title_family = regular_font_family,
                                legend_title_color = main_text_color,
                                legend_title_size = 11,
                                legend_text_family = regular_font_family,
                                legend_text_color = main_text_color,
                                legend_text_size = 9,
                                legend_background_color = "#101010",
                                legend_key_color = "#101010",
                                facet_text_family = regular_font_family,
                                facet_text_color = "white",
                                facet_text_size = 12,
                                facet_background = "#101010",
                                facet_background_border = secondary_text_color,
                                plot_caption_family = regular_font_family,
                                plot_caption_color = secondary_text_color,
                                plot_caption_size = 9,
                                panel_background_color = "#101010",
                                panel_grid_color = "#292929",
                                plot_background_color = "#101010",
                                plot_background_border_color = "#101010") {

  theme(
    plot.title = element_text(family = plot_title_family,
                              color = plot_title_color,
                              size = plot_title_size),
    plot.subtitle = element_text(family = plot_subtitle_family,
                                 color = plot_subtitle_color,
                                 size = plot_subtitle_size),
    axis.title = element_text(family = axis_title_family,
                              color = axis_title_color,
                              size = axis_title_size),
    axis.text = element_text(family = axis_text_family,
                             color = axis_text_color,
                             size = axis_text_size),
    axis.ticks = element_blank(),
    legend.title = element_text(family = legend_title_family,
                                color = legend_title_color,
                                size = legend_title_size),
    legend.text = element_text(family = legend_text_family,
                               color = legend_text_color,
                               size = legend_text_size),
    legend.background = element_rect(fill = legend_background_color),
    legend.key = element_rect(color = legend_key_color,
                              fill = legend_key_color),
    strip.text = element_text(family = facet_text_family,
                              color = facet_text_color,
                              size = facet_text_size),
    strip.background = element_rect(fill = facet_background,
                                    color = facet_background_border),
    plot.caption = element_text(family = plot_caption_family,
                                color = plot_caption_color,
                                size = plot_caption_size),
    panel.background = element_rect(fill = panel_background_color),
    panel.grid = element_line(color = panel_grid_color),
    plot.background = element_rect(fill = plot_background_color,
                                   color = plot_background_border_color)
  )

}

#' Light/Dark theme constructor for Bordeaux Metropole design.
#'
#' @param theme Character. Theme to be used. Either "light" (default) or "dark".
#' @param ... Additional arguments of \code{bdxmetroidentity::\link{theme_bdxmetro_light}()} or \code{bdxmetroidentity::\link{theme_bdxmetro_dark}()}.
#'
#' @return A ggplot2 theme function.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(bdxmetroidentity)
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   scale_fill_bdxmetro_discrete() +
#'   labs(title = "Largeur des sépales des iris",
#'        subtitle = "Ceci est un graphique qui respecte la charte Bordeaux Metropole",
#'        x = "Largeur des sépales",
#'        y = "Densité",
#'        fill = "Variété d'iris",
#'        caption = "Dark mode") +
#'   theme_bdxmetro(theme = "light")
theme_bdxmetro <- function(theme = "light",
                           ...) {

  if (!theme %in% c("light", "dark")) {
    stop("theme argument of html_bdxmetro() function should be either 'light' or 'dark'")
  }

  if (theme == "light") {

    theme_bdxmetro_light(...)

  } else if (theme == "dark") {

    theme_bdxmetro_dark(...)

  }

}
