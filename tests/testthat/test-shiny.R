### Testing shiny functions

test_that("Shiny themes works", {

  expect_true(inherits(theme_bdxmetro_shiny(), "bs_theme"))

  expect_true(inherits(theme_bdxmetro_dark_shiny(), "bs_theme"))

})


test_that("Pages", {

  expect_true(inherits(fluidpage_bdx(), "shiny.tag.list"))
  expect_true(inherits(navbarpage_bdx(title = "test"), "shiny.tag.list"))

  expect_true(grepl(pattern = "dark_mode", fluidpage_bdx()))
  expect_true(grepl(pattern = "dark_mode-page", fluidpage_bdx()))

  expect_true(grepl(pattern = "dark_mode", navbarpage_bdx(title = "test")))
  expect_true(grepl(pattern = "dark_mode-page", navbarpage_bdx(title = "test")))

  expect_true(inherits(switch_button_theme("dark_mode"), "shiny.tag.list"))
  expect_true(inherits(script_js("dark_mode"), "shiny.tag"))

})
