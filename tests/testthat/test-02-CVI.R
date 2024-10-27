# test-02-CVI.R

Items <- CVI_item(data=FM)

test_that("Demo data has the correct number of rows", {
  expect_equal(nrow(Items),17)
})

test_that("Demo data has the correct mean S-CVI/Av value", {
  expect_equal(CVI_scale(Items),0.67201426)
})


