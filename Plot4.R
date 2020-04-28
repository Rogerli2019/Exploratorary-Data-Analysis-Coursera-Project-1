## Load data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- subset(data, subset = (Date == "2007-02-01" | Date== "2007-02-02"))

## Combine time and date
data$time_combine <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$time_combine <- as.POSIXct(data$time_combine)

## Set 4 graphs
par(mfrow = c(2, 2))

## Graph 1
with(data,plot(Global_active_power~time_combine,type="l",xlab="",ylab="Global Active Power"))

## Graph 2
with(data,plot(Voltage ~ time_combine,type="l",xlab="datetime"))

## Graph 3
with(data,plot(Sub_metering_1 ~ time_combine, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data,lines(Sub_metering_2 ~ time_combine, col = "Red"))
with(data,lines(Sub_metering_3 ~ time_combine, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.6)

## Graph 4
with(data,plot(Global_active_power ~ time_combine, type ="l", xlab="datetime"))

## Export png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()