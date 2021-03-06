% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/discretize_gene_supervised.R
\name{discretize_gene_supervised}
\alias{discretize_gene_supervised}
\title{discretize_gene_supervised}
\usage{
discretize_gene_supervised(gene, target, output = "discretized_vector",
  discs = list_of_discs, vw_params = c(0.25, 0.5, 0.75),
  kmeans_centers = c(2, 3, 4), sd_alpha = c(0.75, 1, 1.25))
}
\arguments{
\item{gene}{A previously normalized gene expression vector}

\item{target}{A series of labels matching each of the values in the gene vector}

\item{vw_params}{cuttof parameters for the varying width function. Defaults to 0.25, 0.5 and 0.75}

\item{kmeans_centers}{Numeric vector with the number of centers to use for kmeans. Defaults to 2, 3 and 4}

\item{sd_alpha}{Parameter for adusting the 'medium' level of the mean +- sd discretization. Defaults to sd_alpha = c(0.75, 1, 1.25))}
}
\value{
A data frame with the discretized features in the same order as previously
}
\description{
Uses several discretizations and selects the one that is best for a given variable (gene)
in comparison to a target class by equivocation
}
\examples{
data(scDengue)
exprs <- as.data.frame(SummarizedExperiment::assay(scDengue, 'logcounts'))
gene <- exprs['ENSG00000166825',]
infection <- SummarizedExperiment::colData(scDengue)
target <- infection$infection
discrete_expression <- as.data.frame(discretize_gene_supervised(gene, target))
table(discrete_expression)
}
