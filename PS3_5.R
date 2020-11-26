library(tidyr)
library(dplyr)
library(ggplot2)
#1
Nebula<-c("S. Mag","L. Mag","NGC 6822","NGC 598","NGC 221","NGC 224","NGC 5457","NGC 4736",
          "NGC 5194","NGC 4449","NGC 4214","NGC 3031","NGC 3627","NGC 4626","NGC 5236",
          "NGC 1068","NGC 5055","NGC 7331","NGC 4258","NGC 4151","NGC 4382","NGC 4472",
          "NGC 4486","NGC 4649")
Velocity<-c(170,290,-130,-70,-185,-220,200,290,270,200,300,-30,650,150,500,920,450,500,500,
            960,500,850,800,1090)
Distance<-c(0.032,0.034,0.214,0.263,0.275,0.275,0.450,0.500,0.500,0.630,0.800,0.900,0.900,
            0.900,0.900,1.000,1.100,1.100,1.400,1.700,2.000,2.000,2.000,2.000)
Distance<- 30.9e18*Distance

plot(Velocity,Distance)

#2
a<-data.frame(Nebula,Velocity,Distance)
bigbang<-as_tibble(a)
model <- lm(Distance ~ Velocity, data = bigbang)
abline(model,col="blue")
#3
#问蒋浩同学，他告诉我lm模型-1令截距为0
model_1 <- lm(Distance ~ Velocity-1, data = bigbang)
summary(model_1)
#根据大爆炸理论，宇宙诞生时，红移距离应该为0，之后红移距离应该越来越大

age<-(model_new$coefficients/60/60/24/365)
#paste函数是蒋浩同学提供的思路
print(paste("The age of the universe is",age,"years old"))

#4
#数据中不同的速度对应着相同的距离，存在问题，提升数据精度可以得到更好的回归曲线，也能预测的更准
# good work         
