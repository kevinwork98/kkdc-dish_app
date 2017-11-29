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

# Change these to reflect the path to the files on your local machine
# May or may not need to find a way to upload compressed files and unzip
# For use in the shiny app
dishes <- read.csv("data/Dish.csv")
menues <- read.csv("data/Menu.csv")
menu_items <- read.csv("data/MenuItem.csv")
menu_pages <- read.csv("data/MenuPage.csv")

# Define non-reactive functions here

# Define server logic to reactively respond to user desires
shinyServer(function(input, output) {
  output$value <- renderPrint({
    input$text
  })
  
  output$dish_price_graph <- renderPlot({
    
  })
})
