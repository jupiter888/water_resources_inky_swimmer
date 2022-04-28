#Runoff
library(data.table)
library(sqldf)
library(ggplot2)
data<-read.csv("RACMO_EH5_Runoff.txt", sep="")
dt<-sqldf("select * FROM data 
          WHERE DTM BETWEEN '1961-01-15' AND '1990-12-15' 
          OR DTM BETWEEN '2021-01-15' AND '2050-12-15' 
          OR DTM BETWEEN '2071-01-15' AND '2100-12-15'  ")

dt$period[1:360]='1961-1990'
dt$period[361:720]='2021-2050'
dt$period[721:1080]='2071-2100'
head(dt)
colnames(dt)<-c('Date','Runoff','Epoch')
boxplot(dt$Runoff~dt$Epoch,xlab="Epoch",ylab="Runoff")

aggregated_1<-aggregate(dt$Runoff,by=list(dt$Epoch),FUN=sd)
colnames(aggregated)<-c('Epoch','SD')#SD SFAB

aggregated_2<-aggregate(dt$Runoff, by=list(dt$Epoch),FUN=mean)
colnames(aggregated_2)<-c('Epoch','Mean')#Mu ETMPC

