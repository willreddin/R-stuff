writeTable <- function(url){

#set url
url <- links[3]

#set html to the url for individual HA record
IndividualHtml <- htmlTreeParse(url, useInternalNodes=T)

#set headings for individual HA page
headings <- xpathSApply(IndividualHtml, "//strong", xmlValue)

#get the non strong values
values <- xpathSApply(IndividualHtml, "//strong/following-sibling::text()[1]", xmlValue)

#write these to a data frame called table
d <- data.frame(values, row.names= headings)
}