aws_string <- function() {
  baseurl <- "https://s3.amazonaws.com/elevation-tiles-prod/geotiff"
  #  "https://s3.amazonaws.com/elevation-tiles-prod/geotiff/12/1227/1500.tif"
  sprintf("%s/{zoom}/{x}/{y}.tif", baseurl)
}
mapbox_string <- function(baseurl = "https://api.mapbox.com", type, format) {

  tok <- ""
  if (type == "mapbox.terrain-rgb") {
    format <- "png"
    tok <- "@2x"
  }
  paste0(sprintf("%s/%s/{zoom}/{x}/{y}%s", baseurl, type, tok),
         "?access_token=",
         get_api_key("mapbox"))
}

mk_query_string_custom <- function(baseurl) {
  paste0(baseurl,
         "?access_token=",
         get_api_key())
}
