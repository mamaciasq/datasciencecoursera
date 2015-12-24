complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE) # creates a list of files
  dat <- data.frame()         # Creates an empty data frame
  for (i in 1:332){
    # loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i])) 
  }
  
  dat_subset <- subset(dat, ID %in% id) #subsets the rows that match the 'day' argument
  
  good <- complete.cases(dat_subset)
  dat_subset[good]
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}
complete("specdata", 1)

## Sin funciones
files_list <- list.files(directory, full.names = TRUE) # creates a list of files
dat <- data.frame()         # Creates an empty data frame
for (i in 1:332){
  # loops through the files, rbinding them together 
  dat <- rbind(dat, read.csv(files_list[i])) 
}

dat_subset <- subset(dat, ID %in% id)