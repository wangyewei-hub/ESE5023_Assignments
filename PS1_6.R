#6.1
a_Data       <- read.csv(file = "2281305.csv", header = T)
vis1<-a_Data$VIS
vis2<-substr(vis1,1,6)
vis3<-as.numeric(vis2)
nouse1<-which(vis3>160000)
vis3[nouse]<-NA
quality<-substr(vis1,8,12)
nouse2<-which(quality!="1,N,1")
vis3[nouse2]<-NA
TIME1<-a_Data$DATE
TIME2<-as.Date(TIME1)
plot(TIME2,vis3,lwd=0.05,type = "l",col="blue")
#6.2  
day<-unique(TIME2)
day_vis<-c()
for (day1 in day) {
  iday<-which(TIME2==day1)
day_MAX<-max(vis3[iday],na.rm = T)
day_vis<-c(day_vis,day_MAX)
  }

anuals<-substr(day,1,4)  
anuals2<-as.numeric(anuals)   
anual<-unique(anuals2)
for (ianual in anual) {
  days<-c(ianual,0,0,0,0,0,0,0)
  thisanual<-which(anuals==ianual)
  for (days2 in thisanual) {
    if(day_vis[days2]>=0&&day_vis[days2]<5000){
      days[2]<-days[2]+1
    }
  else if(day_vis[days2]>=5000&&day_vis[days2]<10000){
    days[3]<-days[3]+1
  }
    else if(day_vis[days2]>=10000&&day_vis[days2]<15000){
      days[4]<-days[4]+1
    } 
    else if(day_vis[days2]>=15000&&day_vis[days2]<20000){
      days[5]<-days[5]+1
    } 
    else if(day_vis[days2]>=20000&&day_vis[days2]<25000){
      days[6]<-days[6]+1
    } 
    else if(day_vis[days2]>=25000&&day_vis[days2]<30000){
      days[7]<-days[7]+1
    }
    else if(day_vis[days2]>=30000){
      days[8]<-days[8]+1
    } 
    
    }
  print(days)
  } 
  