\name{inventdummy}
\alias{invent.mxn}

\title{Functions to dummy datasets}

\description{
Functions to dummy data. 
}

\usage{
invent.mxn(m,n=5,d=1,p,f2="random")
}

\arguments{
 \item{m}{number of groups or samples}
 \item{n}{number of observations in each sample}
 \item{d}{digits for rounding the result}
 \item{p}{mean and sd for random or min and max for step}
 \item{f2}{select step or random}
}

\details{
Generates random or step  
 if(f2=="random") x[,i] <- rnorm(n,p[i,1],p[i,2]) 
 if(f2=="step")   x[,i] <- seq(p[i,1],p[i,2],(p[i,2]-p[i,1])/(n-1))

For one-way analysis, you can use function invent.mxn to generate different datasets and see how the results are less significant as you use means that are more similar and increase within sample standard deviation. For two-way analysis, you can use function invent.mxn to generate different datasets and see how the results are less significant as you cluster the groups and increase the "within" range.
}

\value{
 \item{x}{generated data as a matrix}
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
\code{\link{rnorm}}, \code{\link{matrix}}, \code{\link{aov}}, \code{\link{factor}}, \code{\link{boxplot}}
}

\examples{
m<-4; n<-5
p <- matrix(c(30,1,32,1,34,1,38,1),byrow=TRUE,ncol=2)
Xr <- invent.mxn(m,n,d=1,p,f2="random")
y <- c(Xr)
f <- factor(rep(LETTERS[1:m], rep(n,m)))
f.y <- data.frame(f, y)
boxplot(y~f, data=f.y,ylab="y", xlab="f")
summary(aov(y~f, data=f.y))
}

\keyword{datagen}
\keyword{univar}
