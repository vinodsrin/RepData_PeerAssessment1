
#Uncomment below lines to download data required is not downloaded
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./powerconsumption.zip")

#if(!file.exists("./powerconsumption")) {dir.create("./powerconsumption")}
#unzip("powerconsumption.zip", exdir = "./powerconsumption")

#Load data
powerconsumptionfile <- "./powerconsumption/household_power_consumption.txt"
powerconsumptiondata <- read.table(powerconsumptionfile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filter data for 1st and 2nd Feb 2007 
PlotData <- powerconsumptiondata[powerconsumptiondata$Date %in% c("1/2/2007","2/2/2007") ,]

#Concatenate date and time
datetime <- strptime(paste(PlotData$Date, PlotData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert data to numeric
globalActivePower <- as.numeric(PlotData$Global_active_power)

subMetering1 <- as.numeric(PlotData$Sub_metering_1)
subMetering2 <- as.numeric(PlotData$Sub_metering_2)
subMetering3 <- as.numeric(PlotData$Sub_metering_3)

globalReactivePower <- as.numeric(PlotData$Global_reactive_power)
voltage <- as.numeric(PlotData$Voltage)

#Plot graphs
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()