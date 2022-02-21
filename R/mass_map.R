#' simple function to display HTML map of MA
#' @importFrom leaflet leaflet addTiles setView
#' @examples
#' if (interactive()) mass_map()
#' @export
mass_map = function() 
  leaflet() |> addTiles() |> setView(-71.78, 42.05, zoom = 8.5)
