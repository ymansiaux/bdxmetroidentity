vec_bdxmetro_colors <- c(
  "cerulean" = "#039ed2",
  "bubblegum-pink" = "#fd79da",
  "pastel-orange" = "#fd994e",
  "warm-pink" = "#fd5072",
  "soft-blue" = "#5cadfd",
  "pastel-purple" = "#c4a5fd",
  "seafoam-blue" = "#60ccb7",
  "cornflower" = "#6969fc",
  "sature" = "#ef594c",
  "dense" = "#edae38",
  "fluide" = "#128e3d",
  "actuel" = "#0066ff",
  "prevision" = "#292930"
)

palettes_bdxmetro <- list(
  continuous = vec_bdxmetro_colors[c("cerulean", "seafoam-blue")],
  continuous2 = vec_bdxmetro_colors[c("bubblegum-pink", "pastel-orange")],
  discrete = vec_bdxmetro_colors[c("cerulean", "bubblegum-pink", "pastel-orange", "warm-pink", "soft-blue", "pastel-purple", "seafoam-blue", "cornflower")],
  discrete2 = vec_bdxmetro_colors[c("pastel-orange", "seafoam-blue", "bubblegum-pink", "cornflower", "warm-pink", "cerulean", "pastel-purple", "soft-blue")],
  discrete3 = c("#039ED2", "#5F90D4", "#BB82D7", "#FD7CCB", "#FD8897", "#FD9364",
                "#FD8955", "#FD6E62", "#FD5370", "#CA6D9D", "#8E8FD1", "#61ACFD",
                "#87A9FD", "#AEA6FD", "#B4ABF1", "#8FB9D8", "#6AC7BE", "#62B1C9",
                "#658DE2", "#6969FC"),
  divergent = vec_bdxmetro_colors[c("cerulean", "pastel-orange")],
  divergent2 = vec_bdxmetro_colors[c("bubblegum-pink", "seafoam-blue")]
)
