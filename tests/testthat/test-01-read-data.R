# test-01-read-data.R
test_that("Check that demo data is read properly", {
  expect_s3_class(FM,"data.frame")
})

test_that("Check that demo data has the correct dimensions", {
  expect_equal(dim(FM),c(255,3))
})
