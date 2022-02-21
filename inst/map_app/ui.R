
library(shiny)
library(BiocYES) # gets leaflet, sf, etc.

providers_of_interest = c("CartoDB.PositronNoLabels", 
 "CartoDB.PositronOnlyLabels", 
 "Stamen.TonerBackground", 
 "Stamen.TonerLabels")

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("Basic overview of mapping with R"),
   selectInput("provider", "type", choices=c("CartoDB", "Stamen"), 
     selected="Stamen"),
   numericInput("lng", "longitude", min=-360, max=360, value=-71.0589),
   numericInput("lat", "latitude", min=-360, max=360, value=42.3601),
   numericInput("zoom", "zoom", min=1, max=18, value=12),
   radioButtons("labs", "labels", choices=c("on", "off"))
  ),
  mainPanel(
   tabsetPanel(
    tabPanel("view", leafletOutput("basic")),
    tabPanel("about", helpText("This app uses leaflet to explore ways of presenting geographic maps"),
      verbatimTextOutput("desc"))
   )
  )
 )
)
