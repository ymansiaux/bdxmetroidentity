## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE
)

## ----eval=FALSE---------------------------------------------------------------
#  if (requireNamespace("remotes")){install.packages("remotes")}
#  remotes::install_local(path = "chemin/vers/bdxmetroidentity.tar.gz",
#                         repos = "http://cran.rstudio.com",
#                         type = "source")

## ----eval=FALSE---------------------------------------------------------------
#  if (requireNamespace("remotes")){install.packages("remotes")}
#  # une fenetre s'ouvre et demande de pointer vers le package au format tar.gz
#  remotes::install_local(path = file.choose(),
#                         repos = "http://cran.rstudio.com",
#                         type = "source")

