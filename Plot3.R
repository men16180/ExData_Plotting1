## Script to produce Plot3

# Read in data file
data <- read.csv("./household_power_consumption.txt", header= TRUE, 
                 sep =";",na.strings = "?")

# Convert Time to POSIXlt class
data$Time <- strptime(paste(data$Date,data$Time,sep=" "), 
                  format= "%d/%m/%Y %H:%M:%S") 

# Convert Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create time series plot and write to Plot3.png file in directory "figure"
png(file = "./figure/Plot3.png", width = 480, height = 480, units = "px") 
with(subset(data, (data$Date=="2007-02-01" | data$Date=="2007-02-02") ), {
     plot(Time, Sub_metering_1 ,type='n', xlab="", ylab="Energy sub metering")
     lines(Time,Sub_metering_1, type="l",col="black")
     lines(Time,Sub_metering_2, type="l",col="red")
     lines(Time,Sub_metering_3, type="l",col="blue")
     legend("topright",lty=c(1,1,1), col = c("black", "red", "blue"), 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()