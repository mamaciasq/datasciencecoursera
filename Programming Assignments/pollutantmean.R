pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE) # creates a list of files
  dat <- data.frame()         # Creates an empty data frame
  for (i in 1:332){
    # loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i])) 
  }
  dat_subset <- subset(dat, ID %in% id) #subsets the rows that match the 'day' argument
  if (pollutant == "sulfate") {
    ## loops that identifies the mean of the subset
    mean(dat_subset[,"sulfate"], na.rm = TRUE)
  } else {
    mean(dat_subset[,"nitrate"], na.rm = TRUE)
  }
}
