dataset<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

mydata<-subset(dataset,Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))

png(file="plot4.png")

par(mfrow=c(2,2))

plot(mydata$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     axes=FALSE)

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))

box(lty = 1, col = 'black')


plot(mydata$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime",
     axes=FALSE)

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(234,238,242,246))

box(lty = 1, col = 'black')

plot(mydata$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     axes=FALSE)

par(new=T)

plot(mydata$Sub_metering_2,col="red",
     type="l",
     axes=FALSE,ylim=c(0,40),
     xlab="",
     ylab="")

par(new=T)

plot(mydata$Sub_metering_3,col="blue",
     type="l",
     axes=FALSE,ylim=c(0,40),
     xlab="",
     ylab="")

legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       bty="n")

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))

box(lty = 1, col = 'black')


plot(mydata$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime",
     axes=FALSE)

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))

box(lty = 1, col = 'black')


dev.off()