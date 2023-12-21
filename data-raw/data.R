
## code to prepare `data` dataset goes here
data <- read.csv("https://www.dropbox.com/scl/fi/d3v41yp6x9cxlqvueoet3/membersClean.csv?rlkey=v9xfdgu6oyubjur9rlu6k9eow&dl=1")
usethis::use_data(data, overwrite = TRUE)
