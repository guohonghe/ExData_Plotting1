library(sqldf, lib.loc = "/Library/Frameworks/R.framework/Versions/4.0/Resources/library")
hpc<-read.csv.sql("household_power_consumption.txt", sql="select * from file where 
Date = '1/2/2007' OR Date = '2/2/2007'", header=TRUE,sep=";")

# Plot1
P1_title<-c("Global Active Power")
P1_x_axis<-c("Global Active Power (kilowatts)")
hist(hpc$Global_active_power, main=P1_title, col="red", xlab=P1_x_axis)
dev.copy(png, file = "Plot1.png", width = 480, height = 480) 
dev.off()