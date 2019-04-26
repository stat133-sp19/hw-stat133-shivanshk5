# Title: Private Checker functions
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Code creates all the required private checker functions for the binomial R package.
# Private checker functions include check_prob(), check_trials(), and check_success()

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

