#4
library(tidyr)
library(dplyr)
library(ggplot2)

Elevation<-c(180,305,381,488,549,640,762,883)
Elevation<-0.001*Elevation
Temperature<-c(13.3,12.2,13.3,10.0,8.3,9.4,8.3,7.2)

a<-cbind(Elevation,Temperature)
b<-as_tibble(a)

b %>% 
  ggplot( aes(x=Elevation, y=Temperature) ) + 
  geom_point() + 
  geom_smooth()

modle <- lm(Temperature ~ Elevation, data = b)
coef(model)
summary(model)
plot(Elevation,Temperature)
abline(model,col="blue")
#观察可知拟合直线斜率为-9.3121，不是假想的-9.8
# good work
