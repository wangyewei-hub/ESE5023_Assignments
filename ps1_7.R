#1
b_Data       <- read.csv(file = "Flux-T_aYWW_20200925.csv", header = T)
a<-b_Data$weight
nouse<-which(a<0)
a[nouse]<-NA
#2
TIME1<-b_Data$锘縯ime
plot(TIME1,a,lwd=0.05,type = "l",col="blue")
#3
min(b_Data$weight)
max(b_Data$weight)
range(b_Data$weight)
mean(b_Data$weight)
median(b_Data$weight)