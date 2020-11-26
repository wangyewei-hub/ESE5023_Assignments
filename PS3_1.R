library(tidyr)
library(dplyr)
library(ggplot2)
#1.1
Unseeded_Rainfall<-c(1202.6, 830.1, 372.4, 345.5, 321.2, 244.3, 163.0, 147.8, 95.0, 87.0, 81.2, 68.5, 47.3, 41.1, 36.6, 29.0, 28.6, 26.3, 26.0, 24.4, 21.4, 17.3, 11.5, 4.9, 4.9, 1.0)
seeded_Rainfall<-c(2745.6, 1697.1, 1656.4, 978.0, 703.4, 489.1, 430.0, 334.1, 302.8, 274.7, 274.7, 255.0, 242.5, 200.7, 198.6, 129.6, 119.0, 118.3, 115.3, 92.4, 40.6, 32.7, 31.4, 17.5, 7.7, 4.1)


boxplot(Unseeded_Rainfall,seeded_Rainfall,
        xlab = "Unseeded&seeded",
        ylab = "Rainfall",
        main = " distributions",
        cex = 2,
        col = "orange",
        border = "darkgreen" )
#可以看出有播种的降水总体高于无播种的降水
#1.2
t.test(Unseeded_Rainfall, seeded_Rainfall)
#可以看出人工降雨总体高于非人工降雨，但是从t检验来看，p=0.5376,在5%的水平上认为人工降雨与降雨量无关

# good work
