# Exploratory Data Analysis
# Course Project 1
# Ryan Lupinski
# 7/9/2015
#
# plot1.R reads in file household_power_consumption.txt, subsets dates, February 1, 2007 and February 2, 2007,
# and plots a histogram of global active power used over that time period
#
####################################################
# To do: 
# 1. add code to download data from URL, unzip (needed?)
# 2. date/time format not working (not needed for plot1.R?)
####################################################


# read in power consumption data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# 2 subsets of required days
data_1 <- subset(data, data$Date == "1/2/2007")
data_2 <- subset(data, data$Date == "2/2/2007")

# row bind subsets
data_req <- rbind(data_1,data_2)

# format dates
#data_req$Date = as.Date(data_req$Date, format = "%x")
#data_req$Time = strptime(data_req$Time, format = "%X")

# Plot histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(data_req$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

