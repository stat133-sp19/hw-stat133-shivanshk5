# Title: Private Auxiliary Functions for Summary Measures
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code creates all the required private auxiliary functions for summary measures for the binomial R package.
# Private auxiliary functions include aux_mean(), aux_variance(), aux_mode(), aux_skewness(), aux_kurtosis()

# PRIVATE AUXILIARY FUNCTIONS FOR SUMMARY MEASURES
# Title: Mean
# Private auxiliary function that returns expected mean of a binomial distribution
# Returns expected number of successes in n trials
# Inputs are trials and prob that represent number of trials and probability of success per trial respectively
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# Title: Variance
# Private auxiliary function that returns variance of a binomial distribution
# Inputs are trials and prob that represent number of trials and probability of success per trial respectively
aux_variance <- function(trials, prob) {
  return((trials * prob) * (1 - prob))
}

# Title: Mode
# Private auxiliary function that returns most likely number of success in n independent trials
# Returns mode of the binomial distribution (can be unique or can have 2 most likely numbers)
# Inputs are trials and prob that represent number of trials and probability of success per trial respectively
aux_mode <- function(trials, prob) {
  m <- trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m, m - 1))
  }
  return(as.integer(m))
}

# Title: Skewness
# Private auxiliary function that returns measure of the asymmetry of the probability distribution of a random variable about its mean
# Returns skewness of the binomial distribution (can be positive, negative, or undefined)
# Inputs are trials and prob that represent number of trials and probability of success per trial respectively
aux_skewness <- function(trials, prob) {
  return((1 - 2 * prob)/(sqrt(trials * prob * (1 - prob))))
}

# Title: Kurtosis
# Private auxiliary function that returns measure of the "tailedness" of the probability distribution of a random variable
# Returns kurtosis of the binomial distribution
# Inputs are trials and prob that represent number of trials and probability of success per trial respectively
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob))/(trials * prob * (1 - prob)))
}


