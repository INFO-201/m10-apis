### Exercise 1 ###

# libraries
library(dplyr)

# We'll be using the mtcars dataset -- adding rowname as a column
vehicle <- add_rownames(mtcars, var='car')


######## buggy ######### ----------------------------------------------

# Function to debug:
# Given a number of forward gears and a number of cylinders, what is the 
# Name of the car with the best mpg?
best_gears_cyl <- functon(gears, cylinders) {
  ret <- vehicles %>%  
        filter(gear == gears, cyl == cylinders) %>% 
        filter(mgp = max(mpg)) %>% 
        select(car)
}

# Get the best mpg car for 6 cylinder cars with 4 gears
answer <- best_gears_cyl(6, 4)

######## Fixed ######### ----------------------------------------------

# Function to debug:
# Given a number of forward gears and a number of cylinders, what is the 
# Name of the car with the best mpg?
best_gears_cyl <- function(gears, cylinders) {
  ret <- vehicle %>%  
    filter(gear == gears, cyl == cylinders) %>% 
    filter(mpg== max(mpg)) %>% 
    select(car)
  return (ret)
}

# Get the best mpg car for 6 cylinder cars with 4 gears
answer <- best_gears_cyl(4, 6)