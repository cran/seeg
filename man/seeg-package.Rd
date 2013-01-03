\name{seeg-package}
\alias{seeg-package}
\alias{seeg}

\docType{package}

\title{Statistics for Environmental Science, Engineering, and Geography}

\description{Used in Acevedo (2013) for computer exercises}

\details{

\tabular{ll}{
Package: \tab seeg\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-01-02\cr
License: \tab GPL-2\cr
}
Package to perform data analysis integrating applications in Environmental Science, Engineering, and Geography.  
}

\author{
M.F. Acevedo <Acevedo@unt.edu>
}
\references{
Acevedo, M.F. 2013.  "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC press. 
}

\keyword{package}

\seealso{
package \code{\link{cdf.plot.gof}}, \code{\link{eda6}}, \code{\link{panel2}}, \code{\link{Okriging}}
}

\examples{
panel2(size=5)
x <- rnorm(100)
ts.plot(x)
acf(x)
}
