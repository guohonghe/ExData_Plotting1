library(sqldf, lib.loc = "/Library/Frameworks/R.framework/Versions/4.0/Resources/library")
hpc<-read.csv.sql("household_power_consumption.txt", sql="select * from file where 
Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE,sep=";")

# Plot3
Time<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
P3_y_axis<-c("Energy sub metering")
plot(Time, hpc$Sub_metering_1, type="l", xlab="", ylab=P3_y_axis, cex.lab=0.8, cex.axis=0.8)
lines(Time, hpc$Sub_metering_2, type="l",xlab="", col="red")
lines(Time, hpc$Sub_metering_3, type="l",xlab="", col="blue")
legend("topright", lwd=2, cex=0.8, col=c("black","red","blue"), legend=c("Sub_metering_1", 
                        "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "Plot3.png", width = 480, height = 480) 
dev.off()