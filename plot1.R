## We assume data is in our working directory.

png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

data <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", quote ="", na.strings = "?", dec = ".", colClasses = "character", skip=66637, nrows=2880)
data[,3] <- as.numeric(data[,3])

hist(data[,3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()