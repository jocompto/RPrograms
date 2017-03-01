corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
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
   
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  threshold_list <- subset(complete(directory, 1:length(files)), nobs > threshold)[,"id"]
  
  result = numeric(length(threshold_list))
  for (i in seq_along(threshold_list))
  {
    df <- read.csv(files[threshold_list[i]])
    result[i] = cor(df["sulfate"], df["nitrate"], use = "complete.obs")
  }
  
  ## Return a numeric vector of correlations
  result
}
