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
png(filename="plot4.png", width=480, height=480)

##Need the date/time as one for this plot
feb$Datetime <- strptime(paste(feb$Date, feb$Time), format="%d/%m/%Y %H:%M:%S")

##Display 4 separate graphs at once: 2 rows, 2 columns
par(mfrow = c(2,2))

with(feb, {
  ##Plot 1
  plot(Datetime, Global_active_power, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  ##Plot 2
  plot(Datetime, Voltage, type="l",
       ylab="Voltage", xlab="datetime")  
  ##Plot 3
  plot(Datetime, Sub_metering_1, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Datetime, Sub_metering_2, type="l",col="red")
  lines(Datetime, Sub_metering_3, type="l",col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=2.5, col=c("black", "red","blue"))
  ##Plot 4
  plot(Datetime, Voltage, type="l",
       ylab="Global_reactive_power", xlab="datetime")
  
})

##Close the png file
dev.off()
