setwd("/Users/will/Documents/R/Housing-association-data")

file_list <- list.files()

for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE, sep=",")
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <- read.csv(file, header=TRUE, sep=",")
    dataset <- rbind.fill(dataset, temp_dataset)
    rm(temp_dataset)
  }
  
}