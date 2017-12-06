#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
source("scripts/functions.R")
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  includeCSS("styles.css"),
  # Application title
  titlePanel("New York (1900-1910) Restaurant and Dish Search"),
  
  # Sidebar with text inputs for restaurant/dish searches,
  # select inputs for specific restaurants/dishes
  sidebarLayout(
    sidebarPanel(
       textInput("restaurant_input",
                 label = h3("Search by Restaurant:")),
       
       uiOutput("restaurantResults"),
       
       textInput("dish_input",
                 label = h3("Search by Dish:")),
       
       uiOutput("dishResults")
    ),
    
    # Show a map of the chosen restaurant(s)
    mainPanel(
      leafletOutput("map", height = 800)
    )
  )
))
