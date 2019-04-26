# Title: Context for Checkers Tests
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code includes tests from the "testthat" package for the binomial context.
#              Functions to check are check_prob(), check_trials(), check_success()


# check_prob() function test
# Expectation 1 test: prob is a number between 0 and 1
# Expectation 2 test: prob is of length 1
# Expectation 3 test: getting error if prob is invalid


context("check_prob")

# Expectation 1
test_that("expectation1_prob", {
  expect_true(check_prob(0.5))
  expect_error(check_prob(-0.5))
  expect_error(check_prob(1.5))
})

# Expectation 2
test_that("expectation2_prob", {
  expect_true(check_prob(0.5))
  expect_error(check_prob(-0.5))
  expect_error(check_prob(c(0.4, 0.3)))
})

# Expectation 3
test_that("expectation3_prob", {
  expect_error(check_prob("0.5"))
  expect_error(check_prob(4))
  expect_error(check_prob(-1.5))
})


# check_trials() function test
# Expectation 1 test: trials is a positive integer
# Expectation 2 test: trials is of length 1
# Expectation 3 test: getting error if trials is invalid
context("check_trials")

# Expectation 1
test_that("expectation1_trials", {
  expect_true(check_trials(5))
  expect_error(check_trials(5.5))
  expect_error(check_trials(-4))
})

# Expectation 2
test_that("expectation2_trials", {
  expect_true(check_trials(0))
  expect_error(check_trials(c(-5, 7)))
  expect_error(check_trials(c(4, 3)))
})

# Expectation 3
test_that("expectation3_trials", {
  expect_error(check_trials("6"))
  expect_error(check_trials(4.7))
  expect_error(check_trials(-1.5))
})

# check_success() function test
# Expectation 1 test: success length is less than number of trials
# Expectation 2 test: success values are in range from 0 to number of trails
# Expectation 3 test: getting error if success is invalid
context("check_success")

# Expectation 1
test_that("expectation1_success", {
  expect_true(check_success(c(1, 2), 4))
  expect_true(check_success(c(1, 2), 2))
  expect_error(check_success(c(1, 2, 3, 4), 3))
})

# Expectation 2
test_that("expectation2_success", {
  expect_true(check_success(c(0, 3, 6), 7))
  expect_error(check_success(c(0, 3), 2))
  expect_error(check_success(c(4, 3), 3))
})

# Expectation 3
test_that("expectation3_success", {
  expect_error(check_success("6", 5))
  expect_error(check_success(c(1), 4.7))
  expect_error(check_success(c(1, 2), c(3, 4)))
})

