# Get the language of the system and set it to English.
lc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

# Load the data and filter it.
data <- read.table(".\\data\\household_power_consumption.txt",sep = ";", stringsAsFactors = FALSE, dec = ".", header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Get the values of the needed strings.
gap <- as.numeric(data$Global_active_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Generate the png file with the appropriate values.
png(file = "plot2.png", width = 480, height = 480)

# Create the plot with the desired options.
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Free the device and set the original language.
dev.off()
Sys.setlocale("LC_TIME",lc)