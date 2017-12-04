## finding addresses in United States

clean_loc = function(location) {
  
  result <- location
  
  if (grepl("United States", location, fixed = TRUE)) {
    result = sub(".*, (.+), (.+), United States(.*)", "\\1, \\2", location)
  } else {
    result  = ""
  }
  
  result
}