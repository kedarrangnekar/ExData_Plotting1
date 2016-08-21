setwd("D:/1_DATA SCIENCE SPECIALISATION/4_Exploratory_Data_Analysis_Mar15/Week01/Assignments")

# Reading Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date_Mod <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting Data
data_sub <- data[data$Date_Mod >= "2007-02-01" & data$Date_Mod <= "2007-02-02",]

data_sub$DateTime <- strptime(paste(data_sub$Date_Mod,data_sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Plotting the graphs
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
with(data_sub, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

#Plot 2
with(data_sub, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

# Plot 3
with(data_sub, plot(DateTime,Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = ""))
with(data_sub,lines(DateTime,Sub_metering_2, col = "red"))
with(data_sub,lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


with(data_sub, plot(DateTime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))


dev.off()

