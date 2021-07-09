### Testing ggplot2 functions

# palettes ----

test_that("create_palette_bdxmetro() works", {

  palette_test <- create_palette_bdxmetro("continuous")(6)
  expect_equal(length(palette_test), 6)
  expect_equal(palette_test, c("#039ED2", "#15A7CC", "#28B0C7", "#3AB9C1", "#4DC2BC", "#60CCB7"))

})

test_that("show_palette_bdxmetro() works", {

  expect_is(show_palette_bdxmetro(create_palette_bdxmetro("continuous")(6)), "gg")

})

# scale functions ----

test_that("scale_color_bdxmetro_continuous() is a continuous scale function", {

  expect_is(scale_color_bdxmetro_continuous(), "ScaleContinuous")

})

test_that("scale_fill_bdxmetro_continuous() is a continuous scale function", {

  expect_is(scale_fill_bdxmetro_continuous(), "ScaleContinuous")

})

test_that("scale_color_bdxmetro_discrete() is a discrete scale function", {

  expect_is(scale_color_bdxmetro_discrete(), "ScaleDiscrete")

})

test_that("scale_fill_bdxmetro_discrete() is a discrete scale function", {

  expect_is(scale_fill_bdxmetro_discrete(), "ScaleDiscrete")

})

# themes ----

test_that("theme_bdxmetro_light() is a theme", {

  expect_is(theme_bdxmetro_light(), "theme")

})

test_that("theme_bdxmetro_dark() is a theme", {

  expect_is(theme_bdxmetro_dark(), "theme")

})
