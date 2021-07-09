#' Create a light bootstrap theme for Bordeaux Metropole shiny apps.
#'
#' @param bg Character. Background color.
#' @param fg Character. Foreground color.
#' @param primary Character. Primary color.
#' @param secondary Character. Seconday color.
#' @param success Character. Success color.
#' @param info Character. Info color.
#' @param warning Character. Warning color.
#' @param danger Character. Danger color. Can be obtained with \code{bslib::\link{font_google}()}.
#' @param base_font Character. Base font. Can be obtained with \code{bslib::\link{font_google}()}.
#' @param heading_font Character. Heading font
#' @param ... Additional arguments of \code{bslib::\link{bs_add_variables}()}.
#'
#' @importFrom bslib bs_theme bs_add_variables font_google
#'
#' @return A bs_theme function.
#' @export
#'
theme_bdxmetro_shiny <- function(bg = "white",
                                 fg = "#292930",
                                 # Controls the accent (e.g., hyperlink, button, etc) colors
                                 primary = "#039ed2",
                                 secondary = "#fd79da",
                                 success = "#fd994e",
                                 info = "#fd5072",
                                 warning = "#5cadfd",
                                 danger = "#c4a5fd",
                                 base_font = font_google("Roboto"),
                                 heading_font = font_google("Roboto"),
                                 ...) {
  bs_theme(
    bg = bg,
    fg = fg,
    # Controls the accent (e.g., hyperlink, button, etc) colors
    primary = primary,
    secondary = secondary,
    success = success,
    info = info,
    warning = warning,
    danger = danger,
    base_font = base_font,
    heading_font = heading_font,
    "input-border-color" = primary,
    ...
  )

}


#' Create a dark bootstrap theme for Bordeaux Metropole shiny apps.
#'
#' @inheritParams theme_bdxmetro_shiny
#'
#' @importFrom bslib bs_theme bs_add_variables font_google
#'
#' @return A bs_theme function.
#' @export
#'
theme_bdxmetro_dark_shiny <- function(bg = "#101010",
                                      fg = "#ffffff",
                                      # Controls the accent (e.g., hyperlink, button, etc) colors
                                      primary = "#fd79da",
                                      secondary = "#039ed2",
                                      success = "#fd994e",
                                      info = "#fd5072",
                                      warning = "#5cadfd",
                                      danger = "#c4a5fd",
                                      base_font = font_google("Roboto"),
                                      heading_font = font_google("Roboto"),
                                      ...) {
  theme_bdxmetro_shiny(bg,
                       fg,
                       primary,
                       secondary,
                       success,
                       info,
                       warning,
                       danger,
                       base_font,
                       heading_font,
                       ...)

}


#' Insert a switch button light/dark mode.
#'
#' @param inputId Character. id of the input.
#' @param id Character. id of fluidPage or navbarPage.
#' @param page_type Character. Type of the page : "fluidpage" or "navbarpage".
#'
#' @importFrom shiny icon fluidRow div tags tagList
#' @importFrom glue glue
#'
#' @details Inspired from https://rstudio.github.io/bslib/articles/theming.html.
#'
#' @return A fluidPage object.
#' @export
switch_button_theme <- function(inputId, id = "dark_mode-page", page_type = "fluidpage") {

  if (!page_type %in% c("fluidpage", "navbarpage")) {
    stop("page_type argument of switch_button_theme() function should be either 'fluidpage' or 'navbarpage'")
  }

  if (page_type == "fluidpage") {
    style <- "float: right;"
  } else if (page_type == "navbarpage") {
    style <- "margin-left: auto;"
  }

  tagList(
        div(
          style = style,
          class = "custom-control custom-switch",
          tags$input(
            id = inputId,
            type = "checkbox",
            onclick = glue::glue(
              "Shiny.setInputValue('{inputId}', document.getElementById('{inputId}').value);"
            ),
            class = "custom-control-input",
            tags$label(icon("adjust"), `for` = inputId, class = "custom-control-label")
          )
        ),
    script_js(inputId, id)
    )

}

#' Add cookie in browser.
#'
#' @param name Character. Name of the cookie to add.
#' @param value Character. The value to set for the cookie.
#' @param session The `input` and `session` object from Shiny.
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @details Taken from https://github.com/ColinFay/glouton — code under MIT License.
#'
#' @export
#'
add_cookie <- function(name, value, session = NULL){

  if(is.null(session))
    session <- getDefaultReactiveDomain()

  session$sendCustomMessage("addcookie", list(
    name = name, value = value
  ))

}

#' Search for one cookie in the browser.
#'
#' @param name Character. Name of the cookie to fetch.
#' @param session The `input` and `session` object from Shiny.
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @details Taken from https://github.com/ColinFay/glouton — code under MIT License.
#'
#' @export
#'
fetch_cookie <- function(name, session = NULL){

  if(is.null(session))
    session <- getDefaultReactiveDomain()

  session$sendCustomMessage("fetchcookie", TRUE)

  return(session$input[["gloutoncookies"]])
}


#' Add glouton to your shiny app.
#'
#' @param online Boolean. TRUE fetch the online version of js-cookie through
#'     CDN. FALSE uses the file included in the package.
#'
#' @importFrom shiny addResourcePath tagList singleton tags
#'
#' @details Taken from https://github.com/ColinFay/glouton — code under MIT License.
#'
#' @export
use_glouton <- function(online = TRUE){

  addResourcePath(
    prefix = "inst",
    directoryPath	= system.file(package = "bdxmetroidentity")
  )
  if (online){
    cookie <- "https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"
  } else {
    cookie <- "inst/js.cookie.min.js"
  }
  tagList(
    singleton(
      tags$script(
        src = cookie
      ),
      tags$script(
        "import Cookies from 'https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js'"
      )
    ),
    singleton(
      tags$script(
        src = "inst/glouton.js"
      )
    )
  )

}


#' Init cookie for theme.
#'
#' @param input result of input switch button
#'
#' @return cookie inside browser
#' @export
#'
init_cookie_theme <- function(input){

  cookie <- fetch_cookie("theme")

  if(length(cookie) == 0){
    add_cookie("theme", input)
  }

}


#' Switch beetween dark and light theme.
#'
#' @param input Result of input switch button
#' @param session Session
#'
#' @export
#'
change_theme <- function(input, session = shiny::getDefaultReactiveDomain()){

  add_cookie("theme", input)

  session$setCurrentTheme(
    if (isTRUE(input)) {
      theme_bdxmetro_dark_shiny()
    } else {
      theme_bdxmetro_shiny()
    }
  )

}

#' Add external ressources and theme for fluidPage in shiny.
#'
#' @param id Character. id of fluidPage.
#' @param ... Additional arguments of \code{shiny::\link{fluidPage}()}.
#' @param input_id_button Character. id of the switch light/dark mode button.
#'
#' @importFrom shiny fluidPage
#'
#' @return fluidpage
#' @export
fluidpage_bdx <- function(..., id = "dark_mode-page", input_id_button = "dark_mode"){

  fluidPage(
    switch_button_theme(input_id_button, page_type = "fluidpage"), # Add light/dark switch button
    ...,
    id = id ,
    style = "display:none;",
    theme = theme_bdxmetro_shiny(),
    use_glouton()
  )

}


#' Add external ressources and theme for navbarPage in shiny.
#'
#' @param title Character. The title to display in the navbar.
#' @param ... Additional arguments of \code{shiny::\link{navbarPage}()}.
#' @param id Character. id of navbarPage
#' @param header Tag or list of tags to display as a common header above all tabPanels.
#' @param input_id_button Character. id of the switch light/dark mode button.
#'
#' @importFrom shiny navbarPage
#'
#' @return navbarpage
#' @export
navbarpage_bdx <- function(title, ..., id = "dark_mode-page", header = NULL, input_id_button = "dark_mode"){

  navbarPage(
    title = title,
    ...,
    id = id,
    theme = theme_bdxmetro_shiny(),
    header = list(
      switch_button_theme(input_id_button, page_type = "navbarpage"), # Add light/dark switch button
      header),
    tags$head(use_glouton())
  )

}

#' Js for switch button.
#'
#' @param id Character. id of fluidpage or navbarpage.
#' @param input Character. Name of input.
#'
#' @importFrom glue glue
#' @importFrom shiny tags
#'
#' @return tag script for switch button
#'
script_js <- function(input, id = "dark_mode-page"){

    tags$script(
      glue::glue(
        .open = '<',
        .close = '>',
        "$(document).on('shiny:sessioninitialized', function(event) {
         var res = Cookies.get('theme');
            if(res == 'true'){ $('#<input>').click()
                 Shiny.setInputValue('<input>', true)
            }else{
                Shiny.setInputValue('<input>', false)
            }

        setTimeout(function(){
          $('#<id>').css('display' , '')
          $('#<id>').trigger('show')
          $('#<id>').trigger('shown')}, 1000);

});"
      )
  )

}
