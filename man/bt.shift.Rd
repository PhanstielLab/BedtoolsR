% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bt.shift.R
\name{bt.shift}
\alias{bt.shift}
\title{Shift each feature by requested number of base pairs.}
\usage{
bt.shift(
  i,
  g,
  s = NULL,
  p = NULL,
  m = NULL,
  pct = NULL,
  header = NULL,
  output = NULL
)
}
\arguments{
\item{i}{<bed/gff/vcf>}

\item{g}{<genome>}

\item{s}{Shift the BED/GFF/VCF entry -s base pairs.
- (Integer) or (Float, e.g. 0.1) if used with -pct.}

\item{p}{Shift features on the + strand by -p base pairs.
- (Integer) or (Float, e.g. 0.1) if used with -pct.}

\item{m}{Shift features on the - strand by -m base pairs.
- (Integer) or (Float, e.g. 0.1) if used with -pct.}

\item{pct}{Define -s, -m and -p as a fraction of the feature's length.
E.g. if used on a 1000bp feature, -s 0.50, 
will shift the feature 500 bp "upstream".  Default = false.}

\item{header}{Print the header from the input file prior to results.}

\item{output}{Output filepath instead of returning output in R.}
}
\description{
Shift each feature by requested number of base pairs.
}
