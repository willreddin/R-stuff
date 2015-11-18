library(maps)

fertility <-
  read.csv("http://book.flowingdata.com/ch08/points/adol-fertility.csv")

map('world', fill=FALSE, col='#cccccc')
symbols(fertility$longitude, fertility$latitude, 
        circles=sqrt(fertility$ad_fert_rate), add=TRUE, inches=0.08, bg="#93ceef", fg="#ffffff")


