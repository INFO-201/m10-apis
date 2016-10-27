### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
#setwd('~/Documents/info-201/m10-apis/exercise-2/')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
base.API.str <- 'https://api.spotify.com/v1/search?'

GetArtistId<-function(artist.name){
  # Base URL of API
  search <- paste('q=',artist.name,collapse="",sep="")
  type <- '&type=artist'
  query.url <- paste0(base.API.str, search, type)
  json.file <-fromJSON(query.url)
  #names(adele$artists$items$id[1])
  artist.id<-json.file$artists$items$id[1]
  #json.file <- lapply(json.file, function(x) {
   # x[sapply(x, is.null)] <- NA
  #  unlist(x)
  #})
  #data<-do.call("rbind", json.file)
  #names(json.file)
  return(artist.id)
}
GetArtistTracks<-function(artist.name){
  artist.id<-GetArtistId(artist.name)
  tracks.query<-paste0(base.API.str,"artists/",artist.id,"/top-tracks?country=US")
  tracks<-fromJSON(tracks.query)
  return(tracks)
}
adele<-GetArtistTracks("Adele")
#print(adele$artists$items[[1]])
# What are the top 10 tracks by Nelly?




### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

