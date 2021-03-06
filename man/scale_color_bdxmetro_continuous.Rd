% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graphs.R
\name{scale_color_bdxmetro_continuous}
\alias{scale_color_bdxmetro_continuous}
\title{Continuous color scale constructor for Bordeaux Metropole colors.}
\usage{
scale_color_bdxmetro_continuous(
  name_palette = "continuous",
  reverse = FALSE,
  ...
)
}
\arguments{
\item{name_palette}{Character. Name of the palette. Should be one of "continous", "continous2", "divergent" or "divergent2".}

\item{reverse}{Boolean. Indicates whether the palette should be reversed or not. Default is FALSE.}

\item{...}{Additional arguments to pass to scale_color_gradientn().}
}
\value{
A scale function.
}
\description{
Continuous color scale constructor for Bordeaux Metropole colors.
}
\examples{
library(ggplot2)
ggplot(data = iris) +
  aes(x = Sepal.Width, y = Sepal.Length, color = Sepal.Length) +
  geom_point() +
  scale_color_bdxmetro_continuous()
}
