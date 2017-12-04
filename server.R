#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
source("scripts/functions.R")

# Define server functions that reactivel by respond to user queries
shinyServer(function(input, output) {
  
  dish_search <- reactive ({
    findDish(input$dish_input)$name
  })
  
  restaurant_search <- reactive ({
    findRestaurant(input$restaurant_input)$location
  })
  
  #Using data passed from ui.R
  output$dishResults <- renderUI({
    selectInput("dish_choice", "Select Specific Dish:", as.list(dish_search()))
  })
  
  output$restaurantResults <- renderUI({
    selectInput("restaurant_choice", "Select Specific Restaurant:", as.list(restaurant_search()))
  })
  
  output$value <- renderPrint({
    
  })
  output$map <- renderLeaflet({
    plotMap(ny_menus)
  })
  output$dish_price_graph <- renderPlot({
    
  })
})
