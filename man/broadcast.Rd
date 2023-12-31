% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/broadcast.R
\name{broadcast}
\alias{broadcast}
\title{Broadcast .rda Files from One Directory to .csv Files in Another}
\usage{
broadcast(from = "data")
}
\arguments{
\item{from}{A string. The path to the directory from which .rda files are
from. Defaults to "data".}
}
\value{
Invisible. The function doesn't return any value, but it performs the
moving of .rda files and displays a progress bar.
}
\description{
This function moves .rda files from one directory (the \code{from} directory) to
.csv files in another directory called \code{.broadcast}. It checks if .rda files
exist in the \code{from} directory, and creates the \code{to} directory if it does not
exist. A progress bar is displayed during the operation.
}
\examples{
\dontrun{
# Broadcast .rda files from the "data" directory to the ".broadcast"
# directory
broadcast(from = "data")
}

}
