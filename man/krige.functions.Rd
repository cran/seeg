\name{Kriging}

\alias{Okriging}
\alias{plotkriged}
\alias{scan.map.ras}
\alias{make.variogram}

\title{Kriging Functions}

\description{
Functions for kriging. 
}

\usage{
Okriging(dataset, vario, step, maxdist, border.sw=FALSE, border.poly="none")
plotkriged(dataset, kriged, outpdf="dataset-kriged.pdf", border.sw=FALSE, border.poly="none")
scan.map.ras(filename)
make.variogram(nugget=0, sill = 1000, range = 1000)
}

\arguments{
  \item{dataset}{data frame with point pattern; columns 1 and 2 are x,y coordinates, 3 is variable}
  \item{vario}{variogram to use for kriging}
  \item{step}{step interval for prediction grid}
  \item{maxdist}{maximum distance for prediction}
  \item{border.sw}{logical to use border}
  \item{border.poly}{border polygon}
  \item{kriged}{kriged data}
  \item{outpdf}{output pdf filename}
  \item{filename}{name of file to scan}
  \item{nugget}{estimated nugget}
  \item{sill}{estimated sill}
  \item{range}{estimated range}
}

\details{
Okriging performs ordinary kriging on a grid. First, select a step for the grid for the prediction. Use minimum and maximum values in each axis to select a distance step. It uses function krige of sgeostat. Okriging produces a dataset of the kriged values of the variable (marks z) over the prediction grid together with the variance of the kriging error.

Function plotkriged produces two maps in a pdf file: 1) a raster image of the kriged values, superimposed on a contour map, and a plot of the original point pattern (measured points). 2) is the variance of the kriging error over the domain.
 
The function scan.map.ras is based on reading a file with format similar to GeoEAS and using image and contour commands applied to the transpose. When scanning, we take into account that the first row is the southernmost row and the last row is the northernmost row.  Each row goes from west to east. The input file contains values of one variable z, a header with a title, then number of columns and rows for the grid. Then it specifies the cell size. Then the file specifies the number of variables in the file, and labels for the measurements. After that, we have a stream of values. In general, we can have more than one variable and therefore each record can have more than one number.

Function make.variogram directly forces a model with selected parameter values.
}
\value{
  \item{x}{x coordinates of kriged data}
  \item{y}{y coordinates of kriged data}
  \item{zhat}{kriged values}
  \item{varhat}{variance of kriged values}
  \item{variab.ras}{variable raster map}
  \item{v.m.object}{variogram model}

}
\references{
Acevedo M.F. 2013. "Data Analysis and Statistics for Geography, Environmental Science, and Engineering", CRC Press.
}

\author{
Miguel F. Acevedo \email{Acevedo@unt.edu}
}
\note{
Input files are in 'datafiles.zip' in directory 'datafiles' and organized by chapters of Acevedo (2013). The examples below require input files.
}

\seealso{
convert to ppp object \code{\link{ppp}}, plot \code{\link{plot}},   plot \code{\link{plot}},   sgeostat \code{\link{point}}, \code{\link{pair}}, \code{\link{krige}},
}
\examples{
\dontrun{
xyz.ok <- Okriging(xyz, xyz.vsph, step=0.1, maxdist=0.25)
plotkriged(xyz, xyz.ok,outpdf="lab12/xyz-kriged.pdf")
test.ras <- scan.map.ras("lab12/grid30x30.txt")
xyz.vsph <- make.variogram(nugget=0, sill=160, range=0.1)}
}

\keyword{htest}
\keyword{aplot}
\keyword{model}
