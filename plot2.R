### Exploratory Data Analysis Assignment 1 - 2014-05-11
## Plot 2

setwd("~/Documents/Coursera/dataScienceSpecialisation/ExData_Plotting1")

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
##    Plot 2
####################
# open connection to PNG
png(file="plot2.png", width = 480, height = 480, units = "px", bg="transparent")

# make Plot 
plot(d$DateTime , d$Global_active_power, type="n", col="black", xlab="", ylab = "Global Active Power (kilowatts)")
lines(d$DateTime , d$Global_active_power)

dev.off()
