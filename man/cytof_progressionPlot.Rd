% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cytof_postProcess.R
\name{cytof_progressionPlot}
\alias{cytof_progressionPlot}
\title{Progression plot}
\usage{
cytof_progressionPlot(data, markers, clusters, orderCol = "isomap_1",
  clusterCol = "cluster", reverseOrder = FALSE, addClusterLabel = TRUE,
  clusterLabelSize = 5, segmentSize = 0.5, min_expr = NULL,
  trend_formula = "expression ~ sm.ns(Pseudotime, df=3)")
}
\arguments{
\item{data}{The data frame for progression plot.}

\item{markers}{The column names of the selected markers for visualization.}

\item{clusters}{Select clusters for plotting, default selects all.}

\item{orderCol}{The column name of the estimated cell progression order.}

\item{clusterCol}{The column name of the cluster results.}

\item{reverseOrder}{If \verb{TRUE}, reverse the value of orderCol.}

\item{addClusterLabel}{If \verb{TRUE}, add the cluster label on the plot.}

\item{clusterLabelSize}{Size of the cluster label.}

\item{segmentSize}{Size of the cluster label arrow.}

\item{min_expr}{The threshold of the minimal expression value for markers.}

\item{trend_formula}{A symbolic description of the model to be fit.}
}
\value{
A ggplot2 object
}
\description{
Plot the expression trend along the estimated cell progressing order
}
\examples{
m1 <- c(rnorm(300, 10, 2), rnorm(400, 4, 2), rnorm(300, 7))
m2 <- c(rnorm(300, 4), rnorm(400, 16), rnorm(300, 10, 3))
m3 <- c(rnorm(300, 16), rnorm(400, 40, 3), rnorm(300, 10))
m4 <- c(rnorm(300, 7, 3), rnorm(400, 30, 2), rnorm(300, 10))
m5 <- c(rnorm(300, 27), rnorm(400, 40, 1),rnorm(300, 10))
c <- c(rep(1,300), rep(2,400), rep(3,300))
rnames <- paste(paste('sample_', c('A','B','C','D'), sep = ''), 
rep(1:250,each = 4), sep='_') 
exprs_cluster <- data.frame(cluster = c, m1 = m1, m2 = m2, m3 = m3, m4 = m4, isomap_1 = m5)
row.names(exprs_cluster) <- sample(rnames, 1000)
cytof_progressionPlot(exprs_cluster, markers = c("m1","m2","m3","m4"))
}
