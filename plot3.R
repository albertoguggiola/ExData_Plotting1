# Plot 3 of the first assignment in Expl. Data Anal. course

#############################################################################
# Curve of three different energy sub-metering during 1/2/2007 and 2/2/2007 #
#############################################################################

# The histogram is printed in the plot3.png file

# Reading the data
data<-read.csv("household_power_consumption.txt", sep=";")

#Subsetting the requested dates
data<-subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data[data == "?"] <- NA

# Preprocessing the data, merging the information of date and time in a single column
data1<-within(data, { timestamp=as.POSIXct(paste(data$Date, data$Time), 
                                           format="%d/%m/%Y %H:%M:%S")})

# Setting the output file and generating an empty plot
png(file="plot3.png", width=480, height=480, units="px")
plot(data1$timestamp, as.numeric(levels(data1$Sub_metering_1))
     [data1$Sub_metering_1], type="n", ylab="Energy sub metering", xlab="")

# Plotting the requested three lines on the previous empty plot
lines(data1$timestamp, as.numeric(levels(data1$Sub_metering_1))
      [data1$Sub_metering_1])
lines(data1$timestamp, as.numeric(levels(data1$Sub_metering_2))
      [data1$Sub_metering_2], col="red")
lines(data1$timestamp, data1$Sub_metering_3, col="blue")

# Setting the legend as in the example figure
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "blue", "red"), lwd=2, bty="n")

dev.off()