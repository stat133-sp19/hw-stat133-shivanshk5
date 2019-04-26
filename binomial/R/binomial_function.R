# Title: Binomial Package Functions
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code creates all the required private checker functions, private auxiliary functions for summary measures, and main function and methods for the binomial R package.
# Private checker functions include check_prob(), check_trials(), and check_success()
# Private auxiliary functions include aux_mean(), aux_variance(), aux_mode(), aux_skewness(), aux_kurtosis()
# Main functions include bin_choose(), bin_probability(), bin_distribution() and plot.bindis(), bin_cumulative() and plot.bincum(), bin_var() and print.binvar() and summary.binvar() and print.summary.binvar()
#                        bin_mean(), bin_variance(), bin_mode(), bin_skewness(), bin_kurtosis()


# Loading required libraries
library(ggplot2)

# PRIVATE CHECKER FUNCTIONS
# Title: Probability Checker
# Private auxiliary function to test if input prob is valid probability value
# Input prob is a probability value (valid if numeric value between 0 and 1)
# Returns TRUE if valid
check_prob <- function(prob) {
  if (class(prob) != "numeric" | prob < 0 | prob > 1 | length(prob) != 1) {
    stop("probability has to be a number between 0 and 1")
  }
  return(TRUE)
}

# Title: Trials Checker
# Private auxiliary function to test if input trials is valid value for number of trials
# Input trials is number of trials (valid if number of trials is a non-negative integer)
# Returns TRUE if valid
check_trials <- function(trials) {
  if (trials %% 1 != 0 | trials < 0 | length(trials) != 1) {
    stop("invalid trials value")
  }
  return(TRUE)
}

# Title: Success Checker
# Private auxiliary function to test if input is valid value for number of successes
# Inputs are success and trials that represent number of successes and trials respectively
# Valid if sucess is vector of non-negative integers
# Returns TRUE if valid
check_success <- function(success, trials) {
  check_trials(trials)
  if (length(success) > trials) {
    stop('success cannot be greater than trials')
  }
  if (length(success) == 0 & class(success) == "numeric") {
    return(TRUE)
  }
  for (i in 1:length(success)) {
    if(success[i] %% 1 != 0 | success[i] < 0 | success[i] > trials) {
      stop("invalid success value")
    }
  }
  return(TRUE)
}
# Test for decimal, larger length vector, string, and valid


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


# MAIN FUNCTIONS
#' @title Binomial Choose Function
#' @description Computes the number of combinations in which k successes can occur in n trials
#' @param n number of trials (numeric)
#' @param k number of successes (numeric)
#' @return computed number of combinations in which k successes can occur in n trials (numeric)
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if (k > n) {
    stop("k cannot be greater than n")
  }
  return(factorial(n)/(factorial(k) * factorial(n - k)))
}

#' @title Binomial Probability Function
#' @description Computes the probability of getting k successes in n trials with prob of success p
#' @param success number of successes (numeric)
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed probability of getting number of success in number of trials with prob of success prob (numeric)
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  check_prob(prob)
  check_trials(trials)
  check_success(success, trials)
  vals <- c()
  for (i in 1:length(success)) {
    vals[i] <- bin_choose(trials, success[i]) * prob^success * (1-prob)^(trials - success)
  }
  return(vals)
}

#' @title Binomial Distribution Function
#' @description Creates a binomial distribution data frame using the binomial probability function with successes and probabilities as columns
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed binomial distribution data frame with classes ("bindis" and "data.frame")
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- c()
  for(i in 0:trials) {
    probability[i + 1] <- bin_probability(i, trials, prob)
  }
  df <- data.frame(success, probability)
  class(df) <- c("bindis", "data.frame")
  return(df)
}

# Graphs barplot to display probability histogram of binomial distribution object "bindis"
#' @export
#' @examples
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
plot.bindis <- function(x) {
  ggplot(data=x, aes(x=success, y=probability)) +
    ggtitle("Barplot of Probability Histogram") +
    xlab("successes") +
    geom_col(fill="steelblue") +
    theme_minimal() +
    scale_x_continuous(breaks=seq(0, nrow(x), 1))
}

#' @title Binomial Cumulative Function
#' @description Creates a binomial distribution data frame using the binomial probability function with successes, probabilities, and cumulative probabilities as columns
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed binomial distribution data frame with classes ("bincum" and "data.frame")
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob) {
  success <- 0:trials
  probability <- c()
  cumulative <- c()
  for(i in 0:trials) {
    probability[i + 1] <- bin_probability(i, trials, prob)
    if (length(cumulative) == 0) {
      cumulative[1] = probability[1]
    } else {
      cumulative[i + 1] <- cumulative[i] + probability[i + 1]
    }
  }
  df <- data.frame(success, probability, cumulative)
  class(df) <- c("bincum", "data.frame")
  return(df)
}

# Graphs the cumulative distribution of binomial distribution object "bincum"
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis1)
plot.bincum <- function(x) {
  ggplot(data=x, aes(x=success, y=cumulative)) +
    ggtitle("Cumulative Distribution Plot") +
    ylab("probability") +
    xlab("successes") +
    geom_line() +
    geom_point() +
    theme_minimal() +
    scale_x_continuous(breaks=seq(0, nrow(x), 1))
}

#' @title Binomial Random Variable Function
#' @description Returns an object of class "binvar"that is a binomial random variable object.
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return object of class binvar that is a binomial random variable object ("binvar")
#' @export
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bin_var <- c(trials, prob)
  class(bin_var) <- c("binvar")
  return(bin_var)
}

# Print the binvar object
#' @export
#' @example
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1
print.binvar <- function(x){
  cat('"Binomial variable"')
  cat("\n")
  cat("\n")
  cat("Parameters")
  cat("\n")
  cat("- number of trials: ", x[1])
  cat("\n")
  cat("- prob of success: ", x[2])
}

# Full summary description of an object "binvar"
#' @export
#' @example
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' summary(bin1)
summary.binvar <- function(x) {
  trialsbin <- x[1]
  probbin <- x[2]
  sum_vec <- c(trialsbin, probbin, aux_mean(trialsbin, probbin), aux_variance(trialsbin, probbin), aux_mode(trialsbin, probbin), aux_skewness(trialsbin, probbin), aux_kurtosis(trialsbin, probbin))
  names(sum_vec) <- c("trials", "prob", "mean", "variance", "mode", "skewness", "kurtosis")
  class(sum_vec) <- c("summary.binvar")
  return(sum_vec)
}

# Print the summary.binvar object
#' @export
#' @example
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1
print.summary.binvar <- function(x){
  cat('"Summary Binomial"')
  cat("\n")
  cat("\n")
  cat("Parameters")
  cat("\n")
  cat("- number of trials: ", x[1])
  cat("\n")
  cat("- prob of success: ", x[2])
  cat("\n")
  cat("\n")
  cat("Measures")
  cat("\n")
  cat("- mean    : ", x[3])
  cat("\n")
  cat("- variance: ", x[4])
  cat("\n")
  cat("- mode    : ", x[5])
  cat("\n")
  cat("- skewness: ", x[6])
  cat("\n")
  cat("- kurtosis: ", x[7])
}


# FUNCTIONS OF MEASURES
#' @title Binomial Mean Function
#' @description returns the mean of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed mean of binomial distribution based on parameter values (numeric)
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance Function
#' @description returns the variance of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed variance of binomial distribution based on parameter values (numeric)
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode Function
#' @description returns the mode of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed mode of binomial distribution based on parameter values (numeric)
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness Function
#' @description returns the skewness of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed skewness of binomial distribution based on parameter values (numeric)
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis Function
#' @description returns the kurtosis of binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of getting a success in a trial (numeric)
#' @return computed kurtosis of binomial distribution based on parameter values (numeric)
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}
