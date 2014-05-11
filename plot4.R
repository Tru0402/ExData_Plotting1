##Exploratory data analysis course project 1
##Plot 1 R code that creates specifed png file

setwd("C:/Users/Brandon/Downloads/exdata-data-household_power_consumption")

data1 <- read.table("household_power_consumption.txt", header = T, sep = ";") ## reading raw data

data2 <- subset(data1, data1$Date == "1/2/2007" | data1$Date == "2/2/2007") ##filter for 2 dates of interest

png(filename="plot4.png")  ##opening png device

data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S") ##modifying dates

par(mfrow = c(2, 2))  ##creating 4th png with4 individual plots

plot(data2$DateTime,as.numeric(type.convert(as.character(data2$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power")

plot(data2$DateTime,as.numeric(type.convert(as.character(data2$Voltage), dec = ".")), type = "l", xlab = "datetime", ylab = "Voltage")

plot(data2$DateTime,as.numeric(type.convert(as.character(data2$Sub_metering_1), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

points(data2$DateTime,as.numeric(type.convert(as.character(data2$Sub_metering_2), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "red")

points(data2$DateTime,as.numeric(type.convert(as.character(data2$Sub_metering_3), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data2$DateTime,as.numeric(type.convert(as.character(data2$Global_reactive_power), dec = ".")), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()





