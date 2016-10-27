### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Desktop/Info201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
ArtistTopTen <- function(artist) {
  base.url <- "https://api.spotify.com/v1/search?"
  query.url <- paste0(base.url, "q=", artist, "&type=artist")
  artist.data <- fromJSON(query.url)
  artist.id <- artist.data$artist$items$id[1]
  
  tracks.query <- paste0(base.url, 'artists/', artist.id, '/top-tracks?country=US')
  tracks <- fromJSON(track.query)
  return(tracks)
}


# What are the top 10 tracks by Nelly?  
ArtistTopTen("Nelly")



### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

