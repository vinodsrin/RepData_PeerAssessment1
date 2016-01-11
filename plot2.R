
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

#Plot Global Active Power data
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()