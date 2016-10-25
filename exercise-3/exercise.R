### Exercise 3 ###
library(jsonlite)
library(dplyr)
load("nelly_tracks.Rdata")
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you


# Use the `flatten` function to flatten the data.frame -- note what differs!
flatten(top.nelly)

# Use your `dplyr` functions to get the number of the songs that appear on each albumt
number.songs <- filter(flatten(top.nelly), album.album_type == 'album') %>% select(track_number)


# Bonus: perform both of the steps above in one line (one statement)
