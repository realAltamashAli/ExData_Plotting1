# 1. Read and subset data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2. Prepare variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subSetData$Global_active_power)
grp <- as.numeric(subSetData$Global_reactive_power)
vol <- as.numeric(subSetData$Voltage)
sub1 <- as.numeric(subSetData$Sub_metering_1)
sub2 <- as.numeric(subSetData$Sub_metering_2)
sub3 <- as.numeric(subSetData$Sub_metering_3)

# 3. Create PNG with 2x2 layout
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Top-Left
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Top-Right
plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")
# Bottom-Left
plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
# Bottom-Right
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

print("plot4.png created!")