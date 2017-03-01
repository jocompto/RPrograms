##Getting & Cleaning Data Quiz 1 Work
## 
setwd("C:/Users/jcompto8/Documents/R Programs/CleanDataProject")
filename <- "getdata-data-ss06hid.csv"
dataset <- read.csv( filename) 
sum(na.omit(dataset$VAL) == 24)
summary(na.omit(dataset$FES))

##Question 3
filename <- "getdata-data-DATA.gov_NGAP.xlsx"
dat <- read.xls2( filename,,,startRow=18, endRow=23,colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

#Q3 modified
filename <- "book2.csv"
dat <- read.csv( filename) 
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4
cls()

require(XML)
filename <- "getdata-data-restaurants.xml"
dt <- xmlParseDoc(filename )
sum("dt@zipcode" == "21231" )
# no answer 

#Q5
require(data.table)
DT = fread( filename  )


DT[,mean(pwgtp15), by=SEX]