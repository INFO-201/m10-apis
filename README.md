# Module 10: Introduction to Application Programming Interfaces

## Overview
The term _*Application Programming Interface*_ (API, for short) encompasses a broad set of utilities (protocols, tools) used for building software. In fact, the term API could appropriately describe some of the libraries we've been using in R, such as `DPLYR`. The general pattern used by `DPLRY` and steps necessary for using it are referred to as it's API. This is well described on [WikiPedia](https://en.wikipedia.org/wiki/Application_programming_interface):

>the API describes and prescribes the expected behavior while the library is an _actual implementation_ of this set of rules

In addition to exposing _functions_ for buidling software, APIs are often built to expose _data_ components. The focus of this learning module is to focus on accessing data from APIs that expose _data_ as their primary function.

<!-- START doctoc -->
<!-- END doctoc -->

## Resources
-[WikiPedia- APIS](https://en.wikipedia.org/wiki/Application_programming_interface)
- [REST APIs](https://en.wikipedia.org/wiki/Application_programming_interface)
- [JSON View Extension](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en)
- [Spotify Web API](https://developer.spotify.com/web-api/)

## REST APIs
APIs are often developed to provide a consistent way to access data from a complex data structure. In particular, _Representational State Transfer_ (REST) APIs were designed to transfer data given a set of predefined protocols. REST APIs most commonly communicate data through _HyperText Transfer Protocol_, or **HTTP**. This allows developers to access different web *endpoints* to request data, and process it in a language / application of their choice.

For example, we'll use the [Spotify API](https://developer.spotify.com/web-api/) to query publicly available data from Spotify. The actual data structure contains massive amounts of information (artists, songs, playlists, users, listens, etc.) and the underlying structure of the data may change. By developing an API, Spotify allows developers to access their data in a consistent framework.

## Accessing Data
To access data from an API, you'll need to navigate to the appropriate API endpoint (i.e., the URL that will return the information you're seeking). For example, try opening up the following URL in your web browser:

```
https://api.spotify.com/v1/search?q=adele&type=artist
```
When you open that URL, you should see the data structure returned by the REST API (more on that below). The URL you've entered constitutes a _request_ to the Spotify by constructing a query (`q=adele`) and specifying what you're looking for (`type=artist`). In order to write a query, you'll need to **read the documentation** to understand how to request certain information.

In R, you can make requests to a URL using the `fromJSON` function, which is part of the `jsonlite` package.

```r
# Install jsonlite
install.packages('jsonlite')
library(jsonlite)

# Read data using the fromJSON function (part of jsonlite)
data <- fromJSON('https://api.spotify.com/v1/search?q=adele&type=artist')
```

In practice, you'll likely want to write a function that allows you to paste together a search query:

```r
# Base URL of API
base <- 'https://api.spotify.com/v1/search?'

# Parameters
search <- 'q=adele'
type <- '&type=artist'

# Query string
query_url <- paste0(base, search, type)
```

## Data Structure
Most REST APIs will return your data in JavaScript Object Notation (**JSON**) format. JSON format is a common structure for storing data using _key-value_ pairs. Note, these values can be _nested_, so you can have many levels of a JSON object. Here's an example JSON object storing a set of items in a todo list:
```json
// All data is stored in the same object
{
    "todos":{
        "one":{
            "description": "Do INFO 343 Homework",
            "status":"Incomplete",
            "urgency":"Low"
        },
        "two":{
            "description": "Do INFO 474 Homework",
            "status":"Incomplete",
            "urgency":"High"
        }
    }
}
```
The corollary to a JSON object in R is a **list of lists**. A list can have key-value pairs, where the _names_ of your items are your _keys_, and the elements stored in those locations are the _values_. And, as with JSON objects, these can be nested, meaning that your _values_ can themselves be _lists_ with their own set of key-value pairs.

To practice requesting data from the Spotify API, see [exercise-2](exercise-2).

## Flattening Data
One challenge of working with data from APIs is making sure that the data is in the proper format. In order to ask questions of our datasets, we'll still want to put them in **dataframes**. Unfortunately, sometimes the nested nature of JSON data will result in unintended data structures. In particular, you may end up with a dataframe in which **one of the columns is a dataframe**. For example,

```r
# Let's do something silly
people <- data.frame(names = c('Spencer', 'Jessica', 'Keagan'))
favorites <- data.frame(
                food = c('Pizza', 'Pasta', 'salad'),
                music = c('Bluegrass', 'Indie', 'Electronic')
            )
# Store dataframe column
people$favorites <- favorites
```

R will _display_ the dataframe properly, but it won't actually _save_ it properly. If you `View` the dataframe created above, it will appear as if there is a `favorites.food` column, but `people$favorites.food` is actually `null` (it's stored in `people$favorites$food`). Luckily, you're not the first person to encounter this issue, and it can easily be address with the `flatten` function, which is also part of the `jsonlite` package:

```r
# Spread a dataframe into separate columns
people <- flatten(people)
people$favorites.food # this just got created
```

To practice working with flattening data, see [exercise-3](exercise-3).
