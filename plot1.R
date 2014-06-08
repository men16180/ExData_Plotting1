## Script to produce Plot1

# Download the raw data 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=fileUrl, destfile ="./household_power_consumption.zip", method = "curl")

# Unzip the data file
unzip(zipfile="household_power_consumption.zip", exdir = ".")

# Read in data file
data <- read.csv("./household_power_consumption.txt", header= TRUE, 
                 sep =";",na.strings = "?")

# Convert Time to POSIXlt class
data$Time <- strptime(paste(data$Date,data$Time,sep=" "), 
                      format= "%d/%m/%Y %H:%M:%S") 

# Convert Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Create histogram plot and write to Plot1.png in directory "figure"
png(file = "./figure/Plot1.png", width = 480, height = 480, units = "px", bg = "transparent") 
with(subset(data, (data$Date=="2007-02-01" | data$Date=="2007-02-02") ), {
        hist(Global_active_power, ylim=c(0,1200), 
          breaks=seq(from = 0, to = 8, by = 0.5),
          xlim=c(0,6), xlab="Global active power (kilowatts)",
          col="red", main="Global Active Power", axes=FALSE)
        axis(side = 1, at = c(0,2,4,6))
        axis(side = 2, at = c(0,200,400,600,800,1000,1200))
        box()
     })
dev.off()