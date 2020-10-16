library(sqldf, lib.loc = "/Library/Frameworks/R.framework/Versions/4.0/Resources/library")
hpc<-read.csv.sql("household_power_consumption.txt", sql="select * from file where 
Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE,sep=";")

# Plot4
par(mfrow=c(2,2))
Time<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
P4_y1_axis<-c("Global Active Power")
P4_y2_axis<-c("Voltage")
P4_y3_axis<-c("Energy sub metering")
P4_y4_axis<-c("Global_reactive_power")
plot(Time, hpc$Global_active_power, type="l", xlab="", ylab=P4_y1_axis)
plot(Time, hpc$Voltage, type="l", xlab="datetime", ylab=P4_y2_axis)
plot(Time, hpc$Sub_metering_1, type="l", xlab="", ylab=P4_y3_axis)
lines(Time, hpc$Sub_metering_2, type="l",xlab="", col="red")
lines(Time, hpc$Sub_metering_3, type="l",xlab="", col="blue")
legend("topright", lwd=2, bty="n", col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Time, hpc$Global_reactive_power, type="l", xlab="datetime", ylab=P4_y4_axis)
dev.copy(png, file = "Plot4.png", width = 480, height = 480) 
dev.off()
