# Read all the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Subset onlt two days readings.
interested <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the Date and Time into a single row
interested$datetime <- paste(interested$Date, interested$Time)
interested <- transform(interested, datetime = strptime(datetime, format = "%d/%m/%Y %H:%M:%S"))

# Make a matrix of 4 plots.
png(filename = "plot4.png")

par(mfrow = c(2,2))
# Plot Global active power against time.
with(interested, plot(datetime, Global_active_power, type = "l",
                      xlab = "", ylab = "Global Active Power (kilowatts)"))

# Plot Voltage against time.
with(interested, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

# Plot the 3 sub metering energy data onto the same plot with different colors againt time.
with(interested, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(interested, lines(datetime, Sub_metering_1))
with(interested, lines(datetime, Sub_metering_2, col = "red"))
with(interested, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       bty = "n")

# Plot the global reactive power against time.
par("mfg" = c(2,2,2,2))
with(interested, plot(datetime, Global_reactive_power, type = "l"))

dev.off()