\name{ConfInt}
\alias{conf.int.lm}

\title{Conf Int Functions}

\description{
Functions to obtain confidence interval for a regression. 
}

\usage{
 conf.int.lm(dat.lm, alpha) 
}
\arguments{
  \item{dat.lm}{data frame used for regression}
  \item{alpha}{alpha or error type I}
}

\details{
Calculates and plots the confidence intervals for a regression (Follows MathSoft 1999, pages 7-26 to 7-29). 
}
\value{
  \item{lower}{lower value of confidence interval}
  \item{upper}{upper value of confidence interval}
}
\references{
Acevedo M.F. 2013. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.
MathSoft, 1999. S-PLUS 2000 Guide to Statistics Volume 1 and Volume 2.
}
\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}
\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013). The example below requires an input file. 
}

\seealso{
linear regression \code{\link{lm}}, plots \code{\link{plot}}     
}
\examples{
\dontrun{
light.depth <- read.table(file="lab6/light-depth.csv",sep=",",header=TRUE)
attach(light.depth)
light.lm <- lm(Light ~ Depth) 
par(mfrow=c(2,1))
plot(Depth, Light)    
abline(light.lm$coef)
conf.int.lm(light.lm, 0.05)
}
}

\keyword{htest}
\keyword{aplot}
\keyword{model}
