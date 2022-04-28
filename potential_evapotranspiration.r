#Potential Evapotranspiration
library(ggplot2)
data<-read.csv("PET.txt", sep="")
head(data)
colnames(data)<-c("Date", "PET")
data$Date<-as.Date(data$Date)
head(data)
gplotted<-ggplot(data, aes(x=Date, y=PET, color=PET))+geom_line()
gplotted
plot(data$Date, data$PET, type='l')
#abline( lm(data$PET~data$Date) )
tt<-lm(data$PET~data$Date)
abline(tt, col="cyan")
summary(tt)
#The P-value being 0.2796% means chances are 28 in 10,000 
#The smaller the p-value, the greater the evidence against the null hypothesis. 
#Any P-value less than 0.05 (5%) is statistically significant,
#Therefore we reject the null hypothesis.

