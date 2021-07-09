#' Import a Cairo SVG pictogram.
#'
#' @param name_picto Character. Name of the SVG file without the .svg extension.
#'
#' @importFrom glue glue
#' @importFrom grImport2 readPicture
#' @importFrom rsvg rsvg_svg
#'
#' @return A SVG object.
#' @export
#'
#' @examples
#' car_picto <- read_picto(name_picto = "mag_car")
#' grImport2::grid.picture(picture = car_picto)
read_picto <- function(name_picto) {

  picto_file <- system.file(glue("picto/{name_picto}.svg"), package = "bdxmetroidentity")

  readPicture(rawToChar(rsvg_svg(picto_file)))

}
