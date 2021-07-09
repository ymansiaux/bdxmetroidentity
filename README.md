
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bdxmetroidentity <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

<!-- badges: end -->

Le package `{bdxmetroidentity}` fournit des outils de design dédiés aux
productions data du datalab de Bordeaux Métropole. Il inclut :

  - Des fonctionnalités pour associer un thème light/dark à des
    graphiques `{ggplot2}`,
  - Des fonctionnalités pour associer un thème light/dark à des rapports
    et des vignettes R Markdown,
  - Des fonctionnalités pour associer un thème light/dark à des apps
    Shiny.

Il inclut également des fonctionnalités supplémentaires (installation de
la police de caractères Roboto, gestion de pictogrammes au format SVG,
etc.).

Le site du package est disponible ici :
<http://bdxmetropole.pages.thinkr.fr/bdxmetroidentity/>

## Installation

Pour installer le package depuis GitLab, vous pouvez lancer le script
suivant :

``` r
# install.packages("remotes")
remotes::install_git(url = "https://forge.thinkr.fr/bdxmetropole/bdxmetroidentity")
```

## Vignettes

  - *Installation du package et dépendances*
  - *Intégration de la charte graphique dans les graphiques {ggplot2}*
  - *Intégration de la charte graphique dans les rapports R Markdown*
  - *Intégration de la charte graphique dans les apps Shiny*
  - *Chargement de la font Roboto*
  - *Utilisation des pictogrammes*

Ouvrir le pkgdown
:

``` r
bdxmetroidentity::open_pkgdown()
```

## Exemples

### Graphiques `{ggplot2}`

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

### Rapports HTML

``` r
browseURL(system.file("rmarkdown", "rmd_template_light.html", package = "bdxmetroidentity"))
```

<img src="vignettes/figures/rmd_light.jpeg" width="600" style="display: block; margin: auto;" />

``` r
browseURL(system.file("rmarkdown", "rmd_template_dark.html", package = "bdxmetroidentity"))
```

<img src="vignettes/figures/rmd_dark.jpeg" width="600" style="display: block; margin: auto;" />

### Apps Shiny

``` r
shiny::runApp(system.file("shiny", "shiny_template_fluidpage.R", package = "bdxmetroidentity"))
```

<img src="vignettes/figures/shiny_fluid_light1.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_fluid_light2.png" width="600" style="display: block; margin: auto;" />

<img src="vignettes/figures/shiny_fluid_dark1.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_fluid_dark2.png" width="600" style="display: block; margin: auto;" />

``` r
shiny::runApp(system.file("shiny", "shiny_template_navbarpage.R", package = "bdxmetroidentity"))
```

<img src="vignettes/figures/shiny_nav_light1.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_nav_light2.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_nav_light3.png" width="600" style="display: block; margin: auto;" />

<img src="vignettes/figures/shiny_nav_dark1.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_nav_dark2.png" width="600" style="display: block; margin: auto;" /><img src="vignettes/figures/shiny_nav_dark3.png" width="600" style="display: block; margin: auto;" />

## Licence

Copyright 2021 ThinkR. All rights reserved.
