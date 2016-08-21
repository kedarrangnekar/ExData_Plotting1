setwd("D:/1_DATA SCIENCE SPECIALISATION/4_Exploratory_Data_Analysis_Mar15/Week01/Assignments")

# Reading Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date_Mod <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting Data
data_sub <- data[data$Date_Mod >= "2007-02-01" & data$Date_Mod <= "2007-02-02",]

data_sub$DateTime <- strptime(paste(data_sub$Date_Mod,data_sub$Time), format = "%Y-%m-%d %H:%M:%S")


# Plotting Data
png(filename = "plot2.png", width = 480, height = 480)
with(data_sub, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

