#******************************************************
#* Load a package for date manipulation. That is a functions to work with date-times and timespans
#* Set working directory 
#* Load dataset
#******************************************************
library(lubridate)
setwd("H:/school/coursera/data science/Johns Hopkins/workmig/expl/ExData_Plotting1/code")
consumption <- read.table(file.path(getwd(), "household_power_consumption.txt"),header = TRUE,sep = ';' ,na.strings = '?')

## read data to only over a 2-day period in February, 2007.
consumption <- consumption[consumption$Date == '1/2/2007'|consumption$Date == '2/2/2007',]
consumption$DateTime<-dmy(consumption$Date)+hms(consumption$Time)

## create the png file 3 of required size
png(filename='plot3.png',width=480,height= 480,units='px')

## plot 3

lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(consumption$DateTime,consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(consumption$DateTime,consumption$Sub_metering_2,col=lncol[2])
lines(consumption$DateTime,consumption$Sub_metering_3,col=lncol[3])
# add some legend
legend('topright',legend=lbls,col=lncol,lty='solid')

## close file
cls<-dev.off()
