File <- "./household_power_consumption.txt"
Data <- read.csv(File, header = TRUE, sep =";", dec = ".", stringsAsFactors = FALSE)
subData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]

## Plot

GAP <- as.numeric(subData$Global_active_power)
hist(GAP,main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)" )
dev.copy(png, file="plot2.png", height=480, width=480)
dv.off()
