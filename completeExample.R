completeEx <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used

## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041 
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

#Create the character vector of the directory you want to use

storeDirectory <- paste0(getwd(),"/",directory,"/")

#Creates specdata directory
    if(dir.create(directory,showWarnings = FALSE) != 0)
    {
    dir.create(directory,showWarnings = FALSE)
    }
  #Downloads compressed specdata files if 
  #specdata directory is empty

if(length(list.files(directory)) == 0)
  {
  download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip",destfile = paste0(storeDirectory,"specdata.zip"),method = "internal") #downloads file
  unzip(zipfile = paste0(storeDirectory,"specdata.zip")) #unzips monitor files
  }

fileNames <- list.files(storeDirectory) #store the names of the CSV files
  zipLoc <- grep(pattern = ".zip",x = fileNames, fixed = TRUE) #location of specdata.zip

if(length(zipLoc) > 0) #Checks if the zipped file is in the directory
  {
  fileNames <- fileNames[-zipLoc] # Remove the zipfile from the file name list
  }

fileNameVector <- paste0(storeDirectory,fileNames) #pastes the directory name to each CSV file

fileDataList <- lapply(1:length(fileNameVector), function(index) read.csv(fileNameVector[index])) #creates a dataframe for each monitor

numComp <- lapply(1:length(fileNameVector), function(index) {sum(complete.cases(  fileDataList[[index]]))} ) #number of complete.cases

numCompVec <- unlist(numComp) #stores the number of complete cases for each monitor in the data set in a vector

#completeObsFrame - a dataframe of monitor ids which are stored in the first column
  # and the number of complete cases for each monitor stored in the second column
  completeObsFrame <- data.frame(cbind(1:length(fileNameVector),numCompVec))

colnames(completeObsFrame) <- c("id","nobs")

return(completeObsFrame[id,]) #returns the relevant rows in the complete cases data frame based on id number

}