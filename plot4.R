DATAdown <- "./data/household_power_consumption.txt"
DATAread <- read.table(DATAdown, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SUBdata <- DATAdown[DATAdown$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SUBdata$Date, SUBdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SUBdata$Global_active_power)
globalReactivePower <- as.numeric(SUBdata$Global_reactive_power)
voltage <- as.numeric(SUBdata$Voltage)
SUBmet1 <- as.numeric(SUBdata$SUB_met_1)
SUBmet2 <- as.numeric(SUBdata$SUB_met_2)
SUBmet3 <- as.numeric(SUBdata$SUB_met_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SUBmet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SUBmet2, type="l", col="red")
lines(datetime, SUBmet3, type="l", col="blue")
legend("topright", c("SUB_met_1", "SUB_met_2", "SUB_met_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

