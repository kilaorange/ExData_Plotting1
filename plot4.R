### Exploratory Data Analysis Assignment 1 - 2014-05-11
## Plot 4

setwd("~/Documents/Coursera/dataScienceSpecialisation/exploratoryDataAnalysis")

library(lubridate)

## Read Data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character","character","numeric","numeric",
                                  "numeric","numeric","numeric","numeric")
)
# Convert Date column to date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Pull out relevant date range
d <- data[ which( data$Date >= "2007-02-01" & data$Date <="2007-02-02"), ] 
# Free up some memory
rm(data)

d$DateTime <- strptime(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S" ) 

# open connection to PNG
png(file="plot4.png", width = 480, height = 480, units = "px", bg="transparent")

# Set up global plot config
par(mfrow=c(2,2))

####################
##    Plot A
####################
# make Plot 
plot(d$DateTime , d$Global_active_power, type="n", col="black", xlab="", ylab = "Global Active Power")
lines(d$DateTime , d$Global_active_power)

####################
##    Plot B
####################
# make Plot 
plot(d$DateTime , d$Voltage, type="l", col="black", 
     xlab="datetime", ylab = "Voltage",
     ylim=c(min(d$Voltage), max(d$Voltage))
     )

####################
##    Plot C
####################
# make Plot 
plot(d$DateTime , d$Sub_metering_1, type="n", col="black", xlab="", ylab = "Energy sub metering")
lines(d$DateTime, d$Sub_metering_1, col="black")
lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lty=1,
       bty ="n")

####################
##    Plot D
####################
# make Plot 
plot(d$DateTime , d$Global_reactive_power, type="l", 
     col="black", xlab="datetime", ylab = "Global_reactive_power",
     ylim=c(min(d$Global_reactive_power), max(d$Global_reactive_power))
     )

# Turn off device
dev.off()





