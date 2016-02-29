# Open the PNG graphics device
png(filename="plot4.png",width=480,height=480, bg="transparent")
# Read data
data = read.csv2("household_power_consumption.txt",na.strings = "?")
# Subset the two dates
data2 = subset(data,Date=="1/2/2007" | Date=="2/2/2007")
# Create date-time vector
dt = strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")
# Set 2 by 2 plots
par(mfrow=c(2,2))
# Plot (0,0). Global_active_power needs to be converted from factor to numeric
plot(dt,as.numeric(as.character(data2$Global_active_power)),type="l",xlab="", ylab="Global Active Power (kilowatts)")
# Plot (0,1). Ditto Voltage
plot(dt,as.numeric(as.character(data2$Voltage)),type="l",xlab="datetime", ylab="Voltage")
# Plot (1,0). Ditto sub_meterings
plot(dt,as.numeric(as.character(data2$Sub_metering_1)),type="l",ylab="Energy sub metering", xlab="")
lines(dt,as.numeric(as.character(data2$Sub_metering_2)),type="l",col="red")
lines(dt,as.numeric(as.character(data2$Sub_metering_3)),type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
# Plot (1,1). Ditto Global_reactive_power
plot(dt,as.numeric(as.character(data2$Global_reactive_power)),xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()