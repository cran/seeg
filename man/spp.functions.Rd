\name{Spp}
\alias{scan.geoeas.ppp}
\alias{quad.chisq.ppp}
\alias{quad.poisson.ppp}
\alias{makeppp}
\alias{nnGK.ppp}
\alias{GKhat.env}
\alias{nnGKenv.ppp}
\alias{vario}
\alias{model.semivar.cov}
\alias{img.map}

\title{Spp Functions}

\description{
Functions for spatial analysis. 
}

\usage{
 scan.geoeas.ppp(filename) 
 quad.chisq.ppp(dataset,target.intensity)
 quad.poisson.ppp(dataset,target.intensity)
 makeppp(dataset)
 nnGK.ppp(dataset)
 GKhat.env(n, s, hat, stat, win)
 nnGKenv.ppp(dataset,nsim)
 vario(dataset, num.lags, type='isotropic', theta, dtheta, maxdist)
 model.semivar.cov(var, nlags, n0, c0, a)
 img.map(map)
}

\arguments{
  \item{filename}{name of file to scan; in format GeoEAS}
  \item{dataset}{data frame with point pattern; coordinates x,y and values}
  \item{target.intensity}{target density or intensity of points}
  \item{n}{number of points}
  \item{s}{number of random patterns for envelope}
  \item{hat}{Estimated values of statistic}
  \item{stat}{statistic "G" or "K"}
  \item{win}{window to generate random patterns}
  \item{nsim}{number of random patterns for envelope}
  \item{num.lags}{number of lag intervals}
  \item{type}{omnidirectional (isotropic) or directional variogram}
  \item{theta}{direction angle for directional variograms}
  \item{dtheta}{bandwidth for directional variograms}
  \item{maxdist}{maximum distance for variogram calculations}
  \item{var}{calculated variogram}
  \item{nlags}{number of lag intervals}
  \item{n0}{estimated nugget}
  \item{c0}{estimated sill}
  \item{a}{estimated range}
  \item{map}{matrix reprsenting a raster map}
}

\details{
Function scan.geoeas.ppp reads a GeoEAS file and makes a data frame. The GeoEAS format is from the U.S. EPA, Environmental Monitoring Systems Laboratory (Englund and Sparks, 1991). It includes point and grid specifications.

Function quad.chisq.ppp requires a point pattern and a target density. The function will define the number of cells in the grid based on the target intensity or density. Recall that chi-square requires 5 points per cell.

Function makeppp converts a dataframe into a ppp object.

Function nnGK.ppp uses makeppp, then calculates and plot Ghat, Khat and Lhat. It splits the screen such that we plot G on one top panel, and then divide the bottom panel in two to plot K and L side by side.

Function GKhat.env performs simulation of many random patterns and calculate the G and K metrics to determine an envelope (Kaluzny et al., 1996). The function will compute G or K for s Monte Carlo simulated random patterns generated with function runifpoint, then it plots the mean, low end and high end of the G or K for the simulated random pattern and compare to the empirical one.  In turn the function nnGKenv.ppp uses makeppp and allows the application of the GKhat.env to a given spatial pattern dataset. 

Function vario uses package sgeostat to analyze a marked pattern. Function vario( ) uses functions point( ) to generate a point object, plots it to visualize the point pattern, then uses command pair( ) to generate a point object and a pair object. The command pair ( ) requires us to define number of lags and the max dist. The pair object contains all pairs separated at each lag up to max distance. When applying command pair we can also decide the direction.
}
\value{
  \item{coord.var}{coordinates and values of variable}
  \item{pppset}{dataset as ppp object}
  \item{Xint}{number of points in each cell}
  \item{intensity}{grand mean of points per cell}
  \item{chisq}{Chisquare value; H0: pattern is not uniform}
  \item{p.value}{p-value; H0: pattern is not uniform}
  \item{num.cells}{number of cells in grid based on traget intensity}
  \item{df}{degrees of freedom}
  \item{dataset.v}{dataframe containing variogram}
  \item{img}{matrix from map transposed and arranged and ready to apply function image}

}
\references{
Acevedo M.F. 2013. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.

Englund, E., Sparks, A., 1991. GEO - EAS 1.2.1 GEOSTATISTICAL ENVIRONMENTAL ASSESSMENT SOFTWARE User's Guide. United States Environmental Protection Agency, Environmental Monitoring Systems Laboratory  Las Vegas NV 89193-3478.
}

\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}
\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013). The examples below require input files. 
}

\seealso{
convert to ppp object \code{\link{ppp}}, plot \code{\link{plot}},   plot \code{\link{plot}},   sgeostat \code{\link{point}}, \code{\link{pair}},
}
\examples{
\dontrun{

unif100xy <- scan.geoeas.ppp("lab8/unif100geoEAS.txt")
unif100ppp <- ppp(unif100xy$x, unif100xy$y)
plot(unif100ppp$x,unif100ppp$y, xlab="x",ylab="y")
title("uni100xy",cex.main=0.8) 

pois100xy <- scan.geoeas.ppp("lab8/pois100geoEAS.txt")
pois100ppp <- ppp(pois100xy$x, pois100xy$y)
plot(pois100ppp$x,pois100ppp$y, xlab="x",ylab="y")
title("pois100xy",cex.main=0.8) 

quad100 <- quad.chisq.ppp(unif100xy,5)
pois100 <- quad.poisson.ppp(pois100xy,0.2)

nnGK.ppp(pois100xy)

pppG.env <- GKhat.env(n=200, s=20, G.u, stat="G", win=owin(c(0,1),c(0,1)))
nnGKenv.ppp (pois100xy,nsim=100)

xyz <- scan.geoeas.ppp("lab8/xyz-geoEAS.txt")
xyz.v <- vario(xyz,num.lags=10,type='isotropic', maxdist=0.45)
m.xyz.v <- model.semivar.cov(var=xyz.v, nlags=10, n0=0, c0=0.42, a=0.17)
}
}

\keyword{htest}
\keyword{aplot}
\keyword{model}
