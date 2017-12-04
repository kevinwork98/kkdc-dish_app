library(dplyr)

findDish <- function(dishName)  {
  filter(ny_dishes, grepl(dishName, name, ignore.case = TRUE))
#  onlyNames <- rowReturn(rowReturn$onlyNames)
}

findPrice <- function(min, max){
  filter(ny_items, price >= min & price <= max) 
}

#findRestuarant <- function()