\name{LDA}
\alias{lda2}

\title{LDA Two groups}

\description{
Functions for linear discriminant analysis between two groups of observations for a set of variables. 
}

\usage{
 lda2(X1,X2) 
}
\arguments{
  \item{X1}{Group 1 data matrix}
  \item{X2}{Group 2 data matrix}
}

\details{
The centroid scores Z1c, Z2c and individual scores Z1s, Z2s have been centered on Z0, which is the midpoint or average of the centroids.
Null hypothesis is that there are not significant differences between the two groups.

Using the individual scores and the centroid scores, the function also produces a plot, which displays the difference between the groups in two different manners. The one at the top panel uses markers and the two below use histograms. It indicates whther tere is overlap in observations along the score axis and potential differences between the centroids.
}

\value{
\item{m.n1.n2}{m.n1.n2}
\item{G1}{sample mean of X1}
\item{G2}{sample mean of X2}
\item{S1}{covariance matrix of X1}
\item{S2}{covariance matrix of X2}
\item{Sp}{pooled variance matrix}
\item{Spinv}{inverse of pooled variance matrix}
\item{A}{matrix of coefficients}
\item{Z1c.Z2c}{scores of centroids for group 1 and group 2}
\item{D2.F.p.value}{Mahalanobis distance, F statistic, and p-value}
\item{Z1s}{scores for individual observations of group 1}
\item{Z2s}{scores for individual observations of group 2}

}
\references{
Acevedo M.F. 2013. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.
}
\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}
\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013). The example below requires an input file. 
}

\seealso{
 mda package \code{\link{lda}}     
}
\examples{
\dontrun{
X1X2 <- read.csv("lab10/X1X2.csv",header=T)
X1 <- as.matrix(X1X2[,1:3]); X2 <- as.matrix(X1X2[,4:6])
X.lda2 <- lda2(X1,X2)
}
}

\keyword{htest}
\keyword{aplot}
\keyword{multivariate}
