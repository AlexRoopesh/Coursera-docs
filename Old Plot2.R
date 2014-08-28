## Plot2.R to create a  line graph of Global Active Power over the days
hpc <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
hpc$DateTime <- paste(hpc$Date, hpc$Time)  
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")
hpc1 <- hpc[hpc$DateTime >= as.POSIXct("2007-02-01 00:00:00") & hpc$DateTime <= as.POSIXct("2007-02-03 00:00:00"), ] 

png(file="plot2.png",width=480,height=480)
par(mfrow = c(1,1))
plot(hpc1$DateTime, hpc1$Global_active_power, type="l", lwd=1, ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()
