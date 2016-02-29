# Open the PNG graphics device
png(filename="plot1.png",width=480,height=480, bg="transparent")
# Read data
data = read.csv2("household_power_consumption.txt",na.strings = "?")
# Subset the two dates
data2 = subset(data,Date=="1/2/2007" | Date=="2/2/2007")
# Plot. Global_active_power needs to be converted from factor to numeric
hist(as.numeric(as.character(data2$Global_active_power)), main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
