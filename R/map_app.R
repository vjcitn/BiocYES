#' use shiny to explore aspects of geographic mapping
#' @import shiny
#' @import leaflet
#' @export
map_app = function() {
 cwd = getwd()
 on.exit(setwd(cwd))
 setwd(system.file("map_app", package="BiocYES"))
 shiny::runApp()
}
