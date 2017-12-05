library(dplyr)
library(ggplot2)

ny_menus <- read.csv("data/new_york_menus.csv")
ny_pages <- read.csv("data/new_york_pages.csv")
ny_dishes <- read.csv("data/new_york_dishes.csv")

findDish <- function(dishName)  {
  filter(ny_dishes, grepl(dishName, name, ignore.case = TRUE))
}

findPrice <- function(min, max){
  filter(ny_dishes, price >= min & price <= max) 
}

findRestaurant <- function(restaurantName){
  filter(ny_menus, grepl(restaurantName, location, ignore.case = TRUE))
}

getDishMenu <- function(menus_with_dish, dishes_of_menu) {
  chosen_menu <- data.frame(menu_id = integer,
                            location = character(),
                            menu_page_id = integer,
                            dish_id = integer,
                            dish_name = character(),
                            dish_price = integer)
  
  #get menu id and name of restaurants that serve chosen dish
  chosen_menu$menu_id <- menus_with_dish$id
  
  #chosen_menu$location <- menus_with_dish$location
  
  #if they specified a menu, filter out all menus that are not that menu
  chosen_menu <- filter(chosen_menu,
                        dishes_of_menu$menu_id == chosen_menu$menu_id)
  
  #get all menu pages that correspond to that menu
  filter_page_by_dish <- filter(ny_pages, ny_pages$id == chosen_menu$menu_page_id)
  #### YOU WERE HERE
  chosen_menu$menu_page_id <- filter(ny_pages,
                                     ny_pages$menu_id == chosen_menu$menu_id)$menu_page_id
  
  #get all dishes from those pages
  filter_dish_by_page <- filter(ny_dishes, ny_dishes$menu_page_id == chosen_menu$menu_page_id)
  chosen_menu$dish_id <- filter_dish_by_page$dish_id
  chosen_menu$dish_name <- filter_dish_by_page$name
  
  #if they specified a dish, filter out all dishes that are not that dish
  filter_dish_by_dish <- filter(menus_with_dish, menus_with_dish$dish_id == chosen_menu$dish_id)
  chosen_menu$dish_id <- filter_dish_by_dish$dish_id
  
  #get dish price
  chosen_menu$dish_price <- filter(chosen_menu, menus_with_dish$dish_id == chosen_menu$dish_id)
  
  return(chosen_menu)
}

test_dish <- findDish("Celery")
test_menu <- findRestaurant("")
test_menu_dish <- getDishMenu(test_dish, test_menu)

mapRestaurant <- function(dishQuery, priceQuery, restaurantQuery){
  returnRow <- filter(ny_menus, location %in% restaurantQuery$location)
  filteredPages <- filter(ny_pages, id %in% dishQuery$menu_page_id)
  filteredPages <- filter(ny_pages, id %in% priceQuery$menu_page_id)
  returnRow <- filter(ny_menus, id %in% filterPages$menu_id)
  return(returnRow)
}

dishByRestaurant <- function(dishQuery, priceQuery, restaurant){
  specRestaurant <- filter(ny_menus, lat == restaurant$lat)
  specRestaurant <- filter(specRestaurant, lng == restaurant$lng)
  specPage <- filter(ny_pages, menu_id == specRestaurant$id)
  dishes <- filter(ny_dishes, menu_page_id == specPage$id)
  return(dishes)
}

# reference code for getting/using datasets 
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
