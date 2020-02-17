library(lubridate)
library(dplyr)

dat<-read.delim("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = F,dec=".")
dat$Date<-dmy(dat$Date)
dat_need<-dat[dat$Date>="2007-02-01" & dat$Date<="2007-02-02",]
dat_df<-tbl_df(dat_need)
dat_df$full_time<-strptime(paste(dat_df$Date,dat_df$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(dat_df$full_time,as.numeric(dat_df$Sub_metering_1),type="l",ylab="Energy Submetering", xlab="")
lines(dat_df$full_time,as.numeric(dat_df$Sub_metering_2),col="red")
lines(dat_df$full_time,as.numeric(dat_df$Sub_metering_3),col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()