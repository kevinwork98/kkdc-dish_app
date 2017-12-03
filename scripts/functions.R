library(dplyr)

findDish <- function(dishName)  {
  rowReturn <- filter(nyDishSet, grepl(dishName, name, ignore.case = TRUE))
#  onlyNames <- rowReturn(rowReturn$onlyNames)
  
}


