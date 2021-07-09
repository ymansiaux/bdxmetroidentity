#' Convert a .Rmd file in .html format respecting the Bordeaux Metropole design.
#'
#' @param theme Character. Theme to be used. Either "light" (default) or "dark".
#' @param toc Boolean. To include a table of contents in the output. Default is TRUE.
#' @param toc_depth Numeric. Depth of headers to include in table of contents.
#' @param toc_float Boolean. To float the table of contents to the left of the document. Default is TRUE.
#' @param code_folding Character. Enable document readers to toggle the display of R code chunks.
#' @param ... Additional arguments of \code{rmarkdown::\link{html_document}()}.
#'
#' @return An R Markdown object to be passed to
#'   \code{rmarkdown::\link{render}()}.
#' @export
html_document_bdxmetro <- function(theme = "light",
                                   toc = TRUE,
                                   toc_depth = 2,
                                   toc_float = TRUE,
                                   code_folding = "hide",
                                   ...
                                   ){

  if (!theme %in% c("light", "dark")) {
    stop("theme argument of html_bdxmetro() function should be either 'light' or 'dark'")
  }

  if (theme == "light") {
    css_file <- "css_bdxmetro_light.css"
  } else if (theme == "dark") {
    css_file <- "css_bdxmetro_dark.css"
  }

  all_bdxmetro_css <- c(
    system.file("css", css_file, package = "bdxmetroidentity"),
    system.file("font", "stylesheet_roboto_font.css", package = "bdxmetroidentity")
  )

  message("********************************************************************************************************")
  message("You want to integrate a logo in the header of your report?")
  message("If yes, you must modify the title section of the .Rmd report header by copying/pasting the following content:")

  if (theme == "light") {
    message('title: |
      ![](`r system.file("logo", "datalab-logo-lightmode.png", package = "bdxmetroidentity")`){width=250px style="display: block; margin-bottom: 50px"}
      Report title')
  } else if (theme == "dark") {
    message('title: |
      ![](`r system.file("logo", "datalab-logo-darkmode.png", package = "bdxmetroidentity")`){width=250px style="display: block; margin-bottom: 50px"}
      Report title')
  }

  message('title: |
    ![](`r system.file("logo", "bm-logo.png", package = "bdxmetroidentity")`){width=400px style="display: block; margin:0 auto; margin-bottom: 50px"}
    Report title')
  message("Do not forget to change 'Report title'")
  message("********************************************************************************************************")

  rmarkdown::html_document(
    css = all_bdxmetro_css,
    highlight = "kate",
    toc = toc,
    toc_depth = toc_depth,
    toc_float = toc_float,
    code_folding = code_folding,
    ...
  )

}


#' Convert a .Rmd file in .html format (vignette) respecting the Bordeaux Metropole design.
#'
#' @param theme Character. Theme to be used. Either "light" (default) or "dark".
#' @param toc Boolean. To include a table of contents in the output. Default is TRUE.
#' @param toc_depth Numeric. Depth of headers to include in table of contents.
#' @param toc_float Boolean. To float the table of contents to the left of the document. Default is TRUE.
#' @inheritParams rmarkdown::html_vignette
#'
#' @return An R Markdown object to be passed to
#'   \code{rmarkdown::\link{render}()}.
#' @export
html_vignette_bdxmetro <- function(theme = "light",
                                   toc = TRUE,
                                   toc_depth = 2,
                                   toc_float = TRUE,
                                   fig_width = 3,
                                   fig_height = 3,
                                   dev = "png",
                                   df_print = "default",
                                   keep_md = FALSE,
                                   readme = FALSE,
                                   self_contained = TRUE,
                                   ...
){

  bdxmetroidentity::html_document_bdxmetro(
    theme = theme,
    toc = toc,
    toc_depth = toc_depth,
    toc_float = toc_float,
    fig_width = fig_width,
    fig_height = fig_height,
    dev = dev,
    df_print = df_print,
    keep_md = keep_md,
    readme = readme,
    self_contained = self_contained,
    ...
  )

}

