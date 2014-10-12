# Plot 1 of the first assignment in Expl. Data Anal. course

#################################################################
# Histogram of Global Active Power during 1/2/2007 and 2/2/2007 #
#################################################################

# The histogram is printed in the plot1.png file

# Reading of the data file
data<-read.csv("household_power_consumption.txt", sep=";")

# Subsetting just the two requested days of the data
data<-subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")
data[data == "?"] <- NA

# Setting the output file
png(file="plot1.png", width=480, height=480, units="px")

# Plot command with options set as the example figure on coursera website
with(data, hist(as.numeric(levels(data$Global_active_power))
                [data$Global_active_power], main="Global Active Power", 
                xlab="Global Active Power (kilowatts)", col="red"))

dev.off()