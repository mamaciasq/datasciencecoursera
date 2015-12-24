weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}





pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE) # creates a list of files
  dat <- data.frame()         # Creates an empty data frame
  for (i in 1:332){
    # loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i])) 
  }
  dat_subset <- dat[which(dat[, "ID"] == id),] #subsets the rows that match the 'day' argument
  if (pollutant == "sulfate") {
    ## loops that identifies the mean of the subset
    mean(dat_subset[,"sulfate"], na.rm = TRUE)
  } else {
    mean(dat_subset[,"nitrate"], na.rm = TRUE)
  }
}

pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 1:10)


## Concatenando archivos en un solo data frame
files_list <- list.files("specdata", full.names = TRUE)
dat <- data.frame()         # Creates an empty data frame
for (i in 1:332){
  # loops through the files, rbinding them together 
  dat <- rbind(dat, read.csv(files_list[i])) 
}
#########

## 
identi <- subset(dat, ID %in% c(2, 4, 8, 10, 12)); identi
good <- complete.cases(identi)
identi[good,][,]
x <- data.frame(id = c(2, 4, 8, 10, 12), nobs = sum(good)); x




summary(good)
sum(good)
class(identi)
na <- subset(dat, ID %in% 1, select = c(sulfate, nitrate))
sum(!is.na(na))
bad_sulfate <- is.na(na_sulfate)
names(identi)
dim(identi)


data.frame(1, nobs)




class(dat)
subset(dat$ID, dat$sulfate)
dat_subset <- subset(dat$ID == 1, dat$sulfate)
dat_subset
mean(dat_subset[,"sulfate"], na.rm = TRUE)
dim(dat_subset)
names(dat_subset)
#####################

dat
head(dat)
tail(dat)
subs <- subset(dat, ID == 1:2); subs

files_list <- list.files(directory, full.names = TRUE) # creates a list of files
dat <- data.frame()         # Creates an empty data frame
for (i in 1:332){
  # loops through the files, rbinding them together 
  dat <- rbind(dat, read.csv(files_list[i])) 
}




x <- airquality[, -1] # x is a regression design matrix
y <- airquality[,  1] # y is the corresponding response
x;y
stopifnot(complete.cases(y) != is.na(y));
ok <- complete.cases(x, y);ok
sum(!ok) # how many are not "ok" ?
x <- x[ok,]
y <- y[ok]
x
y
