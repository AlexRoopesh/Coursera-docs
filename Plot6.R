##############################
## Exploratory Data Analysis #
## Course Project 2          #
##############################
############################################################################################
## Question 6: Compare emissions from motor vehicle sources in Baltimore City with        ##
## emissions from motor vehicle sources in Los Angeles County,                            ## 
## California (fips == "06037"). Which city has seen greater changes over                 ##
## time in motor vehicle emissions?                                                       ##             #
############################################################################################
## Reads PM2.5 Emissions Data
NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
NCC <- readRDS("./data/Source_Classification_Code.rds")

## Setting up the PNG Devices 
png(file="plot6.png",width=960,height=480)
par(mfrow = c(1,2))

## subsetting all mobile or on-road as a proxy for "motor vehicle sources"
## based on our discussions forums and loose application wikipedia definition
mVehicles <- subset(NCC, grepl("Mobile|On-Road", EI.Sector, ignore.case = TRUE))

## Subset for Baltimore city
NEIMD <- NEI[NEI$fips == "24510",]
## Subset Baltimore for only motor vehicle related codes
mVehMD <- subset(NEIMD,NEIMD$SCC %in% mVehicles$SCC)

## Creating a subset with summary of Baltimore Emissions Data
t1 <- tapply(mVehMD$Emissions, mVehMD$year, sum)
t1 <- data.frame(Year=as.character(unique(NEIMD$year)),Total=t1[])

## Subset for Los Angeles
NEILA <- NEI[NEI$fips == "06037",]

## Subset LA for only motor vehicle related codes
mVehLA <- subset(NEILA,NEILA$SCC %in% mVehicles$SCC)

## Creating a subset with summary of Los Angeles Emissions Data
t2 <- tapply(mVehLA$Emissions, mVehLA$year, sum)
t2 <- data.frame(Year=as.character(unique(NEILA$year)),Total=t2[])

## Pleas note that the scale  for Balitmore 
## is being set as the same LA to understand total quantities on same scale
plot(as.character(t1$Year), t1$Total, ylab="Total Emissions", xlab="Year",main="Motor Vehicles Baltimore",type="l", lwd=1, col="blue", ylim=c(0,11000))

plot(as.character(t2$Year), t2$Total, ylab="Total Emissions", xlab="Year",main="Motor Vehicles LA",type="l", lwd=1, col="red")## Closing the device
dev.off()