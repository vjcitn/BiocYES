#' simple function to display HTML map of MA
#' @importFrom leaflet leaflet addTiles setView
#' @examples
#' if (interactive()) mass_map()
#' @export
mass_map = function() 
  leaflet() |> addTiles() |> setView(-71.78, 42.05, zoom = 8.5)


#' simple function to display HTML map of US
#' @param provider character(1) passed to `leaflet::addProviderTiles`, defaults to
#' `"CartoDB.PositronOnlyLabels"`
#' @examples
#' if (interactive()) mass_map()
#' @export
us_map = function(provider="CartoDB.PositronOnlyLabels") 
  leaflet() |> addTiles() |>
    addProviderTiles ( provider=provider ) |> setView(-93.9, 39.0, zoom = 4)
