#******************************************************
#* Load a package for date manipulation. That is a functions to work with date-times and timespans
#* Set working directory 
#* Load dataset
#******************************************************
library(lubridate)
setwd("H:/school/coursera/data science/Johns Hopkins/workmig/expl/ExData_Plotting1/codes")
consumption <- read.table(file.path(getwd(), "household_power_consumption.txt"),header = TRUE,sep = ';' ,na.strings = '?')

## read data to only over a 2-day period in February, 2007.
consumption <- consumption[consumption$Date == '1/2/2007'|consumption$Date == '2/2/2007',]
consumption$DateTime<-dmy(consumption$Date)+hms(consumption$Time)

# image file 4
png(filename='plot4.png',width=480,height=480,units='px')

# plotting all four images in one display device
par(mfrow=c(2,2))

# Place plot one on top left part of the device ( row one column one)
plot(consumption$DateTime,consumption$Global_active_power,ylab='Global Active Power',xlab='',type='l')

# Place plot one on top left part of the device ( row one column two)
plot(consumption$DateTime,consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# Place plot one down part of device towards the left side( row two column one)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(consumption$DateTime,consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(consumption$DateTime,consumption$Sub_metering_2,col=lncol[2])
lines(consumption$DateTime,consumption$Sub_metering_3,col=lncol[3])
legend('topright',legend=lbls,col=lncol,lty='solid')

#finaly plot the last image at the buttom right of device 
plot(consumption$DateTime,consumption$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
cls<-dev.off()