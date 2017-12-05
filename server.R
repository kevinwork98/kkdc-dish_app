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
  searchRestaurant <- reactive ({
    findRestaurant(input$restaurant_input)$location_date
  })
  
  searchDish <- reactive ({
    findDish(input$dish_input)$name
  })
  
  #Using data passed from ui.R
  output$restaurantResults <- renderUI({
    selectInput("restaurant_choice", "Select Specific Restaurant:", as.list(searchRestaurant()))
  })
  
  output$dishResults <- renderUI({
    selectInput("dish_choice", "Select Specific Dish:", as.list(searchDish()))
  })
  
  getRestaurantWithDish <- reactive({
    restaurant <- findRestaurant(input$restaurant_choice)
    dish <- findDish(input$dish_choice)
    return(findRestaurantWithDish(restaurant, dish))
  })
  
  #output$map <- renderLeaflet({
    #plotMap(ny_menus)
  #})
})
