# Plot 2

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- as.POSIXct(paste(data$Date, data$Time),
                       format = "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot(datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

