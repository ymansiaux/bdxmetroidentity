### Testing Rmd reports functions

# Inspired by mitchell O'Hara-Wild vitae package : https://github.com/mitchelloharawild/vitae/blob/master/tests/testthat/test-template.R
# and spyrales gouvdown package : https://github.com/spyrales/gouvdown/blob/master/tests/testthat/test-rmarkdown.R.

library(emo)
library(DT)

browseURL(system.file("rmarkdown", "rmd_template_vignette_light.html", package = "bdxmetroidentity"))

expect_render <- function(template, FUN){

  render_dir <- tempfile()

  dir.create(render_dir)
  dir.create(file.path(render_dir, "www"))

  file.copy(system.file("rmarkdown", template, package = "bdxmetroidentity"), render_dir)

  file <- file.path(render_dir, template)

  expect_output(
    expect_message(
      rmarkdown::render(
        input = file,
        output_format = FUN,
        output_dir = render_dir),
      "Output created"),
    "pandoc")

}

test_that("html_document_bdxmetro() works", {

  expect_render(template = "rmd_template_light.Rmd", FUN = bdxmetroidentity::html_document_bdxmetro(theme = "light"))

  expect_render(template = "rmd_template_dark.Rmd", FUN = bdxmetroidentity::html_document_bdxmetro(theme = "dark"))

})

test_that("html_vignette_bdxmetro() works", {

  expect_render(template = "rmd_template_vignette_light.Rmd", FUN = bdxmetroidentity::html_vignette_bdxmetro(theme = "light"))

})
