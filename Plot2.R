##############################
## Exploratory Data Analysis #
## Course Project 2          #
##############################
############################################################################################
## Question 2 : Have total emissions from PM2.5 decreased in the Baltimore City,           #
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to           #
## make a plot answering this question.                                                    # 
############################################################################################
## Reads PM2.5 Emissions Data
NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
NCC <- readRDS("./data/Source_Classification_Code.rds")

## Setting up the PNG Devices 
png(file="plot2.png",width=480,height=480)
par(mfrow = c(1,1))

## Subsetting data for only Maryland fips=="24150"
NEIMary <- subset(NEI, fips=="24510")
pmEmmisions <- tapply(NEIMary$Emissions, NEIMary$year, sum) 
## Converting to a Dataframe
pmEmmisionsDf <- data.frame(Year=unique(NEIMary$year),Total=pmEmmisions[])
## Plotting the graph
plot(pmEmmisionsDf$Year, pmEmmisionsDf$Total, type="l", lwd=1, ylab="Total Emissions", xlab="Year",main="Baltimore City PM2.5 Emissions", ylim=c(0,3500))
## Closing the device
dev.off()
