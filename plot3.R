##Exploratory data analysis course project 1
##Plot 1 R code that creates specifed png file

setwd("C:/Users/Brandon/Downloads/exdata-data-household_power_consumption")

data1 <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses = "character") ##Reading in data

data2 <- data1[grepl("^[12]/2/2007", data1[,1]),] ##Filter of specified dates

data2 <- cbind(strptime(paste(data2[,1], data2[,2]), format="%d/%m/%Y %H:%M:%S"), data2[,-c(1,2)]) ##Modifying dates

names(data2) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename="plot3.png", width=480, height=480)

plot(data2$Date, as.numeric(data2$Sub_metering_1), pch=NA, main="", ylab = "Energy Sub Metering", xlab = "") ##creating plot but not with any data

lines(data2$Date, as.numeric(data2$Sub_metering_1), col="black") 
lines(data2$Date, as.numeric(data2$Sub_metering_2), col="red")
lines(data2$Date, as.numeric(data2$Sub_metering_3), col="blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ##creating legend
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"))

dev.off()