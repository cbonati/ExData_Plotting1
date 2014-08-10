## We assume data is in our working directory.

png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

Sys.setlocale("LC_TIME", "English")
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880)

data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data[,1] <- paste(data[,1], data[,2])
z <- strptime(data[,1], "%Y-%m-%d %H:%M:%S")

plot(z, data[,3], xlab= "", ylab="Global Active Power (kilowatts)", type='l')

dev.off()