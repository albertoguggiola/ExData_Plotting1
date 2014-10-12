# Plot 4 of the first assignment in Expl. Data Anal. course

#######################################################################
# Four-panel plot of various characteristics of the assigned datafile #
#######################################################################

# The figure is printed in the plot4.png file

# Reading the data
data<-read.csv("household_power_consumption.txt", sep=";")

# Subsetting the requested dates 
data<-subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data[data == "?"] <- NA

# Setting the output file and 
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2, 2))


# Preprocessing the data, merging the information of date and time in a single column
data1<-within(data, { timestamp=as.POSIXct(paste(data$Date, data$Time), 
                                           format="%d/%m/%Y %H:%M:%S")})


# First panel
plot(data1$timestamp, as.numeric(levels(data1$Global_active_power))
     [data1$Global_active_power], ylab="Global active power", xlab="", type="n")
lines(data1$timestamp, as.numeric(levels(data1$Global_active_power))
      [data1$Global_active_power])

# Second panel
plot(data1$timestamp, as.numeric(levels(data1$Voltage))[data1$Voltage], 
     ylab="Voltage", xlab="datetime", type="n")
lines(data1$timestamp, as.numeric(levels(data1$Voltage))[data1$Voltage])

# Third panel
plot(data1$timestamp, as.numeric(levels(data1$Sub_metering_1))
     [data1$Sub_metering_1], type="n", ylab="Energy sub metering", xlab="")

lines(data1$timestamp, as.numeric(levels(data1$Sub_metering_1))
      [data1$Sub_metering_1])
lines(data1$timestamp, as.numeric(levels(data1$Sub_metering_2))
      [data1$Sub_metering_2], col="red")
lines(data1$timestamp, data1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "blue", "red"), lwd=2, bty="n")

# Fourth panel
plot(data1$timestamp, as.numeric(levels(data1$Global_reactive_power))
     [data1$Global_reactive_power], ylab="Global_reactive_power", 
     xlab="datetime", type="n")
lines(data1$timestamp, as.numeric(levels(data1$Global_reactive_power))
      [data1$Global_reactive_power])

dev.off()