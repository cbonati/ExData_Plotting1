## We assume data is in our working directory.

png(filename = 'plot4.png', width = 480, height = 480, units = 'px')

Sys.setlocale("LC_TIME", "English")
data <- read.csv("household_power_consumption.txt", sep=";", header=FALSE, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip=66637, nrows=2880)

par(mfrow = c(2,2), mar = c(4,4,2,1))

data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data[,1] <- paste(data[,1], data[,2])
z <- strptime(data[,1], "%Y-%m-%d %H:%M:%S")

## 1st: Ex-plot 2, Global active power, 3rd column
plot(z, data[,3], xlab= "", ylab="Global Active Power", type='l')

## 2nd: New, Voltage, 5th column
plot(z, data[,5], xlab= "datetime", ylab="Voltage", type='l')

## 3rd: Ex-plot 3, Sub metering, 7th, 8th and 9th columns
plot(z, data[,7], xlab= "", ylab="Energy sub metering", type='l')
lines(z, data[,8], type='l', col="red")
lines(z, data[,9], type='l', col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), bty="n", cex=0.7, lty = 1)

## 4th: New, Global reactive power, 4th column
plot(z, data[,4], xlab= "datetime", ylab="Global_reactive_power", type='l')

dev.off()