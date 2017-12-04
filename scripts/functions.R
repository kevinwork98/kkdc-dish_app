library(dplyr)

findDish <- function(dishName)  {
  rowReturn <- filter(nyDishSet, grepl(dishName, name, ignore.case = TRUE))
  return(rowReturn)
#  onlyNames <- rowReturn(rowReturn$onlyNames)
}


