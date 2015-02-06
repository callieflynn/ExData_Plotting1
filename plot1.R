##This file reads in “Individual household electric power consumption Data Set” 
##and analyzes how household energy usage varies over a 2-day period in February, 2007.

##Step One: Read the data
powerUse <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##Subset data to the 2-day period, Feb 1 and 2 2007
feb <- subset(powerUse, Date=="1/2/2007" | Date=="2/2/2007")
rownames( feb ) <- seq_len( nrow( feb ) )

##Get ride of big dataset
rm(powerUse)

##Step Two: Create a histogram of Global Active Power with 11 breaks
##Construct the plot, save it as PNG with a width of 480 pixels and a height of 480 pixels.
png(filename="plot1.png", width=480, height=480)
hist(feb$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
##Close the png file
dev.off()
