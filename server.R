#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

ny_menus <- read.csv("data/new_york_menus.csv")
ny_pages <- read.csv("data/new_york_pages.csv")
ny_items <- read.csv("data/new_york_items.csv")
ny_dishes <- read.csv("data/new_york_dishes.csv")

source("scripts/functions.R")


# Define server functions that reactivel by respond to user queries
shinyServer(function(input, output) {
  
  dish_search <- reactive ({
    findDish(input$dish_input)$name
  })
  
  restaurant_search <- reactive ({
    findRestaurant(input$restaurant_input)$name
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
  
  output$dish_price_graph <- renderPlot({
    
  })
})
