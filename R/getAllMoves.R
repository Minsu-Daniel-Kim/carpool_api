if (!"rjson" %in% rownames(installed.packages())) {
  install.packages("rjson")
}

library(rjson)

endpointUrl = "http://ec2-54-183-174-139.us-west-1.compute.amazonaws.com/"

# get all moves from all users
getAllMoves <- function() {
  file_url = paste0(endpointUrl, "getMoves")
  json_data <- fromJSON(file=file_url)
  json_data <- lapply(json_data, function(x) {
    x[sapply(x, is.null)] <- NA
    unlist(x)
  })
  do.call("rbind", json_data)
}
