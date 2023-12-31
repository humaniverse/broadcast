% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{append_broadcast}
\alias{append_broadcast}
\title{Append the Broadcast Folder to a File}
\usage{
append_broadcast(file_name)
}
\arguments{
\item{file_name}{The name of the file to which the broadcast folder will be
appended.}
}
\value{
None, this function is called for its side effects.
}
\description{
This internal function appends the broadcast folder \code{.broadcast} to the end
of the specified file. It's used within the package and is not intended to be
called by the end user.
}
\examples{
\dontrun{
append_broadcast("path/to/file.txt")
}
}
\keyword{internal}
