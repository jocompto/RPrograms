add2 <- function(x,y){
  # Simple function to add 2 numbers 
  x+y
}

above10 <- function(x){
# function to return values from a vector greater than 10  
  use <- x > 10
  x[use]
}

aboveN <- function(x, n = 10){
  # function to return values from a vector greater than N
  use <- x > n
  x[use]
}

columnMean <- function(y, removeNA = TRUE){
  # function to return column mean values from a matrix of n columns
  
  # determine the number of columns in matrix array
  nc <-ncol(y)
  
  # create a empty return vector based on the number of columns 
  means <- numeric(nc)
  
  # loop through for each column and calculate the mean value
  for(i in 1:nc){
    means[i] <-mean(y[,i], na.rm = removeNA)
  }
  # return the means array
  means
}

freeZ <- function(x,y){
  # example of a use of a free (global) variable
  x^2 + y/z
}

y <-10
f <- function(x){
  y <-2
  y^2 + g(x)
}

g <- function(x){
  x*y
}