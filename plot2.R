library(sqldf, lib.loc = "/Library/Frameworks/R.framework/Versions/4.0/Resources/library")
hpc<-read.csv.sql("household_power_consumption.txt", sql="select * from file where 
Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE,sep=";")

# Plot2
Time<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
P2_y_axis<-c("Global Active Power (kilowatts)")
plot(Time, hpc$Global_active_power, type="l", xlab="", ylab=P2_y_axis)
dev.copy(png, file = "Plot2.png", width = 480, height = 480) 
dev.off()