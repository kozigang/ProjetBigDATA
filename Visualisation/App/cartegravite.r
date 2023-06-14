install.packages(c("shiny", "leaflet", "dplyr"))

library(shiny)
library(leaflet)
library(dplyr)

accident <- read.csv("stat_acc_V3.csv", sep = ";")

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
    accgrav <- accident[accident$desc_gravite == input$gravite, ] 
    leaflet() %>%
      addTiles() %>%
      addCircleMarkers(data = accgrav, lng = ~accdep$longitude, lat = ~accdep$latitude,
                       color = "blue", fillColor = "blue", fillOpacity = 0.6,
                       radius = ~2, stroke = FALSE)
  })
}

# Lancer l'application Shiny
print(shinyApp(ui = ui, server = server))