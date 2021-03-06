DATAdown <- "./data/household_power_consumption.txt"
DATAread <- read.table(DATAdown, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SUBdata <- DATAdown[DATAdown$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SUBdata$Date, SUBdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SUBdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
