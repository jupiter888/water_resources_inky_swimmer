#Temperature
library(ggplot2)
setwd("~/Documents/Global Climate Change and Water Resources /data")
data<-read.csv("RACMO_EH5_temperature.txt", sep="")
head(data)
#trendy<-lm(data$RACMO_EH5_T~data$DTM)
colnames(data)<-c("Date", "Temperature")
data$Date=as.Date(data$Date)
head(data)
plot(data$Date, data$Temperature, type="l")
abline(reg=lm(data$Temperature~data$Date),col="green", lwd=1)
gplotted<-ggplot(data, aes(x=Date, y=Temperature, color=Temperature))+geom_line()
gplotted
