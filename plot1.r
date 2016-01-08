
eda<-read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",sep=";")
head(eda)

finaleda<-eda[eda$Date %in% c("1/2/2007","2/2/2007"),]
head(finaleda)

P<-paste(finaleda$Date,finaleda$Time)
settime<-strptime(P,"%d/%m/%Y %H:%M:%S")
settime
Mergeddata<-cbind(finaleda,settime)
View(Mergeddata)
png("plot1.png",width=480,height = 480)
hist(Mergeddata$Global_active_power,col='red',main = "Global Active Power",xlab = "Global Active Power(killowats)")
dev.off()
