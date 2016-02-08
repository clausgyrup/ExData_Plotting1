#Reading the full dataset
colclasses<-c("character","character",rep("numeric",7))
df<-read.csv2(file = "household_power_consumption.csv",sep=";",dec='.',na.strings = "?",colClasses = colclasses)

df$jdate<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date<-as.Date(as.character(df$Date),format="%d/%m/%Y")

#Subsetting the data
date_from<-as.Date("2007-02-01")
date_to<-as.Date("2007-02-02")
wdf<-subset(df,Date<=date_to & Date>=date_from)

#Creating the plot
png(filename = "plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(wdf$jdate,wdf$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(wdf$jdate,wdf$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(wdf$jdate,wdf$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(wdf$jdate,wdf$Sub_metering_2,col="red")
lines(wdf$jdate,wdf$Sub_metering_3,col="blue")
legend("topright",bty = "n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,col=c("black","red","blue"),lwd =c(1,1,1))

plot(wdf$jdate,wdf$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()