library(dplyr)
library(leaflet)

#Reading in the data sets
ny_menus <- read.csv("data/new_york_menus.csv")
ny_pages <- read.csv("data/new_york_pages.csv")
ny_dishes <- read.csv("data/new_york_dishes.csv")

#Finds resturaunt based upon user input. Searches by closest match, not exact match
findRestaurant <- function(restaurant_location){
  if (restaurant_location == "" | is.null(restaurant_location)) return(ny_menus)
  filter(ny_menus, grepl(restaurant_location, location_date, ignore.case = TRUE))
}

#Finds the user's inputted dish name, does not need to be exact match.
findDish <- function(dish_name)  {
  if (dish_name == "" | is.null(dish_name)) return(ny_dishes)
  filter(ny_dishes, grepl(dish_name, name, ignore.case = TRUE))
}

#functionally the same as mapRestaurant,
#filters already completed in findRestaurant and findDish
findMenuWithDish <- function(restaurant, dish) {
  menu_with_dish <- restaurant
  #filter pages to pages that contain dish
  pages_with_dish <- filter(ny_pages, id %in% dish$menu_page_id)
  #filter restaurant return to menus that contain those pages
  menu_with_dish <- filter(menu_with_dish, id %in% pages_with_dish$menu_id)
  if(nrow(menu_with_dish) == 0) return(restaurant)
  #returns filtered menu
  return(menu_with_dish)
}

#Used to create table that can be printed below map
getRestaurantMenu <- function(selected_menu) {
  #filter pages to pages in menu
  pages_in_menu <- filter(ny_pages, menu_id %in% selected_menu$id)
  #filter dishes to dishes within the menu pages
  dishes_in_menu <- filter(ny_dishes, menu_page_id %in% pages_in_menu$id)
  dishes_in_menu <- select(dishes_in_menu, name, price)
  dishes_in_menu$price <- paste0("$", dishes_in_menu$price)
  #returns filtered menu
  return(dishes_in_menu)
}

#Plots the map based upon the search aparameters entered above.
plotMap <- function(plot_data){
  length <- nrow(plot_data)
  plot <- leaflet(data = plot_data[1:length,]) %>% addTiles() %>%
    addMarkers(~lng, ~lat, popup = ~location_date, clusterOptions = markerClusterOptions())
  return(plot)
}

## reference code for getting/using/changing datasets, all commented out
# get menu datasets
'menus <- read.csv("data/Menu.csv")
dishes <- read.csv("data/Dish.csv")
menu_pages <- read.csv("data/MenuPage.csv")
menu_items <- read.csv("data/MenuItem.csv")'

# filter menu datasets
# possibility of making this reactively filter to user-specified location?
'menu_filter <- filter(menus, grepl("NY", place))
page_filter <- menu_pages[menu_pages$menu_id %in% menu_filter$id, ]
item_filter <- menu_items[menu_items$menu_page_id %in% page_filter$id, ]
dish_filter <- dishes[dishes$id %in% item_filter$dish_id, ]'

# save filtered datasets to new sets
'write.csv(menu_filter, "data/new_york_menus.csv", row.names = FALSE)
write.csv(page_filter, "data/new_york_pages.csv", row.names = FALSE)
write.csv(item_filter, "data/new_york_items.csv", row.names = FALSE)
write.csv(dish_filter, "data/new_york_dishes.csv", row.names = FALSE)'
#commented out

#The lines below were used to further filter the New York .csv files
'
ny_menus <- filter(ny_menus, 1900 <= year(as.Date(date)) & year(as.Date(date)) <= 1910)
ny_menus <- filter(ny_menus, lat != 0)
#ny_menus <- ny_menus[!duplicated(ny_menus$lat), ]
ny_pages <- filter(ny_pages, menu_id %in% ny_menus$id)
ny_dishes <- filter(ny_dishes, menu_page_id %in% ny_pages$id)
'
