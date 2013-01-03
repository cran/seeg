\name{Panels}
\alias{panel2}
\alias{panel4}
\alias{panel6}
\alias{panel3}

\title{Functions to compose panels on one screen}

\description{
Functions to divide the panel in various arrangements, for example 2, 3, 4, and 6 panels.
}

\usage{
panel2(size,int="r")
panel4(size,int="r")
panel6(size,int="r")
panel3(size,int="r")
}

\arguments{
  \item{size}{size of graphics window}
  \item{int}{to set xaxs,yaxs graphics arguments, "r" or "i"} 
}

\details{
These functions use layout function. It allows dividing the graphics window in panels. It is customized to use the space more efficiently by reducing the margins of each plot.
}

\value{
No values returned. Functions just arrange the graphics window.
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
EDA functions \code{\link{eda6}}, graphics \code{\link{layout}}, graphics par \code{\link{par}}
}

\examples{
panel2(size=5)
x <- rnorm(100)
ts.plot(x)
acf(x)
}

\keyword{device}
\keyword{aplot}
