\name{EDA}
\alias{eda6}

\title{EDA Functions}

\description{
Functions for EDA. 
}

\usage{
eda6(x,label="x")
}
\arguments{
  \item{x}{data for one variable}
  \item{label}{label for plots}
}

\details{
Produces six plots on one graphics window: Index plot, box-whisker plot, histogram, density approx to histogram, quantile-quantile plot (using function qqPlot of package car), and empirical cumulative plot.

}
\value{
No value returned. Produces plots on graphics windows.
}
\references{
Acevedo M.F. 2013. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.
}
\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}
\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013). 
}

\seealso{
panel functions \code{\link{panel6}}, plots \code{\link{plot}}, \code{\link{boxplot}}, \code{\link{hist}}, \code{\link{density}}, \code{\link{qqPlot}},\code{\link{ecdf}}     
}
\examples{
x <- rnorm(100)
eda6(x)
}

\keyword{htest}
\keyword{aplot}
