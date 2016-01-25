#******************************************************
#* Set working directory 
#* Load dataset
#******************************************************

setwd("H:/school/coursera/data science/Johns Hopkins/workmig/expl/ExData_Plotting1/code")
consumption <- read.table(file.path(getwd(), "household_power_consumption.txt"),header = TRUE,sep = ';' ,na.strings = '?')

## read data to only over a 2-day period in February, 2007.
consumption <- consumption[consumption$Date == '1/2/2007'|consumption$Date == '2/2/2007',]

## create the png file of required size
png(filename='plot1.png',width=480,height= 480,units='px')

## plot 1 
hist(consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red') 

## close file
cls<-dev.off()

