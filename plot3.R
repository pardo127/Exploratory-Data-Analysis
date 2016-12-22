DATAdown <- "./data/household_power_consumption.txt"
DATAread<- read.table(DATAdown, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SUBdata <- DATAdown[DATAdown$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SUBdata$Date, SUBdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SUBdata$Global_active_power)
SUBmet1 <- as.numeric(SUBdata$Sub_met_1)
SUBmet2 <- as.numeric(SUBdata$Sub_met_2)
SUBmet3 <- as.numeric(SUBdata$Sub_met_3)

png("plot3.png", width=480, height=480)
plot(datetime, SUBmet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SUBmet2, type="l", col="red")
lines(datetime, SUBmet3, type="l", col="blue")
legend("topright", c("SUB_met_1", "SUB_met_2", "SUB_met_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
