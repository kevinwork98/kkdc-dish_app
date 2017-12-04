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

mapRestaurant <- function(dishQuery, priceQuery, restaurantQuery){
  returnRow <- filter(ny_menus, location %in% restaurantQuery$location)
  filteredPages <- filter(ny_pages, id %in% dishQuery$menu_page_id)
  filteredPages <- filter(ny_pages, id %in% priceQuery$menu_page_id)
  returnRow <- filter(ny_menus, id %in% filterPages$menu_id)
  return(returnRow)
}

dishByRestaurant <- function()
#get menu datasets
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
'write.csv(menu_filter, "data/new_york_menus.csv")
write.csv(page_filter, "data/new_york_pages.csv")
write.csv(item_filter, "data/new_york_items.csv")
write.csv(dish_filter, "data/new_york_dishes.csv")'
#commented out
