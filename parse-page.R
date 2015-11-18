parsePage <- function(links) {
  
  #set html to the url for individual HA record
  IndividualHtml <- htmlTreeParse(links, useInternalNodes=T)
  
  #set headings for individual HA page
  headings <- xpathSApply(IndividualHtml, "//strong", xmlValue)
  
  #get the non strong values
  values <- xpathSApply(IndividualHtml, "//strong/following-sibling::text()[1]", xmlValue)
  
  #parse the title of the housing association from the page
  title <- gsub("\n", "",  xpathSApply(IndividualHtml, "//h1[1]", xmlValue))
  
  #write these to a data frame
  d <- data.frame(values, row.names= headings)
  
  #write table to file with url as name
  write.csv(d, file= paste(title, ".csv", sep=""), na="NA", row.names=TRUE)
  
}


