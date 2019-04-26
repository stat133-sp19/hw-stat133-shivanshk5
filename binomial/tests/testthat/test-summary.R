# Title: Context for Summary Measures Tests
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code includes tests from the "testthat" package for the summary measures context.
#              Functions to check are aux_mean(), aux_variance(), aux_mode(), aux_skewness(), aux_kurtosis()

# aux_mean() function test
context("aux_mean")
test_that("aux_mean", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(100, 0.5), 50)
  expect_equal(aux_mean(1, 0.1), 0.1)
})

# aux_variance() function test
context("aux_variance")
test_that("aux_variance", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(100, 0.5), 25)
  expect_equal(aux_variance(1, 0.1), 0.09)
})

# aux_mode() function test
context("aux_mode")
test_that("aux_mode", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(100, 0.5), 50)
  expect_equal(aux_mode(1, 0.1), 0)
})

# aux_skewness() function test
context("aux_skewness")
test_that("aux_skewness", {
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance=1e-7)
  expect_equal(aux_skewness(100, 0.5), 0)
  expect_equal(aux_skewness(1, 0.1), 2.6666667, tolerance=1e-7)
})

# aux_kurtosis() function test
context("aux_kurtosis")
test_that("aux_kurtosis", {
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance=1e-7)
  expect_equal(aux_kurtosis(100, 0.5), -0.02, tolerance=1e-7)
  expect_equal(aux_kurtosis(1, 0.1), 5.1111111, tolerance=1e-7)
})


