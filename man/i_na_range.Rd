% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/missing.R
\name{i_na_range}
\alias{i_na_range}
\title{define missing range}
\usage{
i_na_range(x, values)
}
\arguments{
\item{x}{vector}

\item{values}{vector with missing range e.g. c(-9:-1) or NULL (NULL will remove all missing values)}
}
\value{
Returns x with missing range set
}
\description{
define which values will be handled as missing values
}
