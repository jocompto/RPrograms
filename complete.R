complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Check to see if there are any files in the directory passed
  if(length(list.files(directory)) == -1)
  {
   print("No Files Found - Exiting") 
   return(NULL)  
  }
  
  # adjust the directory passed to the full path name 
    path <- paste(getwd(), directory, sep="/")
  
  # build list of files in the directory - make sure 
  files <- list.files(path, pattern = ".csv", full.names = TRUE)
  index <- files[c(id)]
    
  nobs <- NULL
  
  for (i in 1:length(index)) {
    data <- read.csv(index[i]) 
    x <- sum(complete.cases(data))
    nobs <-c(nobs,x)  
  }
  
 df <-data.frame(id, nobs)
  
 return(df)
  
}