### Testing picto reading function

test_that("read_picto() works", {

  car_picto <- read_picto(name_picto = "mag_car")

  expect_is(car_picto, "Picture")

})
