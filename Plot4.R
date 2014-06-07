## Script to produce Plot4

# Read in data file
data <- read.csv("./household_power_consumption.txt", header= TRUE, 
                 sep =";",na.strings = "?")

# Convert Time to POSIXlt class
data$Time <- strptime(paste(data$Date,data$Time,sep=" "),
                      format= "%d/%m/%Y %H:%M:%S") 

# Convert Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create Multiple plot with 4 panels and write to Plot4.png file in 
# directory "figure" 
png(file = "./figure/Plot4.png", width = 480, height = 480, units = "px") 
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(subset(data, (data$Date=="2007-02-01" | data$Date=="2007-02-02") ), {
        plot(Time, Global_active_power, type="l", xlab="", 
             ylab="Global Active Power",)
        plot(Time, Voltage, type= "l", xlab="datetime")
        plot(Time, Sub_metering_1, type='n', xlab="",ylab="Energy sub metering")
        lines(Time,Sub_metering_1, type="l",col="black")
        lines(Time,Sub_metering_2, type="l",col="red")
        lines(Time,Sub_metering_3, type="l",col="blue")
        legend("topright",bty="n",lty=c(1,1,1), col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Time, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()
