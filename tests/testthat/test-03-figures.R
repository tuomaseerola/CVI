# test-03-figures.R

fig1 <- CVI_visualise(CVI_item(data = FM))

test_that("Plot is created", {
  expect_s3_class(fig1,"ggplot")
})

