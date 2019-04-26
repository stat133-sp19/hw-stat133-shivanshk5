# Title: Context for Binomial Tests
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code includes tests from the "testthat" package for the binomial context.
#              Functions to check are bin_choose(), bin_probability(), bin_distribution(), bin_cumulative()

# bin_choose() function test
context("bin_choose")
test_that("bin_choose", {
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_error(bin_choose(3, 4))
})

# bin_probability() function test
context("bin_probability")
test_that("bin_probability", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45), 0.01075277)
  expect_error(bin_probability(3, 4, 1.2))
  expect_error(bin_probability(5, 4, 1.2))
  expect_error(bin_probability(3, 4.3, 1.2))
})

# bin_distribution() function test
context("bin_distribution")
test_that("bin_distribution", {
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[1,])) == c(0, 0.03125)))
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[2,])) == c(1, 0.15625)))
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[3,])) == c(2, 0.31250)))
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[4,])) == c(3, 0.31250)))
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[5,])) == c(4, 0.15625)))
  expect_true(all(as.numeric(as.vector(bin_distribution(trials = 5, prob = 0.5)[6,])) == c(5, 0.03125)))
})

# bin_cumulative() function test
context("bin_cumulative")
test_that("bin_cumulative", {
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[1,])) == c(0, 0.03125, 0.03125)))
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[2,])) == c(1, 0.15625, 0.18750)))
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[3,])) == c(2, 0.31250, 0.5)))
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[4,])) == c(3, 0.31250, 0.81250)))
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[5,])) == c(4, 0.15625, 0.96875)))
  expect_true(all(as.numeric(as.vector(bin_cumulative(trials = 5, prob = 0.5)[6,])) == c(5, 0.03125, 1)))
})
