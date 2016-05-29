hpc<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=F,na.strings ="?",head=TRUE)
# import file  as hpc
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
# format Date to Date class
hpcsub<-subset(hpc,hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"))
# filter in only rows within two days
hpcsub$datetime<-as.POSIXct(paste(hpcsub$Date,hpcsub$Time),format="%Y-%m-%d %H:%M:%S")
# generate date time column contains combination of date and time
with(hpcsub,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
# makes the plot
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()
