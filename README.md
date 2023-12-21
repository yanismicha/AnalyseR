
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AnalyseR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

L’objectif de l’application est de pouvoir comparer différents packages
de visualisations graphiques tels que `ggplot2` et `plotly`.

## Installation

Vous pouvez installer ce package de la façon suivante:

``` r
devtools::install_github("yanismicha/AnalyseR")
```

## Example

``` r
library(AnalyseR)
#> Warning: remplacement de l'importation précédente 'ggplot2::last_plot' par
#> 'plotly::last_plot' lors du chargement de 'AnalyseR'
#> Warning: remplacement de l'importation précédente 'magrittr::set_names' par
#> 'rlang::set_names' lors du chargement de 'AnalyseR'
#> Warning: remplacement de l'importation précédente 'shinyWidgets::alert' par
#> 'shinyjs::alert' lors du chargement de 'AnalyseR'
#> Warning: remplacement de l'importation précédente 'shiny::runExample' par
#> 'shinyjs::runExample' lors du chargement de 'AnalyseR'
library(compar)
#> Warning: remplacement de l'importation précédente 'ggplot2::last_plot' par
#> 'plotly::last_plot' lors du chargement de 'compar'
#> Warning: remplacement de l'importation précédente 'magrittr::set_names' par
#> 'rlang::set_names' lors du chargement de 'compar'
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
