### Testing Roboto loading function

test_that("Roboto font loading works", {

  load_roboto_font()
  available_fonts <- extrafont::fonts()
  available_roboto_fonts <- available_fonts[stringr::str_detect(available_fonts, "Roboto")]

  expect_true(any(available_roboto_fonts == "Roboto"))
  expect_true(any(available_roboto_fonts == "Roboto Thin"))
  expect_true(any(available_roboto_fonts == "Roboto Light"))

})
