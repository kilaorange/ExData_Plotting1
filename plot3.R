### Exploratory Data Analysis Assignment 1 - 2014-05-11
## Plot 3

setwd("~/Documents/Coursera/dataScienceSpecialisation/exploratoryDataAnalysis")

# Install Required packages
if( grep( "lubridate", .packages(all.available=TRUE)) < 1 ){
      install.packages("lubridate")
}

# require(pkg) || install.packages(pkg) 

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

####################
##    Plot 3
####################
# open connection to PNG
png(file="plot3.png", width = 480, height = 480, units = "px", bg="transparent")

# make Plot 
plot(d$DateTime , d$Sub_metering_1, type="n", col="black", xlab="", ylab = "Energy sub metering")
lines(d$DateTime, d$Sub_metering_1, col="black")
lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()



