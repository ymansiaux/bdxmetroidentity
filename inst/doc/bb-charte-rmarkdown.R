## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE
)

## -----------------------------------------------------------------------------
library(bdxmetroidentity)

## ----echo=FALSE---------------------------------------------------------------
message("********************************************************************************************************")
  message("You want to integrate a logo in the header of your report?")
  message("If yes, you must modify the title section of the .Rmd report header by copying/pasting the following content:")
  message('title: |
    ![](`r system.file("logo", "datalab-logo.png", package = "bdxmetroidentity")`){width=250px style="display: block; margin-bottom: 50px"}
    Report title')
  message("Do not forget to change 'Report title'")
  message("********************************************************************************************************")

## ----eval=FALSE---------------------------------------------------------------
#  # Store in temp file for the example
#  rmddir <- tempfile(pattern = "rmd-")
#  dir.create(rmddir)
#  
#  # Knit
#  rmarkdown::render(input = system.file("rmarkdown", "rmd_template_light.Rmd", package = "bdxmetroidentity"),
#                    output_format = html_document_bdxmetro(theme = "light"),
#                    output_dir = rmddir)
#  
#  # Open the knitted example
#  browseURL(file.path(rmddir, "rmd_template_light.html"))

## ----echo=FALSE, out.width=600, fig.align='center'----------------------------
knitr::include_graphics("figures/rmd_light.jpeg")

## ----eval=FALSE---------------------------------------------------------------
#  # Store in temp file for the example
#  rmddir <- tempfile(pattern = "rmd-")
#  dir.create(rmddir)
#  
#  # Knit
#  rmarkdown::render(input = system.file("rmarkdown", "rmd_template_dark.Rmd", package = "bdxmetroidentity"),
#                    output_format = html_document_bdxmetro(theme = "dark"),
#                    output_dir = rmddir)
#  
#  # Open the knitted example
#  browseURL(file.path(rmddir, "rmd_template_dark.html"))

## ----echo=FALSE, out.width=600, fig.align='center'----------------------------
knitr::include_graphics("figures/rmd_dark.jpeg")

## ----eval=FALSE---------------------------------------------------------------
#  # Store in temp file for the example
#  rmddir <- tempfile(pattern = "rmd-")
#  dir.create(rmddir)
#  
#  # Knit
#  rmarkdown::render(input = system.file("rmarkdown", "rmd_template_vignette_light.Rmd", package = "bdxmetroidentity"),
#                    output_format = html_vignette_bdxmetro(theme = "light"),
#                    output_dir = rmddir)
#  
#  # Open the knitted example
#  browseURL(file.path(rmddir, "rmd_template_vignette_light.html"))

