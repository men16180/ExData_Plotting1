## Script to produce Plot2

# Read in data file
data <- read.csv("./household_power_consumption.txt", header= TRUE, 
                 sep =";",na.strings = "?")

# Convert Time to POSIXlt class
data$Time <- strptime(paste(data$Date,data$Time,sep=" "), 
                 format= "%d/%m/%Y %H:%M:%S")

# Convert Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create time series plot and write to Plot2.png file in directory "figure"
png(file = "./figure/Plot2.png", width = 480, height = 480, units = "px") 
with(subset(data, (data$Date=="2007-02-01" | data$Date=="2007-02-02") ), {
        plot(Time, Global_active_power, type="l", 
             ylab="Global active power (kilowatts)",xlab="\n")          
      })
dev.off()