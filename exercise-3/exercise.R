### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
load("nelly_tracks.Rdata")

# Use the `flatten` function to flatten the data.frame -- note what differs!
flattened <- flatten(top.nelly)

# Use your `dplyr` functions to get the number of the songs that appear on each album
num.album <- flattened %>% 
             group_by(album.name) %>% 
             summarise(n = n()) %>% 
             arrange(-n)


# Bonus: perform both of the steps above in one line (one statement)
num.album <- top.nelly %>% 
             flatten() %>%
             group_by(album.name) %>% 
             summarise(n = n()) %>% 
             arrange(-n)
