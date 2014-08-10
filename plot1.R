# Read all the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Subset onlt two days readings.
interested <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Plot a histogram of GlobalActivePower.
png(filename = "plot1.png")
with(interested, hist(Global_active_power, col = "red", main = "Global Active Power",
                      xlab = "Global Active Power (kilowatts)"))
dev.off()