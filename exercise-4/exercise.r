# Install and load the jsonlite package

# Make a variable base.url that has the same base url from the omdb documentation.
# (Hint: visit https://www.omdbapi.com/ to find the base url)

# Make a variable called movie that has the names of your favorite movie

# Make a variable called move.no.spaces that holds movie where all the spaces
# are replaced with the '+' character

# Make a variable called "parameters" that holds a string with the parameters
# to pass to the API. View the OMDb documentation to see which parameters
# are available. Remember to separate parameters with the '&' character.

# Make a variable called request that is a string of a request URL made up of the base URL
# and the parameters string

# Use fromJSON to retrieve JSON data from the omdb api using your request URL.
# Store the result in a variable called movie.data

# Make movie_data into a data frame using as.data.frame

# Write a function called Director that accepts a data frame of movie info and returns
# A vector of strings that states a movie and the director of said movie.

# Call Director with your favorite movie, and assign it to the variable movie.director

# Bonus 

# Knowing the director of on movie is okay, but it'd be great to know the directors of different
# movies. 

# Start by making a vecotr of movies and save it to the variable movie.list

# Remove spaces from each movie title

# Prepare this list to be passed in as parameters for the API

# Create API URL request and assign it to the variable api.request

# For every entry in the vector api.request, APPLY the function fromJSON to make a list of lists
# one entry for each request and assign this to a variable called data. 
# (Hint: ?lapply. It's similar a 'for' loop but better!)

# Using the function do.call, call rbind on each entry in data (check out the do.call documentation)

# Make sure movies is treated as a data frame by calling as.data.frame and assign that to movies.df

# Use your Director function to see who directed all these movies. Assign the result to movie.info

# Create a variable called meta.scores which is a vector containing the Metascore column from movie.df

# Create a variable called movie_titles which is a vector containing the Title column from movie.df

# Once you finish the rest of the lab you can uncomment this next line for some sweet data viz
#barplot(as.numeric(meta.scores), names.arg=as.vector(movie.titles), las=2)
