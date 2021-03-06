% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_popularity_bias.R
\name{evaluate_target_prediction_per_bin}
\alias{evaluate_target_prediction_per_bin}
\title{Evaluate target gene predictions for different bins/groups of targets genes}
\usage{
evaluate_target_prediction_per_bin(nbins,settings,ligand_target_matrix,ncitations,ligands_position = "cols")
}
\arguments{
\item{nbins}{The number of bins the target genes should be divided in based on popularity.}

\item{settings}{list of lists for which each sub-list contains the information about (expression) datasets; with minimally the following elements: name of the setting ($name), ligands (possibly) active in the setting of interest ($from).}

\item{ligand_target_matrix}{A matrix of ligand-target probabilty scores (or discrete target assignments).}

\item{ncitations}{A data frame denoting the number of times a gene is mentioned in the Pubmed literature. Should at least contain following variables: 'symbol' and 'ncitations'. Default: ncitations (variable contained in this package). See function \code{get_ncitations_genes} for a function that makes this data frame from current Pubmed information.}

\item{ligands_position}{Indicate whether the ligands in the ligand-target matrix are in the rows ("rows") or columns ("cols"). Default: "cols"}
}
\value{
A data.frame containing several classification evaluation metrics for target gene prediction. Predictions were evaluated for n different bins of target genes. The specific bin is indicated in the variable target_bin_id. target_bin_id = 1: target genes that are least mentioned in the Pubmed literature.
}
\description{
\code{evaluate_target_prediction_per_bin}: Evaluate target gene predictions for different bins/groups of targets genes. Bins are constructed such that genes that are similarly frequently cited are grouped together and the different bins have similar size.
}
\examples{
\dontrun{
library(dplyr)
weighted_networks = construct_weighted_networks(lr_network, sig_network, gr_network, source_weights_df)
settings = lapply(expression_settings_validation[1:10],convert_expression_settings_evaluation)
ligands = extract_ligands_from_settings(settings)
ligand_target_matrix = construct_ligand_target_matrix(weighted_networks, ligands)
# ncitations = get_ncitations_genes()
performances_target_bins_popularity = evaluate_target_prediction_per_bin(5,settings,ligand_target_matrix,ncitations)
}

}
