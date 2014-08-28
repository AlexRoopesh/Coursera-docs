##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./data/cameras.csv")
##f1 <- read.csv("./data/Idahohid.csv")
##head(f1)
##fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
## > download.file(fileUrl,destfile="./data/NGAP.xls")
##> library(xlsx)
## d1 <- read.xlsx("./data/getdata-data-DATA.gov_NGAP.xlsx", sheetIndex=1, header=TRUE)
## cInd <- 7:15
##> rInd <- 8:23
## Remove "s" from https to avoid xml not xml error
##fUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
## doc <- xmlTreeParse(fUrl,useInternal=TRUE)
##xpathSApply(rootNode,"//name",xmlValue)
##> table(xpathSApply(rootNode, "//zipcode", xmlValue))
##library(data.table)  
##DT <- fread("./data/Idahohid.csv")
##trial_size <- 200
##collected_results <- numeric(trial_size)
##for (i in 1:trial_size){
##  single_function_time <- system.time(DT[,mean(pwgtp15),by=SEX])
##  sec_funtion_time <- system.time(rowMeans(DT)[DT$SEX==2])
##  collected_results[i] <- single_function_time[1] 
##}
##print(mean(collected_results))

