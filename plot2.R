dataset<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

mydata<-subset(dataset,Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))

plot(mydata$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     axes=FALSE)

axis(1, at = c(0,1440,2880),labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))

box(lty = 1, col = 'black')

dev.copy(png,"plot2.png")

dev.off()