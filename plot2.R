# Open the PNG graphics device
png(filename="plot2.png",width=480,height=480, bg="transparent")
# Read data
data = read.csv2("household_power_consumption.txt",na.strings = "?")
# Subset the two dates
data2 = subset(data,Date=="1/2/2007" | Date=="2/2/2007")
# Create date-time vector
dt = strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")
# Plot. Global_active_power needs to be converted from factor to numeric
plot(dt,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()