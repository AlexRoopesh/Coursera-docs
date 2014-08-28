## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.
## install.package(data.table) ## Not Required
## NEI <- readRDS("./data/summarySCC_PM25.rds")
## NCC <- readRDS("./data/Source_Classification_Code.rds")
## NEIDT = data.table(NEI) ## not required
## y <- tapply(NEI$Emissions, NEI$year, sum) 
## y1 <- data.frame(Year=as.character(unique(NEI$year)),Total=y[])
## plot(y1$Year, y1$Total, type="l", lwd=1, ylab="Total Emmsions", xlab="Year",main="USA PM2.5 Emmision Trend")

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## NEIMary <- subset(NEI, fips=="24510")
## y <- tapply(NEIMary$Emissions, NEIMary$year, sum) 
## y1 <- data.frame(Year=as.character(unique(NEIMary$year)),Total=y[])
## plot(y1$Year, y1$Total, type="l", lwd=1, ylab="Total Emmsions", xlab="Year",main="Baltimore City PM2.5 Emmisions", ylim=c(0,3500))

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
## library(ggplot2)
##
## NEIMaryOR <- subset(NEIMary, type=="ON-ROAD")
## t1 <- tapply(NEIMaryOR$Emissions, NEIMaryOR$year, sum)
## t1 <- data.frame(Year=as.character(unique(NEIMaryOR$year)),Total=t1[])
## t1<- cbind(t1,"ON-ROAD")
## 
## NEIMaryNR <- subset(NEIMary, type=="NON-ROAD")
## t2 <- tapply(NEIMaryNR$Emissions, NEIMaryNR$year, sum)
## t2 <- data.frame(Year=as.character(unique(NEIMaryNR$year)),Total=t2[])
## t2<- cbind(t2,"NON-ROAD")
## names(t2)[3] <- "Type"
##
## NEIMaryPO <- subset(NEIMary, type=="POINT")
## t3 <- tapply(NEIMaryPO$Emissions, NEIMaryPO$year, sum)
## t3 <- data.frame(Year=as.character(unique(NEIMaryPO$year)),Total=t3[])
## t3<- cbind(t3,"POINT")
## names(t3)[3] <- "Type"
##
## NEIMaryNP <- subset(NEIMary, type="NONPOINT")
##
## Combining
## cMary <- rbind(t1,t2,t3,t4)
##
## qplot(Year,Total, data=cMary, facets =.~Type) 

## library(sqldf)
## install.packages("RH2")
## library(RH2)
## Across the United States, 
## how have emissions from coal combustion-related sources changed from 1999-2008?
## cNCC<- subset(NCC, grepl("coal|comb", Short.Name, ignore.case = TRUE))
