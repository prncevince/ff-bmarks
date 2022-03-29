library(jsonlite)
library(magrittr)

l <- fromJSON('bookmarks.json')
l_flat <- fromJSON('bookmarks.json', flatten = T)
identical(l, l_flat)