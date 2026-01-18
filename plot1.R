# Check if file exists before running
if(file.exists("household_power_consumption.txt")) {
  
  # 1. Read the data (this might take 30 seconds)
  # na.strings="?" tells R that question marks mean missing data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
  
  # 2. Subset data for 2007-02-01 and 2007-02-02
  subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  
  # 3. Create the PNG device
  png("plot1.png", width=480, height=480)
  
  # 4. Draw the histogram
  hist(as.numeric(subSetData$Global_active_power), 
       col="red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
  
  # 5. Turn off the device
  dev.off()
  
  print("Success! Check your files pane for plot1.png")
  
} else {
  print("File still not found. Please click Upload in the Files pane.")
}