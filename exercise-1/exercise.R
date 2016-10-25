### Exercise 1 ###

# libraries
library(dplyr)

# We'll be using the mtcars dataset -- adding rowname as a column
vehicle <- add_rownames(mtcars, var='car')


######## buggy ######### ----------------------------------------------

# Function to debug:
# Given a number of forward gears and a number of cylinders, what is the 
# Name of the car with the best mpg?
BestGearsCyl <- function(gears, cylinders) {
  ret <- vehicle %>%  
        filter(gear == gears, cyl == cylinders) %>% 
        filter(mpg == max(mpg)) %>% 
        select(car)
  return(ret)
}

# Get the best mpg car for 6 cylinder cars with 4 gears
answer <- BestGearsCyl(cylinders=6, gears=4)
