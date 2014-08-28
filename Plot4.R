##############################
## Exploratory Data Analysis #
## Course Project 2         #
##############################
############################################################################################
## Question 4: Across the United States, how have emissions from coal combustion-related   #
## sources changed from 1999-2008?                                                         #
############################################################################################
## Reads PM2.5 Emissions Data
##NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
##NCC <- readRDS("./data/Source_Classification_Code.rds")

## Setting up the PNG Devices 
png(file="plot4.png",width=480,height=480)
par(mfrow = c(1,1))

## with the lack of a better definition , selecting all codes which has either coal or 
## comb(short for combustion) in the Short.Name column
cNCC<- subset(NCC, grepl("coal|comb", Short.Name, ignore.case = TRUE))
## Subsetting only the PM2.5 data realted to the coal and combustion codes
eUsa <- subset(NEI,NEI$SCC %in%  cNCC$SCC)
pmeUsa <- tapply(eUsa$Emissions, eUsa$year, sum) 

pmeUsaDf <- data.frame(Year=unique(eUsa$year),Total=pmeUsa[])
plot(pmeUsaDf$Year, pmeUsaDf$Total, type="l", lwd=1, col="orange", ylab="Total Emissions", xlab="Year",main="USA coal combustion")

## Closing the device
dev.off()