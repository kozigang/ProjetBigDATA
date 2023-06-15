install.packages(c("shiny", "leaflet", "dplyr"))

library(shiny)
library(leaflet)
library(dplyr)

accident <- read.csv("stat_acc_V3_exp.csv", sep = ";")

accident$id_code_insee <- as.numeric(accident$id_code_insee)

accident$id_code_insee[is.na(accident$id_code_insee)] <- median(subset(accident$id_code_insee, accident$id_code_insee != "NA"))

accident$departement <- accident$id_code_insee %/% 1000

ui <- fluidPage(
  titlePanel("Répartition des accidents par département"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("Departement", "Département", choices = unique(accident$departement))
    ),
    
    mainPanel(
      leafletOutput("map")
    )
  )
)

server <- function(input, output) {
  output$map <- renderLeaflet({
    accdep <- accident[accident$departement == input$Departement, ] 
    leaflet() %>%
      addTiles() %>%
      addCircleMarkers(data = accdep, lng = ~accdep$longitude, lat = ~accdep$latitude,
                       color = "blue", fillColor = "blue", fillOpacity = 0.6,
                       radius = ~2, stroke = FALSE)
  })
}

print(shinyApp(ui = ui, server = server))
