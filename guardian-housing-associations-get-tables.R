d <- data.frame()

this <- t(data.frame(values))

this <- colnames(this) <- headings

this <- cbind(title, this)

library(XML)

#set WD
setwd("~/Documents/R/Housing-association-data")

#get all the urls for HAs from this page: "http://www.theguardian.com/housing-network/2012/jun/08/housing-association-profiles"
indexUrl <- "http://www.theguardian.com/housing-network/2012/jun/08/housing-association-profiles" 

#set html to the url for individual HA record
html <- htmlTreeParse(indexUrl, useInternalNodes=T)

#use xpath to get all of the links for each HA record
links <- xpathSApply(html, "//p//a", xmlGetAttr, "href")

#loop through each link, and return the data table for each HA
parsePage <- function(links) {
  
  #create empty data frame for later
  d <- data.frame()
  
  #set html to the url for individual HA record
  IndividualHtml <- htmlTreeParse(links, useInternalNodes=T)
  
  #set headings for individual HA page
  headings <- xpathSApply(IndividualHtml, "//strong", xmlValue)
  
  #get the non strong values
  values <- xpathSApply(IndividualHtml, "//strong/following-sibling::text()[1]", xmlValue)
  
  #parse the title of the housing association from the page
  title <- gsub("\n", "",  xpathSApply(IndividualHtml, "//h1[1]", xmlValue))
  
  #write values to a data frame and transpose to a row
  v <- data.frame(t(values))
  
  #set colnames for table to be the headings
  #colnames(v) <- headings
  
  #bind the title to a column
  v <- cbind(title, v)
  
  #bind the row to the empty data frame
  d <- rbind.fill(d, v)
  
  #write table to file with url as name
  write.csv(d, file= paste(title, ".csv", sep=""), na="NA")
  
}

lapply(links, parsePage)



