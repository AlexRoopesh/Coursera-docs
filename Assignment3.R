## > setwd("C:/Users/alex.abraham/Documents/Coursera R")
#3getwd()
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./data/ss06hid.csv
## dt2 <- dt1[(dt1$ACR==3 & dt1$AGS==6),]
##> head(dt2[which(dt2$ACR==3 & dt2$AGS==6),])
##install.packages("jpeg")
## library(jpeg)
##  a<- readJPEG("./data/getdata-jeff.jpg", native = TRUE)
##> quantile(a, probs=seq(0,1, .3))
##quantile(a, probs=seq(0,1, .8))
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./data/GDP.csv")
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="./data/FEDstats.csv")
##> GDP <- read.csv("./data/GDP.csv")
##> FedStats <- read.csv("./data/FEDstats.csv")
##mergedGdp <- merge(GDP,FedStats,by.x="X", by.y="CountryCode",all=TRUE)
## mergedGdp2$gGroup <- cut(as.numeric(mergedGdp2$Gross.domestic.product.2012), breaks=quantile(as.numeric(mergedGdp2$Gross.domestic.product.2012), probs=seq(0,1,0.2),na.rm=TRUE))
##  table(mergedGdp2$gGroup)
##tapply(as.numeric(mergedGdp2$Gross.domestic.product.2012), mergedGdp2$Income.Group, count)
##write.csv(mergedGdp2, file="./data/mergedGdp2.csv")
## > Url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
##> download.file(Url, destfile="./data/cameras.csv")
## > cameraData <- read.csv("./data/cameras.csv")
##> download.file(url, destfile="./ussc.csv")
##url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
##download.file(url, destfile="./ggdp.csv")
## ggdp <- read.csv("./ggdp.csv")
##gnos <- gsub(",", "", ggdp$X.3)
##g2 <- gnos[5:194]
##g3 <- gsub(" ", "", g2)
##mean(as.numeric(g3))
##> countryNames <- ggdp$X.2
##install.packages("quantmod")
##amzn = getSymbols("AMZN",auto.assign=FALSE)
##sampleTimes = index(amzn) 
##> length(grep("2012",sampleTimes))

