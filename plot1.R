dataset<-read.csv("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")

mydata<-subset(dataset,Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))

hist(as.numeric(mydata$Global_active_power),
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.copy(png,"plot1.png")

dev.off()