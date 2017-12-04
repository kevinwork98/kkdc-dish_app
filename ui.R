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
  titlePanel("New York Restaurant and Menu Item Search"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("dish_input",
                 label = h3("Search by Dish:"),
                 value = ""),
       
       uiOutput("dishResults"),
       
       textInput("restaurant_input",
                 label = h3("Search by Restaurant:"),
                 value = ""),
       
       uiOutput("restaurantResults"),
       
       sliderInput("price_slider", label = h3("Price Range"), min = 0, 
                   max = 400, value = c(100, 300))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("map", height = 800)
    )
  )
))
