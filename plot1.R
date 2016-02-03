# Load the data and filter it.
data <- read.table(".\\data\\household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Get the values of the needed strings.
gap <- as.numeric(data$Global_active_power)

# Generate the png file with the appropriate values.
png(file = "plot1.png", width = 480, height = 480)

# Create the histogram with the desired options.
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Free the device
dev.off()