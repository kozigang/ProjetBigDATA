install.packages(c("shiny", "leaflet", "dplyr"))

library(shiny)
library(leaflet)
library(dplyr)

accident <- read.csv("stat_acc_V3_original.csv", sep = ";")

# Définir l'interface utilisateur
ui <- fluidPage(
  titlePanel("Répartition des accidents par département"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("gravite", "Gravité", choices = unique(accident$descr_grav))
    ),
    
    mainPanel(
      leafletOutput("map")
    )
  )
) 

server <- function(input, output) {
  output$map <- renderLeaflet({
    accgrav <- accident[as.character(accident$descr_grav) == as.character(input$gravite), ] 
    leaflet() %>%
      addTiles() %>%
      addCircleMarkers(data = accgrav, lng = ~accgrav$longitude, lat = ~accgrav$latitude,
                       color = "blue", fillColor = "blue", fillOpacity = 0.6,
                       radius = ~2, stroke = FALSE)
  })
}

# Lancer l'application Shiny
print(shinyApp(ui = ui, server = server))