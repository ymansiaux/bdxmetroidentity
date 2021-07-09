## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE
)

## -----------------------------------------------------------------------------
library(bdxmetroidentity)

## ----fig.align='center'-------------------------------------------------------
car_picto <- read_picto(name_picto = "mag_car")
grImport2::grid.picture(picture = car_picto)

## ----echo=FALSE---------------------------------------------------------------
stringr::str_replace_all(list.files(system.file("picto", package = "bdxmetroidentity")), ".svg", "") %>% 
  tibble::as_tibble() %>% 
  dplyr::rename("Nom" = value)

