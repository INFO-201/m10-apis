### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Google Drive/CLASS(UW)/2016Autumn/INFO201/git201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
ReturnTop10 <- function(artist_name) {
    base <- "https://api.spotify.com/v1/search?"
    search <- paste0("q=", artist_name)
    type <- "&type=track"
    limit <- "&limit=10"
    
    # Query string
    query_url <- paste0(base, search, type, limit)
    
    dat <- fromJSON(query_url)
    top10track <- dat$tracks$items$name
    return(top10track)
}

# What are the top 10 tracks by Nelly?
top.10.Nelly <- ReturnTop10("Nelly")



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest
ReturnSomething <- function(my_type, my_string, my_limit = 10) {
    base <- "https://api.spotify.com/v1/search?"
    search <- paste0("q=", my_string)
    type <- paste0("&type=", my_type)
    limit <- paste0("&limit=", my_limit)
    
    query_url <- paste0(base, search, type, limit)
    dat <- fromJSON(query_url)
    # it seems like I need to add a 's' in the end of type...
    my_type2 <- paste0(my_type, 's')
    # this get() function is very crucial for the getting of elements
    result <- dat %>% get(my_type2, .)
    return(result$item$name)
}

# Search albums with the word "Sermon"
Sermon.albums <- ReturnSomething("album", "Sermon", 10)
