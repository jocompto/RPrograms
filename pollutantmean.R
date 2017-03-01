
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  ## 
  ## 'pollutant' is a character vector of length 1 indicating the name of the
  ## pollutant for which we will calculate the mean; either "sulfate" or
  ## "nitrate". 'id' is an integer vector indicating the monitor ID numbers to
  ## be used
  
  
  # build list of files 
  files <- list.files(directory)
 
  #set Working Directory 
  dir <-normalizePath(directory, winslash = "\\" )
  setwd(dir )
  # ensure output is 
  options(digits=4)
  
  ## Initialize vector to hold input
  data <- numeric()
  
  ## Read each file in directory
   for(i in id) {
     currentMonitor <- read.csv(files[as.numeric(i)])
     
     
     if (pollutant == "nitrate"){
       ## Pull data from column 3 of the source data
       colNum<-3
     }
     else {
      ## Pull data from column 2 of the source data
      colNum<-2
    }
    
     data <- append(data,na.omit(currentMonitor[,colNum]))
   }
     
  #return Working Directory 
  setwd(".." )
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  return(mean(data, na.rm=TRUE))
  #
}


  
  