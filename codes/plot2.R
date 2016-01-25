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
## create the png file 2 of required size
png(filename='plot2.png',width=480,height= 480,units='px')

## plot 2  
plot(consumption$DateTime,consumption$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
## close file
cls<-dev.off()