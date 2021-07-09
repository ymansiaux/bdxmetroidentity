#' Import Roboto font.
#'
#' @importFrom extrafont font_import loadfonts fonts
#'
#' @return Nothing.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' load_roboto_font()
#' extrafont::fonts() # available fonts
#'
#' ggplot(data = iris) +
#'   aes(x = Sepal.Width, fill = Species) +
#'   geom_density(alpha = 0.6, color = NA) +
#'   labs(title = "Largeur des sépales des iris") +
#'   theme(
#'     title = element_text(family = "Roboto Light"),
#'     text = element_text(family = "Roboto")
#'     )
load_roboto_font <- function() {

  if(!("Roboto" %in% fonts()) | !("Roboto Light" %in% fonts()) | !("Roboto Thin" %in% fonts())) {

    font_import(
      paths = system.file("font", package = "bdxmetroidentity"),
      prompt = FALSE
    )

  }

  # To be used with the pdf output device
  pdfFonts <- grDevices::pdfFonts
  loadfonts(device = "pdf", quiet = TRUE)

  # To be used with the postscript output device
  postscriptFonts <- grDevices::postscriptFonts
  loadfonts(device = "postscript", quiet = TRUE)

  # To be used with the Windows output device
  if (.Platform$OS.type == "windows") {
    windowsFonts <- grDevices::windowsFonts
    loadfonts(device = "win", quiet = TRUE)
  }

  if(!("Roboto" %in% fonts()) | !("Roboto Light" %in% fonts()) | !("Roboto Thin" %in% fonts())) {

    message("Roboto fonts were not successfully loaded")

  }

}
