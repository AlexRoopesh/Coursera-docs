##############################
## Exploratory Data Analysis #
## Course Project 2          #
##############################
############################################################################################
## Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad,# 
## nonroad) variable, which of these four sources have seen decreases in emissions from    #
## 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?    #
## Use the ggplot2 plotting system to make a plot answer this question.                    #
############################################################################################

## Loading ggplot libraries
library(ggplot2)

## Reads PM2.5 Emissions Data
NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
NCC <- readRDS("./data/Source_Classification_Code.rds")

## subsetting and summarizing data accroding to the four type, first type=="ON-ROAD"
## including creating a dataframe with column names
NEIMary <- subset(NEI, fips=="24510")

NEIMaryOR <- subset(NEIMary, type=="ON-ROAD")
t1 <- tapply(NEIMaryOR$Emissions, NEIMaryOR$year, sum)
t1 <- data.frame(Year=as.character(unique(NEIMaryOR$year)),Total=t1[])
t1<- cbind(t1,"ON-ROAD")
names(t1)[3] <- "Type"

## Second type == "NON-ROAD"
NEIMaryNR <- subset(NEIMary, type=="NON-ROAD")
t2 <- tapply(NEIMaryNR$Emissions, NEIMaryNR$year, sum)
t2 <- data.frame(Year=as.character(unique(NEIMaryNR$year)),Total=t2[])
t2<- cbind(t2,"NON-ROAD")
names(t2)[3] <- "Type"

## Third type == "POINT"
NEIMaryPO <- subset(NEIMary, type=="POINT")
t3 <- tapply(NEIMaryPO$Emissions, NEIMaryPO$year, sum)
t3 <- data.frame(Year=as.character(unique(NEIMaryPO$year)),Total=t3[])
t3<- cbind(t3,"POINT")
names(t3)[3] <- "Type"

## Fourth type == "NONPOINT"
NEIMaryNP <- subset(NEIMary, type="NONPOINT")
t4 <- tapply(NEIMaryNP$Emissions, NEIMaryNP$year, sum)
t4 <- data.frame(Year=as.character(unique(NEIMaryNP$year)),Total=t4[])
t4 <- cbind(t4,"NONPOINT")
names(t4)[3] <- "Type"


## Combining at the four data frames t1,t2,t3 & t4
 cMary <- rbind(t1,t2,t3,t4)

## plotting
plot3<- qplot(Year,Total, data=cMary, facets =.~Type) 

png("plot3.png")
print(plot3)
dev.off()
