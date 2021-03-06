% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_lollipop.R
\name{plot_lollipop}
\alias{plot_lollipop}
\title{Make gene lollipop plot}
\usage{
plot_lollipop(f.dat, f.gene = "UL54", global)
}
\arguments{
\item{f.dat}{resistance data frame from cmvdrg, where all_muts == F}

\item{f.gene}{Which gene to plot}

\item{global}{Package object for consistent runtime variables}
}
\value{
intermediate data.frame with genome level annotation
}
\description{
Produces figures for the web application.
Explores spatial location of mutations in resistance genes.
}
