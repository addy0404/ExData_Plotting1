library(lubridate)
library(dplyr)

dat<-read.delim("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = F,dec=".")
dat$Date<-dmy(dat$Date)
dat_need<-dat[dat$Date>="2007-02-01" & dat$Date<="2007-02-02",]
dat_df<-tbl_df(dat_need)

png("plot1.png", width=480, height=480)
hist(as.numeric(dat_df$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()