#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
  

  '
  output$dish_slider <- renderUI({
    sliderInput("price_range", label = h3("Price Range"), min = 0, 
                max = 400, value = c(100, 300))
  })
  '
  
  output$dishMenuPriceResults <- reactive({
    menus_with_dish <- findDish(input$dish_choice)
    dishes_of_menu <- findRestaurant(input$restaurant_choice)
    return(getDishMenu(menus_with_dish, dishes_of_menu))
  })
  
  output$dish_price_graph <- renderPlot({
    
  })
})
