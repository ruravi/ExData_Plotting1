# Read all the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Subset onlt two days readings.
interested <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the Date and Time into a single row
interested$DateTime <- paste(interested$Date, interested$Time)
interested <- transform(interested, DateTime = strptime(DateTime, format = "%d/%m/%Y %H:%M:%S"))

# Plot the time series data.
png(filename = "plot2.png")
with(interested, plot(DateTime, Global_active_power, type = "l", xlab = "",
                      ylab = "Global Active Power (kilowatts)"))
dev.off()