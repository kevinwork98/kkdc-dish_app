library(dplyr)

findDish <- function(dishName)  {
  filter(ny_dishes, grepl(dishName, name, ignore.case = TRUE))
}

findPrice <- function(min, max){
  filter(ny_items, price >= min & price <= max) 
}

findRestaurant <- function(restaurantName){
  filter(ny_menus, grepl(restaurantName, location, ignore.case = TRUE))
}