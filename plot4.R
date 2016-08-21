setwd("D:/1_DATA SCIENCE SPECIALISATION/4_Exploratory_Data_Analysis_Mar15/Week01/Assignments")

# Reading Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date_Mod <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting Data
data_sub <- data[data$Date_Mod >= "2007-02-01" & data$Date_Mod <= "2007-02-02",]
data_sub$Date_Mod_POSIXlt <- as.POSIXct.Date(data_sub$Date_Mod)

data_sub$WeekDay <- strftime(data_sub$Date_Mod, format = "%a")
data_sub$SrNo <- 1:nrow(data_sub)

# Plotting the graphs
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(data_sub, plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n"))
axis(1,c(1,nrow(data_sub)/2,nrow(data_sub)),c("Thu","Fri","Sat"))

with(data_sub, plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n"))
axis(1,c(1,nrow(data_sub)/2,nrow(data_sub)),c("Thu","Fri","Sat"))

with(data_sub, plot(SrNo,Sub_metering_1, type = "n",xlab = "", ylab = "Energy sub metering", col = "black", xaxt = "n"))
with(subset(data_sub, select = c(SrNo,Sub_metering_1)), lines(SrNo,Sub_metering_1, col = "black"))
with(subset(data_sub, select = c(SrNo,Sub_metering_2)), lines(SrNo,Sub_metering_2, col = "red"))
with(subset(data_sub, select = c(SrNo,Sub_metering_3)), lines(SrNo,Sub_metering_3, col = "blue"))
axis(1, c(1,nrow(data_sub)/2,nrow(data_sub)), c("Thu","Fri","Sat"))
legend("topright", pch = "____", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(data_sub, plot(Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n"))
axis(1,c(1,nrow(data_sub)/2,nrow(data_sub)),c("Thu","Fri","Sat"))

dev.off()