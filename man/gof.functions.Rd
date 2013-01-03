\name{GOF}

\alias{cdf.plot}
\alias{cdf.plot.gof}
\alias{chisq.gof.norm}

\title{Functions to explore and determine GOF}

\description{
Functions to explore and determine GOF. 
}

\usage{
cdf.plot(x)
cdf.plot.gof(x,dist="normal",mu=0,sd=1,rate=1,min=0,max=1,shape=1,scale=1)
chisq.gof.norm(x, nclass, param.est)
}
\arguments{
  \item{x}{data for one variable}
  \item{dist}{distribution}
  \item{mu}{mean for normal dist}
  \item{sd}{standard deviation for normal dist}
  \item{rate}{rate parameter for exponential dist}
  \item{min}{minimum for uniform dist}
  \item{max}{maximum for uniform dist}
  \item{shape}{shape parameter for Weibull dist}
  \item{scale}{scale parameter for Weibull dist}
  \item{nclass}{number of bins for chisquare test}
  \item{param.est}{number of estimated parameter (to calculate df)}
}

\details{
cdf.plot: Compare CDF empirical and theoretical for normal 
cdf.plot.gof: Compare CDF empirical and theoretical for Normal, Uniform, Exponential, and Weibull.
chisq.gof.norm: Determines GOF to a normal by Chisq
}

\value{
 \item{Fx.Emp}{CDF Empirical}
 \item{Fx.Theo}{CDF Theoretical}
 \item{Fx.Diff}{CDF Empirical minus CDF Theoretical}
 \item{X2}{Chisquare} 
 \item{df}{Degrees of freedom}
 \item{p.value}{p-value}
 \item{observed}{Observations in each class}
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
EDA functions \code{\link{eda6}}, ECDF stats \code{\link{ecdf}}, GOF tests \code{\link{ks.test}}, Shapiro test \code{\link{shapiro.test}}
}

\examples{
x <- rnorm(100)
cdf.plot(x)

x <- runif(100)
cdf.plot(x)

xn <- rnorm(20)
cdf.plot.gof(xn,dist="normal")
mtext(side=3,line=2,"Sample Normal, Hyp Normal",cex=0.7)

xu <- runif(20,0,1)
cdf.plot.gof(xu,dist="unif")
mtext(side=3,line=2,"Sample Unif, Hyp Unif",cex=0.7)

z <- rnorm(100)
chisq.gof.norm(z,4,0)

}
\keyword{htest}
\keyword{aplot}
