library(dplyr)

findDish <- function(dishName)  {
  rowReturn <- filter(nyDishItems, grepl(dishName, name, ignore.case = TRUE))
#  onlyNames <- rowReturn(rowReturn$onlyNames)
  return(rowReturn)
}

findPrice <- function(min, max){
  rowReturn <- filter(nyDishItems, price >= min & price <= max) 
  return(rowReturn)
}

findRestuarant <- function(restuarantName){
  rowReturn <- filter(nyMenus, grepl(restuarantName, location, ignore.case = TRUE))
  return(rowReturn)
}

