##############################
## Exploratory Data Analysis #
## Course Project 2          #
##############################
############################################################################################
## Question 1 : Have total emissions from PM2.5 decreased in the United States from        #
## 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5       #
## emission from all sources for each of the years 1999, 2002, 2005, and 2008.             #
############################################################################################
## Reads PM2.5 Emissions Data
NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
NCC <- readRDS("./data/Source_Classification_Code.rds")

## Setting up the PNG Devices with the dimensions
png(file="plot1.png",width=480,height=480)
par(mfrow = c(1,1))
pmEmmisions <- tapply(NEI$Emissions, NEI$year, sum) 
## Converting to a Dataframe
pmEmmisionsDf <- data.frame(Year=unique(NEI$year),Total=pmEmmisions[])
## Plotting the graph
plot(pmEmmisionsDf$Year, pmEmmisionsDf$Total, type="l", lwd=1, ylab="Total Emissions", xlab="Year",main="USA PM2.5 Emissions")
## Closing the device
dev.off()
