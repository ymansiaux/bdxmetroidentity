## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE
)

## -----------------------------------------------------------------------------
library(bdxmetroidentity)

## ----eval=FALSE---------------------------------------------------------------
#  ui <- fluidpage_bdx(...)
#  ui <- navbarpage_bdx(...)

## ----eval=FALSE---------------------------------------------------------------
#  rv <- reactiveValues()
#  
#  rv$theme <- "light"
#  
#  observeEvent(session,{
#    init_cookie_theme(input$dark_mode)
#  }, once = TRUE)
#  
#  observeEvent(input$dark_mode,{
#  
#    change_theme(input$dark_mode)
#  
#    # theme to be used for the graphs
#    if (isTRUE(input$dark_mode)) {
#        rv$theme <- "dark"
#      } else {
#        rv$theme <- "light"
#      }
#  }, ignoreInit = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  my_ggplot2_plot <- ggplot(data = iris) +
#    aes(x = Sepal.Width, fill = Species) +
#    geom_density() +
#    scale_fill_bdxmetro_discrete()
#  
#  output$my_plot <- renderPlot({
#  
#    my_ggplot2_plot +
#      theme_bdxmetro(theme = rv$theme)
#  
#  })

## ----eval=FALSE---------------------------------------------------------------
#  output$my_logo <- renderUI({
#  
#      if (rv$theme == "light") {
#        tags$img(src = "datalab-logo-lightmode.png", width = "150px")
#      } else if (rv$theme == "dark") {
#        tags$img(src = "datalab-logo-darkmode.png", width = "150px")
#      }
#  
#  })

## ----eval=FALSE---------------------------------------------------------------
#  shiny::runApp(system.file("shiny", "shiny_template_fluidpage.R", package = "bdxmetroidentity"))

## ----echo=FALSE, out.width=1000, fig.align='center'---------------------------
knitr::include_graphics("figures/shiny_fluid_light1.png")
knitr::include_graphics("figures/shiny_fluid_light2.png")

## ----echo=FALSE, out.width=1000, fig.align='center'---------------------------
knitr::include_graphics("figures/shiny_fluid_dark1.png")
knitr::include_graphics("figures/shiny_fluid_dark2.png")

## ----eval=FALSE---------------------------------------------------------------
#  shiny::runApp(system.file("shiny", "shiny_template_navbarpage.R", package = "bdxmetroidentity"))

## ----echo=FALSE, out.width=1000, fig.align='center'---------------------------
knitr::include_graphics("figures/shiny_nav_light1.png")
knitr::include_graphics("figures/shiny_nav_light2.png")
knitr::include_graphics("figures/shiny_nav_light3.png")

## ----echo=FALSE, out.width=1000, fig.align='center'---------------------------
knitr::include_graphics("figures/shiny_nav_dark1.png")
knitr::include_graphics("figures/shiny_nav_dark2.png")
knitr::include_graphics("figures/shiny_nav_dark3.png")

