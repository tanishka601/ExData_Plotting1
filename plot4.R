# Plot 4

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- as.POSIXct(paste(data$Date, data$Time),
                       format = "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(datetime, data$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power")

plot(datetime, data$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(datetime, data$Sub_metering_1,
     type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

plot(datetime, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()

