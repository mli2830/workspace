library(RCurl)
url <- "http://apps.who.int/gho/data/view.ebola-sitrep.ebola-summary-latest?lang=en"
download.file(url,destfile = "temp.txt")