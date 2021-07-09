## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo=TRUE
)

## ----echo=FALSE, message=FALSE------------------------------------------------
library(tibble)
library(ggplot2)
# library(thinkridentity)

## ----out.width="50%", echo=FALSE----------------------------------------------
knitr::include_graphics("figures/functions_ggplot2_gouv.png")

## ----eval=FALSE---------------------------------------------------------------
#  library(gouvdown)     # chargement du package {gouvdown}
#  library(ggplot2)      # chargement du package {ggplot2}
#  
#  ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#    geom_point(size = 4) +
#    scale_color_gouv_discrete() +         # utilisation de la palette de couleurs de l'Etat français
#    theme_gouv()                          # utilisation du thème ggplot2 respectant la charte graphique de l'Etat français

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("figures/ggplot2_gouv.png")

## ----eval=FALSE---------------------------------------------------------------
#  library(bdxmetroidentity)     # chargement du package {bdxmetroidentity}
#  library(ggplot2)              # chargement du package {ggplot2}
#  
#  ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#    geom_point(size = 4) +
#    scale_color_bdxmetro_discrete() +         # utilisation de la palette de couleurs de Bordeaux Métropole
#    theme_bdxmetro()                          # utilisation du thème ggplot2 respectant la charte graphique de Bordeaux Métropole

## ----warning=FALSE, eval = FALSE----------------------------------------------
#  # Visualisation des palettes dédiées aux continuums
#  show_pal(cols = thinkr_pal("continuous")(20), show_text = FALSE)
#  show_pal(cols = thinkr_pal("continuous2")(20), show_text = FALSE)
#  # Visualisation de la palette dédiée aux valeurs discrètes
#  show_pal(cols = thinkr_pal("discrete")(20), show_text = FALSE)
#  # Visualisation de la palette dédiée aux valeurs divergentes
#  show_pal(cols = thinkr_pal("divergent")(20), show_text = FALSE)

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("figures/html_gouv_exemple.png")

## ----eval=FALSE---------------------------------------------------------------
#  rmarkdown::render(input = "contenu_rmd.Rmd", gouvdown::html_gouv())

## ----out.width="50%", echo=FALSE----------------------------------------------
knitr::include_graphics("figures/gouv_css.png")

## ----out.width="50%", echo=FALSE----------------------------------------------
knitr::include_graphics("figures/shiny_css.png")

## ----eval=FALSE---------------------------------------------------------------
#  addResourcePath("www", system.file("design_bdxmetro.css", package = "bdxmetroidentity")) # rend le .css accessible à l'app shiny
#  
#  tags$head(
#    tags$link(rel = "stylesheet", type = "text/css", href = "design_bdxmetro.css") # utilise le .css comme template
#  )

## ----eval=FALSE---------------------------------------------------------------
#  use_bdxmetro_css <- function() {
#  
#    tagList(
#      htmltools::htmlDependency(
#        name = "design_bdxmetro-css",
#        version = "...",
#        src = system.file("misc", package = "bdxmetroidentity")),
#      stylesheet = "design_bdxmetro.css"
#      )
#    )
#  
#  }
#  
#  # puis
#  ui <- function(request){
#    fluidPage(
#      use_bdxmetro_css(),
#      h2("Titre"),
#      tableOutput("table")
#    )
#  }

