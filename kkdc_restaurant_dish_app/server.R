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
'dishes <- read.csv("data/Dish.csv")
menus <- read.csv("data/Menu.csv")
menu_items <- read.csv("data/MenuItem.csv")
menu_pages <- read.csv("data/MenuPage.csv")'

# filter menu datasets
# possibility of making this reactively filter to user-specified location?
'menu_filter <- filter(menus, grepl("NY", place))
page_filter <- menu_pages[menu_pages$menu_id %in% menu_filter$id, ]
item_filter <- menu_items[menu_items$menu_page_id %in% page_filter$id, ]
dish_filter <- dishes[dishes$id %in% item_filter$dish_id, ]'

# save filtered datasets to new sets
'write.csv(menu_filter, "data/new_york_menus.csv")
write.csv(page_filter, "data/new_york_pages.csv")
write.csv(item_filter, "data/new_york_items.csv")
write.csv(dish_filter, "data/new_york_dishes.csv")'
#commented out

# Define non-reactive functions here
#
#
#


# Define server functions that reactively respond to user queries
shinyServer(function(input, output) {
  output$value <- renderPrint({
    input$text
  })
  
  output$dish_price_graph <- renderPlot({
    
  })
})
