setwd("D:/1_DATA SCIENCE SPECIALISATION/4_Exploratory_Data_Analysis_Mar15/Week01/Assignments")

# Reading Data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$Date_Mod <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting Data
data_sub <- data[data$Date_Mod >= "2007-02-01" & data$Date_Mod <= "2007-02-02",]
data_sub$Date_Mod_POSIXlt <- as.POSIXct.Date(data_sub$Date_Mod)

data_sub$WeekDay <- strftime(data_sub$Date_Mod, format = "%a")

# Plotting Data
png(filename = "plot2.png", width = 480, height = 480)
with(data_sub, plot(Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n"))
axis(1,c(1,nrow(data_sub)/2,nrow(data_sub)),c("Thu","Fri","Sat"))
dev.off()
