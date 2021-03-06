% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shiny.R
\name{add_cookie}
\alias{add_cookie}
\title{Add cookie in browser.}
\usage{
add_cookie(name, value, session = NULL)
}
\arguments{
\item{name}{Character. Name of the cookie to add.}

\item{value}{Character. The value to set for the cookie.}

\item{session}{The `input` and `session` object from Shiny.}
}
\description{
Add cookie in browser.
}
\details{
Taken from https://github.com/ColinFay/glouton — code under MIT License.
}
