## Load data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- subset(data, subset = (Date == "2007-02-01" | Date== "2007-02-02"))

## Combine time and date
data$time_combine <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$time_combine <- as.POSIXct(data$time_combine)

## Plot
with(data,plot(Global_active_power ~ time_combine,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.copy(png,file="Plot2.png",height=480,width=480)
dev.off()