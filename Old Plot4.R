GET## Plot4.R to multiple views of global power in a 2 X 2 frame
hpc <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
hpc$DateTime <- paste(hpc$Date, hpc$Time)  
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")
hpc1 <- hpc[hpc$DateTime >= as.POSIXct("2007-02-01 00:00:00") & hpc$DateTime <= as.POSIXct("2007-02-03 00:00:00"), ] 

png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(hpc1$DateTime, hpc1$Global_active_power, type="l", lwd=1, ylab="Global Active Power", xlab="")
plot(hpc1$DateTime, hpc1$Voltage, type="l", lwd=1, ylab="Voltage", xlab="datetime")
plot(hpc1$DateTime, hpc1$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy Sub Metering")
lines(hpc1$DateTime, hpc1$Sub_metering_2, type="l",col="red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1, bty="n", cex=1)
plot(hpc1$DateTime, hpc1$Global_reactive_power, type="l", lwd=1, ylab="Global_reactive_power", xlab="datetime")
dev.off()