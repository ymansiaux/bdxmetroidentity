globalVariables(c(
 "%>%",
 "colorRampPalette",
 "xmax",
 "xmin",
 "ymax",
 "ymin",
 "column"
))

# Lancement de load_roboto_font() au chargement du package
#' @noRd
#'
.onLoad <- function(libname, pkgname) {

        load_roboto_font()

}
