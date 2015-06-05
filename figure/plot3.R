#plot 3

library(lubridate)

###Reading in the data###
initial<-read.table("E:/Coursera4/coursera4_w1/household_power_consumption.txt",
                    sep=";",header=TRUE,na.strings="?",nrows=100)
classes<-sapply(initial,class)    #Get column classes  

dat<-read.table("E:/Coursera4/coursera4_w1/household_power_consumption.txt",
                sep=";",header=TRUE,na.strings="?",colClasses=classes)
dat$Date<-as.Date(as.character(dat$Date),"%d/%m/%Y")          # format Date
dat$datetime<-ymd_hms(paste(dat$Date,dat$Time))               # create datetime
dat2<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02")     # subset of data


###Create plot###
#constructs plot in R
with(dat2, plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
    with(dat2,lines(datetime,Sub_metering_2,col="red"))
    with(dat2,lines(datetime,Sub_metering_3,col="blue"))
    legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2",
                                                             "Sub_metering_3"))

###Create plot in png###
#constructs plot in png
png(file="plot3.png",width=480,height=480)
with(dat2, plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(dat2,lines(datetime,Sub_metering_2,col="red"))
with(dat2,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2",
                                                             "Sub_metering_3"))
dev.off()