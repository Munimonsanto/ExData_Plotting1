eda<-read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep=";")
head(eda)

finaleda<-eda[eda$Date %in% c("1/2/2007","2/2/2007"),]
head(finaleda)

P<-paste(finaleda$Date,finaleda$Time)
settime<-strptime(P,"%d/%m/%Y %H:%M:%S")
settime
Mergeddata<-cbind(finaleda,settime)
View(Mergeddata)

##Plot png graph
png("plot4.png", width=480, height=480)

attach(mtcars)
par(mfrow=c(2,2))

##First plot
plot(Mergeddata$settime,Mergeddata$Global_active_power,xlab=" ",ylab="Global Active Power",type = "l")

#Second Plot
plot(Mergeddata$settime,Mergeddata$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")

##Thrid plot
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(Mergeddata$settime,Mergeddata$Sub_metering_1,xlab = " ",ylab="Energy sub metering",type="l")
lines(Mergeddata$settime,Mergeddata$Sub_metering_2,xlab = " ",ylab="Energy sub metering",type="l",col='red')
lines(Mergeddata$settime,Mergeddata$Sub_metering_3,xlab = " ",ylab="Energy sub metering",type="l",col='blue')
legend("topright",legend=labels,col=c("black","red","blue"),lty = "solid")

##Forth Plot
plot(Mergeddata$settime, Mergeddata$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

dev.off()
