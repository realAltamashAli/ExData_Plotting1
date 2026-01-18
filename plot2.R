# 1. Read and subset data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2. Combine Date and Time into a single DateTime object
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)

# 3. Create PNG
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

print("plot2.png created!")