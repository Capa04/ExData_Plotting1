#plot 1

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


###Create histogram###
#constructs plot in R
hist(dat2$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")

###Create plot png###
#constructs plot in png
png(file="plot1.png",width=480,height=480)
hist(dat2$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")
dev.off()