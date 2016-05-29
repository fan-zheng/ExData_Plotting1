hpc<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F,na.strings ="?",head=TRUE)
# import file  as hpc
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
# format Date to Date class
hpcsub<-subset(hpc,hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))
# filter in only rows within two days
hpcsub$datetime<-as.POSIXct(paste(hpcsub$Date,hpcsub$Time),format="%Y-%m-%d %H:%M:%S")
# generate date time column contains combination of date and time
with(hpcsub,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(hpcsub,lines(datetime,Sub_metering_1,col="gray48"))
with(hpcsub,lines(datetime,Sub_metering_2,col="red"))
with(hpcsub,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", pch = 1, col = c("gray48","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png",width=520,height=480)
dev.off()
