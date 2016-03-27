File <- "./household_power_consumption.txt"
Data <- read.csv(File, header = TRUE, sep =";", dec = ".", stringsAsFactors = FALSE)
subData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot

DateTime <- strptime(paste(subData$Date, subData$Time), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(subData$Sub_metering_1)
SM2 <- as.numeric(subData$Sub_metering_2)
SM3 <- as.numeric(subData$Sub_metering_3)
par(mar = c(5,3,4,3))
with(subData, {
        plot(DateTime, SM1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(DateTime, SM2, type = "l", col = "red")
        lines(DateTime, SM3, type = "l", col = "blue")
        }
)
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480 , width = 480)
dev.off()
