## Load data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- subset(data, subset = (Date == "2007-02-01" | Date== "2007-02-02"))

## Combine time and date
data$time_combine <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$time_combine <- as.POSIXct(data$time_combine)

## Plot
with(data,plot(Sub_metering_1 ~ time_combine, type = "l", ylab = "Energy sub metering", xlab = ""))
with(data,lines(Sub_metering_2 ~ time_combine, col = "Red"))
with(data,lines(Sub_metering_3 ~ time_combine, col = "Blue"))
with(data,legend("topright", lty = 1, col = c("black", "red", "blue"), 
                 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))

dev.copy(png,file="Plot3.png",height=480,width=480)
dev.off()
