#Reading the full dataset
colclasses<-c("character","character",rep("numeric",7))
df<-read.csv2(file = "household_power_consumption.csv",sep=";",dec='.',na.strings = "?",colClasses = colclasses)
df$Date<-as.Date(as.character(df$Date),format="%d/%m/%Y")

#Subsetting the data
date_from<-as.Date("2007-02-01")
date_to<-as.Date("2007-02-02")
wdf<-subset(df,Date<=date_to & Date>=date_from)

#Creating the plot
png(filename = "plot1.png",width = 480,height = 480)
with(wdf,hist(Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()