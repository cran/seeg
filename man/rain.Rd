\name{Rain}
\alias{poisson.rain}
\alias{semimarkov.rain}
\alias{semimarkov}

\title{Rain simulation}
\description{Rain simulation calculations by Marked Poisson process and Markov processes}

\usage{
poisson.rain(rate=1, ndays=30, shape=1, scale=1, plot.out=T)
semimarkov.rain(P, Hk, Ha, tsim)
semimarkov(P, Hk, Ha, tsim, xinit)
}

\arguments{
  \item{rate}{parameter: rate of exponential}
  \item{ndays}{number of days to simulate}
  \item{shape}{parameter: shape of weibull}
  \item{scale}{parameter: scale of weibull}
  \item{plot.out}{logical variable to decide whether to plot}
  \item{Ha}{rates of holding times}
  \item{Hk}{order of holding times}
  \item{tsim}{simulation time}
  \item{P}{Markov matrix}
  \item{xinit}{intial state} 
}

\details{
Simulate rainfall for every day of a month. A rainy or wet day is decided upon a Poisson process, and the mark would the amount of rain for that day if it is a wet day. The frequency distribution of rainfall in rainy days at a site determine the amount of rain, once a day is selected as wet. Daily rainfall distribution is skewed towards low values and it varies month to month according to climatic records. We generate rainfall amount using the Weibull distribution.
Function semimarkov simulates semi-Markov dynamics assuming Erlang densities for the holding times. It uses five arguments: the first three are the matrices and then the simulation time and initial state. It returns the state transitions, the holding times, and the simulation time. 
}

\value{
\item{y}{days in between rainy days, cumulative inter-event times, and amount of rain}
\item{z}{amount of rain in a day, matrix}
\item{x}{rainy day sequence}
\item{tau}{days in between rainy days}
\item{t}{time}
}

\references{
Acevedo M.F. 2013a. "Simulation of Ecological and Environmental Models". CRC Press.
Acevedo M.F. 2013b. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.
}
\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}

\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013a,b).
}

\seealso{
Weather functions of SEEM \code{\link[seem]{rain.day}},
\code{\link[seem]{markov.rain.seq}},
\code{\link[seem]{markov.rain}},
}

\examples{
#marked poisson simulation 
ndays= 30;rate=0.5;shape=0.7; scale=0.4
# define array
zp <- array()
rainy <- poisson.rain(rate,ndays,shape,scale,plot.out=FALSE)
zp <- rainy$z[,2]; nwet <- length(rainy$y[,3])

P <- matrix(c(0.4,0.2,0.6,0.8), ncol=2, byrow=TRUE)
Ha <- matrix(c(1,1,1,1), ncol=2, byrow=TRUE)
ndays=365
# exponential
Hk <- matrix(c(1,1,1,1), ncol=2, byrow=TRUE)
# erlang 2
Hk <- matrix(c(1,3,3,1), ncol=2, byrow=TRUE)
y <- semimarkov.rain(P, Hk, Ha, ndays)
hist(y$tau)

# semimarkov
P <- matrix(c(0.5,0.4,0.0,0.0, 0.0,0.0,0.9,0.5, 0.5,0.6,0.0,0.0, 0.0,0.0,0.1,0.5), ncol=4, byrow=TRUE)
Ha <- matrix(c(0.025,0.0154,0.0,0.0, 0.0,0.0,0.04,0.02, 0.025,0.0154,0.0,0.0, 0.0,0.0,0.04,0.02), ncol=4, byrow=TRUE)
Hk <- matrix(c(2,2,0.0,0.0, 0.0,0.0,2,2, 2,2,0.0,0.0, 0.0,0.0,2,2), ncol=4, byrow=TRUE)
nruns=4; y <- list()
for(i in 1:nruns)
y[[i]] <- semimarkov(P, Hk,Ha, tsim=1000, xinit=3)

\dontrun{
panel4(size=7)
for(i in 1:nruns)
plot(y[[i]]$t,y[[i]]$x,type="s",xlab="Years",ylab="State (Role)",ylim=c(1,4))

for(i in 1:nruns)
hist(y[[i]]$tau,xlab="Years",main="Hist of Holding time",cex.main=0.7)
}
}
\keyword{ math }
\keyword{ iteration }
