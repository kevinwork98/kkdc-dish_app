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


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("New York Restaurant and Menu Item Search"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("dish_input",
                 label = h3("Search by Dish:"),
                 value = "<Dish/Ingredient Name>"),
       
       uiOutput("dishResults"),
       
       textInput("restaurant_input",
                 label = h3("Search by Restaurant:"),
                 value = "<Restaurant Name>"),
       
       uiOutput("restaurantResults"),
       
       sliderInput("price_slider", label = h3("Price Range"), min = 0, 
                   max = 400, value = c(150, 250))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
