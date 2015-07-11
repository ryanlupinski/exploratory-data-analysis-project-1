# Exploratory Data Analysis
# Course Project 1
# Ryan Lupinski
# 7/9/2015
#
# plot2.R reads in file household_power_consumption.txt, subsets dates, February 1, 2007 and February 2, 2007,
# and plots Global Active Power over above time period
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

# Global Active Power 
globalActivePower <- as.numeric(data_req$Global_active_power)

# Plot Global Active Power over time
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type ="l", ylab ="Global Active Power (kilowawtts)")
dev.off()
