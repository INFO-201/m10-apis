### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
  
  # Replace all of the spaces in your movie title with plus signs (+)
GetReview <- function(movie) {
    my.movie <- gsub("\\s", "+", movie, fixed = FALSE)
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  parameter <- paste0("query=", my.movie)
  api.key <- '&api-key=584cafcb2d414b9cb47a4dea3f138ac9'
  query.url <- paste0(base.url, parameter, api.key)
  
  # Request data using your search query
    movie.data <- fromJSON(query.url)
  
  # What type of variable does this return?
    data.type <- class(movie.data)
  
  # Flatten the data stored in the `$results` key of the data returned to you
    flattened.data <- flatten(movie.data$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
    headline <- flattened.data$headline
    short.summary <- flattened.data$summary_short
    link <- flattened.data$link.url
    review <- list(headline = headline, short_summary = short.summary, link = link)
    
  # Return an list of the three pieces of information from above
  return(review)
}

# Test that your function works with a movie of your choice
movie <- "The Shawshank Redemption"
movie.review <- GetReview(movie)
print(movie.review)
