## Plot3.R to create a  line graph of sub metering 1,2 &3 over the days
hpc <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
hpc$DateTime <- paste(hpc$Date, hpc$Time)  
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")
hpc1 <- hpc[hpc$DateTime >= as.POSIXct("2007-02-01 00:00:00") & hpc$DateTime <= as.POSIXct("2007-02-03 00:00:00"), ] 

png(file="plot3.png",width=480,height=480)
par(mfrow = c(1,1))
plot(hpc1$DateTime, hpc1$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy Sub Metering")
lines(hpc1$DateTime, hpc1$Sub_metering_2, type="l",col="red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), lty=1, cex=.75)
dev.off()
