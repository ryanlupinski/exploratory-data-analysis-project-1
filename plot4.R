# Exploratory Data Analysis
# Course Project 1
# Ryan Lupinski
# 7/9/2015
#
# plot3.R reads in file household_power_consumption.txt, subsets dates, February 1, 2007 and February 2, 2007,
# and displays 4 plots showing global active power, global reactive power, voltage, and
# sub_metering over the 2-day period:
# 
####################################################


# read in power consumption data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# 2 subsets of required days
data_1 <- subset(data, data$Date == "1/2/2007")
data_2 <- subset(data, data$Date == "2/2/2007")

# row bind subsets
data_req <- rbind(data_1,data_2)

# format dates
datetime <- strptime(paste(data_req$Date, data_req$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# 4 data sets to plot

# Global Active Power 
globalActivePower <- as.numeric(data_req$Global_active_power)
# Voltage
voltage <- as.numeric(data_req$Voltage)
# sub metering data
subMetering1 <- as.numeric(data_req$Sub_metering_1)
subMetering2 <- as.numeric(data_req$Sub_metering_2)
subMetering3 <- as.numeric(data_req$Sub_metering_3)
# Global Active Power 
globalReactivePower <- as.numeric(data_req$Global_reactive_power)

# plot all 4 graphs in 1 window
png("plot4.png", width=480, height=480,)


