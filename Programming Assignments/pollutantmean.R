## Downloading the file from the web and unzipping it into my working directory
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")

## Get a list of the files that are into specdata folder
list.files("specdata")

## Let's take a look at 332.csv to see what's inside:
inside <- read.csv("specdata/332.csv")
head(inside)

## Length of the 'Date' column:
length(inside$Date)

## Characteristics of the data.frame:
dim(inside)
str(inside)
summary(inside)
names(inside)

## Date value in 725 row
inside[725, "Date"]

## Subset of the "Date" column where "sulfate" is equal to 2.940
inside[which(inside$sulfate == 2.940), "Date"]
inside[which(inside[,"sulfate"] == 2.940), "Date"]
subset(inside$Date, inside$sulfate == 2.940)

## Assign inside's starting and ending Date to vectors:
inside_start <- inside [1, "Date"]
inside_end <- inside [731, "Date"]

