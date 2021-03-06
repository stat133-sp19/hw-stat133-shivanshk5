% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial_function.R
\name{bin_variance}
\alias{bin_variance}
\title{Binomial Variance Function}
\usage{
bin_variance(trials, prob)
}
\arguments{
\item{trials}{number of trials (numeric)}

\item{prob}{probability of getting a success in a trial (numeric)}
}
\value{
computed variance of binomial distribution based on parameter values (numeric)
}
\description{
returns the variance of binomial distribution
}
\examples{
bin_variance(10, 0.3)
}
