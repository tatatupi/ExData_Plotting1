dataset<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

mydata<-subset(dataset,Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))

png(file="plot3.png")

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
       lty=c(1,1,1))

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))

box(lty = 1, col = 'black')


dev.off()