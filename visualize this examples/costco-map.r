library(maps)

costcos <- read.csv("http://book.flowingdata.com/ch08/geocode/costcos-geocoded.csv", sep=",")

map(database="state", col="#cccccc")

symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff",
        lwd=0.5, circles=rep(1, length(costcos$Longitude)), 
        inches=0.03, add=TRUE)