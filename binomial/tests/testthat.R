# Title: testthat R Script
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code loads required libraries for test functions on the loaded binomial package
#              Also call devtools to run the tests in the testthat folder

library(testthat)
library(binomial)

devtools::test()
