
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

Pour charger le package il suffit d’écrire la commande suivante:

``` r
library(AnalyseR)
```

## Lancement de l’application

Pour lancer l’application, lancer ensuite la commande suivante:

``` r
AnalyseR::run_app()
```

Vous avez également accès à toute les fonctions utilisés à l’intérieur
de l’application.  
**Exemple**:

``` r
AnalyseR::histogramme(data=iris,variable = "Sepal.Length",nbClasses = 10,color = "darkred",type="ggplot")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

``` r
AnalyseR::scinde(iris)
#> $quanti
#> [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width" 
#> 
#> $quali
#> [1] "Species"
#> 
#> $binaire
#> NULL
```

## Note

Il est possible que certains graphiques `ggplotly` mette du temps pour
se lancer, voir ne se lance pas. Il ne s’agit pas d’un bug de
l’interface mais de la difficulté de cette fonction de wrap un ggplot en
un graphique plotly et cette mise en place permet justement de se rendre
compte des grandes limites qu’offre ggplotly. Dans l’avenir, cette
option est voué à être omise au sein de l’interface et de juste laisser
à l’utilisateur le choix entre les ggplot et plotly.

# Machine Learning

La partie de Machine Learning n’est pas encore opérationnelle au sein de
l’interface. L’onglet correspondant ne produit donc pas de réel
prédiction mais une génération aléatoire en attendant de fixer les
quelques problèmes de portabilité.
