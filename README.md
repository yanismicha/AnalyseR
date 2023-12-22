
<!-- README.md is generated from README.Rmd. Please edit that file -->

# AnalyseR

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end --> Ce package `golem` permet de lancer l’application
du même nom `AnalyseR`.  
L’objectif de cette application est de pouvoir comparer différents
packages de visualisations graphiques tels que `ggplot2` et `plotly` en
proposant plusieurs onglets de visualisations et de résumés
statistiques. Elle intègre un jeu de donnée sur les expéditions
himalayennes, thème principal utilisé lors du projet consacré à l’UE de
logiciels spécialisés. Un onglet dédié à la prédiction basé sur ce jeu
de donnée est également présent bien que pas encore totalement
opérationnelle.  
Bien que l’interface n’utilise qu’un seul jeu de donnée, il est tout à
fait possible de changer ce jeu de donnée, l’interface ayant été pensée
pour fonctionner avec n’importe quel jeu de donnée (à l’exception de
l’onglet de prédicition).

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

Pour lancer l’application, lancez ensuite la commande suivante:

``` r
AnalyseR::run_app()
```

Vous avez également accès à toute les fonctions utilisées à l’intérieur
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
option est vouée à être omise au sein de l’interface et de juste laisser
à l’utilisateur le choix entre les ggplot et plotly.  
De plus si jamais des packages ne sont pas correctement installés voici
un code permettant d’installer toute les dépendances nécessaires (en
commentaire les packages du machine learning):

``` r
if(!require(shiny)){
  install.packages("shiny")
}
require(shiny)
if(!require(shinydashboard)){
  install.packages("shinydashboard")
}
if(!require(shinythemes)){
  install.packages("shinythemes")
}
if(!require(RColorBrewer)){
  install.packages("RColorBrewer")
}
if(!require(reactable)){
  install.packages("reactable")
}
if(!require(scales)){
  install.packages("scales")
}
if(!require(ggrepel)){
  install.packages("ggrepel")
}
if(!require(ggmosaic)){
  install.packages("ggmosaic")
}
if(!require(patchwork)){
  install.packages("patchwork")
}

if(!require(plotly)){
  install.packages("plotly")
}
if(!require(shinyWidgets)){
  install.packages("shinyWidgets")
}
if(!require(cicerone)){
  install.packages("cicerone")
}
require(cicerone)
require(shinyWidgets)
require(shinydashboard)
require(shinythemes)
require(RColorBrewer)
require(reactable)
require(scales)
require(ggrepel)
require(ggmosaic)
require(patchwork)
require(plotly)
require(JuliaCall)
# if(!require(JuliaCall)){
#   install.packages("JuliaCall")
# }
# if(!require(PredictionPython)){
#   install.packages(paste0(path,"/packagesR/PredictionPython_1.0.tar.gz"), repos = NULL, type = "source")
# }
#require(PredictionPython)
# setwd(path)
# julia <- julia_setup()
# 
# julia_install_package("https://github.com/RobinChaussemy/JuliaPredict.jl.git")
# julia_library("JuliaPredict")
```

# Machine Learning

La partie de Machine Learning n’est pas encore opérationnelle au sein de
l’interface. L’onglet correspondant ne produit donc pas de réel
prédiction mais une génération aléatoire en attendant de fixer les
quelques problèmes de portabilité.

# Et la suite?

Vous trouverez l’ensemble de la réalisation de ce projet, c’est à dire
tout ce qui à permis de réaliser cette interface, le traitement de la
data, un **rapport** et une **présentation** sur le repo suivant:
[ProjetMLM1](https://github.com/yanismicha/ProjetMLM1)
