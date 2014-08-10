# Read all the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Subset onlt two days readings.
interested <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the Date and Time into a single row
interested$DateTime <- paste(interested$Date, interested$Time)
interested <- transform(interested, DateTime = strptime(DateTime, format = "%d/%m/%Y %H:%M:%S"))

# Plot the 3 sub metering energy data onto the same plot with different colors againt time.
png(filename = "plot3.png")
with(interested, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = ""))
with(interested, lines(DateTime, Sub_metering_1))
with(interested, lines(DateTime, Sub_metering_2, col = "red"))
with(interested, lines(DateTime, Sub_metering_3, col = "blue"))
title(ylab = "Energy sub metering")
legend("topright", lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"))
dev.off()
