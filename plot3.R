# Exploratory Data Analysis
# Course Project 1
# Ryan Lupinski
# 7/9/2015
#
# plot3.R reads in file household_power_consumption.txt, subsets dates, February 1, 2007 and February 2, 2007,
# and plots 3 sub_metering categories over the 2-day period:
# sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
# sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
# sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
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

# sub metering data
subMetering1 <- as.numeric(data_req$Sub_metering_1)
subMetering2 <- as.numeric(data_req$Sub_metering_2)
subMetering3 <- as.numeric(data_req$Sub_metering_3)

png("plot3.png", width=480, height=480,)
plot(datetime,subMetering1, ylim =range(c(subMetering1,subMetering2)), type ="l", ylab="Energy Submetering", xlab="")
lines(datetime,subMetering2, ylim =range(c(subMetering1,subMetering2)), type ="l", col="red")
lines(datetime,subMetering3, ylim =range(c(subMetering1,subMetering2)), typ = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()

dev.off()