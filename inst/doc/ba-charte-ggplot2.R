## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE
)
library(ggplot2)
library(tibble)
library(dplyr)

## -----------------------------------------------------------------------------
library(bdxmetroidentity)

## ----fig.width=6, fig.height=1, fig.align='center'----------------------------
show_palette_bdxmetro(create_palette_bdxmetro("continuous")(10))
show_palette_bdxmetro(create_palette_bdxmetro("continuous2")(10))
show_palette_bdxmetro(create_palette_bdxmetro("divergent")(10))
show_palette_bdxmetro(create_palette_bdxmetro("divergent2")(10))
show_palette_bdxmetro(create_palette_bdxmetro("discrete")(10))
show_palette_bdxmetro(create_palette_bdxmetro("discrete2")(10))

## ----fig.width=6, fig.align='center'------------------------------------------
ggplot(data = iris) +
  aes(x = Sepal.Width, y = Sepal.Length, color = Sepal.Length) +
  geom_point() +
  scale_color_bdxmetro_continuous()

ggplot(data = iris) +
  aes(x = Sepal.Width, y = Sepal.Length, color = Sepal.Length) +
  geom_point() +
  scale_color_bdxmetro_continuous(name_palette = "continuous2")

ggplot(data = faithfuld) +
  aes(x = waiting, y = eruptions, fill = density) +
  geom_tile() +
  scale_fill_bdxmetro_continuous()

ggplot(data = iris) +
  aes(x = Sepal.Width, y = Sepal.Length, color = Species) +
  geom_point() +
  scale_color_bdxmetro_discrete()

ggplot(data = iris) +
  aes(x = Sepal.Width, fill = Species) +
  geom_density(alpha = 0.6, color = NA) +
  scale_fill_bdxmetro_discrete()

ggplot(data = iris) +
  aes(x = Sepal.Width, fill = Species) +
  geom_density(alpha = 0.6, color = NA) +
  scale_fill_bdxmetro_discrete("discrete2")

## ----fig.width=10, fig.height=6, fig.align='center'---------------------------
plot_without_facets <- ggplot(data = iris) +
  aes(x = Sepal.Width, fill = Species) +
  geom_density(alpha = 0.6, color = NA) +
  labs(title = "Largeur des s\u00e9pales des iris",
       subtitle = "Ceci est un graphique qui respecte la charte Bordeaux M\u00e9tropole",
       x = "Largeur des s\u00e9pales",
       y = "Densit\u00e9",
       fill = "Vari\u00e9t\u00e9 d\'iris",
       caption = "Light mode")

plot_with_facets <- plot_without_facets +
  guides(fill = "none") +
  facet_grid(rows = vars(Species))
  
plot_with_linetype <- iris %>% 
  ggplot() +
  aes(x = Sepal.Length, y = Sepal.Width, color = Species, linetype = Species) +
  geom_point() + 
  geom_line() 

plot_without_facets +
  scale_fill_bdxmetro_discrete() +
  theme_bdxmetro_light()

plot_with_facets +
  scale_fill_bdxmetro_discrete() +
  theme_bdxmetro_light()

plot_with_linetype + 
  scale_color_bdxmetro_discrete() +
  scale_linetype_manual(values = c("setosa" = "dotted", 
                                   "versicolor" = "solid", 
                                   "virginica" = "solid")) +
  theme_bdxmetro_light()

plot_without_facets +
  scale_fill_bdxmetro_discrete() +
  theme_bdxmetro_dark()

plot_with_facets +
  scale_fill_bdxmetro_discrete() +
  theme_bdxmetro_dark()

plot_with_linetype + 
  scale_color_bdxmetro_discrete() +
  scale_linetype_manual(values = c("setosa" = "dotted", 
                                   "versicolor" = "solid", 
                                   "virginica" = "solid")) +
  theme_bdxmetro_dark()

