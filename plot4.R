# Get the language of the system and set it to English.
lc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

# Load the data and filter it.
data <- read.table(".\\data\\household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Get the values of the needed strings.
m1 <- as.numeric(data$Sub_metering_1)
m2 <- as.numeric(data$Sub_metering_2)
m3 <- as.numeric(data$Sub_metering_3)
gap <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
voltage <- as.numeric(data$Voltage)
grp <- as.numeric(data$Global_reactive_power)

# Generate the png file with the appropriate values.
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

# Top-left plot.
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power")

# Bottom-left plot.
plot(datetime, m1, col = "black",type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, m2, type = "l", col = "red")
points(datetime, m3, type = "l", col = "blue")
legend("topright", bty = "n", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Top-right plot.
plot(datetime, voltage, type = "l", ylab = "Voltage")

# Bottom-right plot.
plot(datetime, grp, type = "l", ylab = "Global_reactive_power")

# Free the device and set the original language.
dev.off()
Sys.setlocale("LC_TIME",lc)