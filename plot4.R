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
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type ="l", ylab ="Global Active Power (kilowawtts)")
plot(datetime, voltage, type="l", ylab="Voltage")
plot(datetime,subMetering1, ylim =range(c(subMetering1,subMetering2)), type ="l", ylab="Energy Submetering", xlab="")
lines(datetime,subMetering2, ylim =range(c(subMetering1,subMetering2)), type ="l", col="red")
lines(datetime,subMetering3, ylim =range(c(subMetering1,subMetering2)), typ = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", ylab="Global_Reactive_Power")
dev.off()