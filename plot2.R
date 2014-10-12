# Plot 2 of the first assignment in Expl. Data Anal. course

#################################################################
# Line Plot of Global Active Power during 1/2/2007 and 2/2/2007 #
#################################################################

# The figure is printed in the plot2.png file

# Reading the data file
data<-read.csv("household_power_consumption.txt", sep=";")

# Subsetting the requested dates
data<-subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data[data == "?"] <- NA

# Setting the output file
png(file="plot2.png", width=480, height=480, units="px")

# Preprocessing the data, merging the information of date and time in a single column
data1<-within(data, { timestamp=as.POSIXct(paste(data$Date, data$Time), 
                                           format="%d/%m/%Y %H:%M:%S")})

# Generating an empty plot
plot(data1$timestamp, as.numeric(levels(data$Global_active_power)) 
     [data$Global_active_power], type="n", 
     ylab="Global Active Power (kilowatts)", xlab="")

# Adding the requested line on the previous empty plot
lines(data1$timestamp, as.numeric(levels(data$Global_active_power))
      [data$Global_active_power])

dev.off()