##############################
## Exploratory Data Analysis #
## CourseProject 2           #
##############################
############################################################################################
## Question 5: How have emissions from motor vehicle sources changed from 1999-2008        #
## in Baltimore City?                                                                      #
############################################################################################
## Reads PM2.5 Emissions Data
NEI <- readRDS("./data/summarySCC_PM25.rds")
## Reads Source Classification Code Table
NCC <- readRDS("./data/Source_Classification_Code.rds")

## Setting up the PNG Devices 
png(file="plot5.png",width=480,height=480)
par(mfrow = c(1,1))

## Subset for Maryland, Baltimore City
NEIMary <- NEI[NEI$fips == "24510",]
## subsetting all mobile or on-road as a proxy for "motor vehicle sources"
## based on our discussions forums and loose application wikipedia definition
mVehicles <- subset(NCC, grepl("Mobile|On-Road", EI.Sector, ignore.case = TRUE))
## Subset Maryland for only motor vehicle related codes
mVehMary <- subset(NEIMary,NEIMary$SCC %in% mVehicles$SCC)
pmeMDVeh <- tapply(mVehMary$Emissions, mVehMary$year, sum) 

pmeMDVehDf <- data.frame(Year=unique(mVehMary$year),Total=pmeMDVeh[])
plot(pmeMDVehDf$Year, pmeMDVehDf$Total, type="l", lwd=1, col="brown", ylab="Total Emissions", xlab="Year",main="Baltimore Motor Vehicles")
## Closing the device
dev.off()