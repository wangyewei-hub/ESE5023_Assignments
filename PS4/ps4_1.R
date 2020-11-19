

library(tidyr) 
library(dplyr) 
library(ggplot2)
#1.1  
boxplot(count ~ spray, data = InsectSprays, col = "red", 
        xlab="spray", ylab="counts") +
labs(title = "Comparison of different doses")
#1.2第二题找不到合适的数据，由蒋浩同学举例并给出方法

ggplot(economics,aes(x=date,y=unemploy))+ 
  geom_line(colour='blue')+
  geom_line(colour='blue') + 
  geom_area(colour='blue',alpha=0.4)+
  labs(title = "Economics")+
  xlab('The Time Series of Date')+ 
  ylab('The Time Series of unemploy')+
  geom_smooth(method = "loess")+
  theme_bw()


#1.3
x <- rnorm(100) 


h <- hist(x, plot=F) 
ylim <- range(0, h$density, dnorm(0))
hist(x, freq=F, ylim=ylim) 
curve(dnorm(x),add=T,col="red") 
  

 #1.4

x <- runif(50,0,2)
y <- runif(50,0,2)


plot(x, y, main="Scatter plot", xlab="x", ylab="y")
text(0.5, 0.5, "text at (0.5, 0.5)")
abline(h=.5, v=0.5)
  
