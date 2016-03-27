File <- "./household_power_consumption.txt"
Data <- read.csv(File, header = TRUE, sep =";", dec = ".", stringsAsFactors = FALSE)
subData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot

par(mfrow = c(2,2))
DateTime <- strptime(paste(subData$Date, subData$Time), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subData$Global_active_power)
V <- as.numeric(subData$Voltage)
SM1 <- as.numeric(subData$Sub_metering_1)
SM2 <- as.numeric(subData$Sub_metering_2)
SM3 <- as.numeric(subData$Sub_metering_3)
GRP <- as.numeric(subData$Global_reactive_power)
par(mar = c(1,1,1,1))
with(subData, { 
        plot(DateTime, GAP, type = "l", xlab = "", ylab = "Global Active Power")
        plot(DateTime, V, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(DateTime, SM1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(DateTime, SM2, type = "l", col = "red")
        lines(DateTime, SM3, type = "l", col = "blue")
        plot(DateTime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        }
     )