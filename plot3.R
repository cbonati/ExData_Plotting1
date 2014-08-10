## We assume data is in our working directory.

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

Sys.setlocale("LC_TIME", "English")
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880)

data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data[,1] <- paste(data[,1], data[,2])
z <- strptime(data[,1], "%Y-%m-%d %H:%M:%S")

plot(z, data[,7], xlab= "", ylab="Energy sub metering", type='l')
lines(z, data[,8], type='l', col="red")
lines(z, data[,9], type='l', col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), cex=0.7, lty = 1)

dev.off()