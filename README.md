
<!-- README.md is generated from README.Rmd. Please edit that file -->

# seqfinder

<!-- badges: start -->
<!-- badges: end -->

The goal of seqfinder is to …

## Installation

You can install the development version of seqfinder like so:

``` r
# install.packages("devtools")
devtools::install_github("yueliu1115/seqfinder")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(seqfinder)
## basic example code
```

    # get fasta by id from fasta file
    get_fa_by_id(geneid = './geneid.ID',
                 fasta = 'Oryza_sativa.pep.fasta',
                 output = 'tmp3.fasta'
