#3.3
library(tidyr)
library(dplyr)
library(ggplot2)
nonvegetarian_preg<-c(185,197,189,181,150,176)
vegetarian_preg<-c(171,174,202,171,207,125,189,179,163,174,184,186)
nonvegetarian<-c(210,139,172,198,177)
a<-t.test(nonvegetarian, nonvegetarian_preg)
b<-t.test(nonvegetarian_preg, vegetarian_preg)
c<-t.test(vegetarian_preg,nonvegetarian)
print(a)
print(b)
print(c)

#观察结果，三组数据无统计的差异性，无法得出素食主义者比非素食主义者的锌含量更低的结论

# MingYANG noticed:
# using anova analysis may be more suitable:
preveg<-"initiate"
preveg[1:6]<-"pregnveg"
preveg[7:23]<-"pregvege"
preveg[19:23]<-"uprgveg"

PNV<-c(185,189,187,181,150,176)
PV<-c(171,174,202,171,207,125,189,179,163,174,184,186)
UPV<-c(210,139,172,198,177)

zinc <- c(PNV,PV,UPV)
Pzinc<-cbind(PNV,PV,UPV)

boxplot(Pzinc,xlab="preveg",ylab="zinc",col=c(2:4))

prevegdata<-cbind(preveg,zinc)
data_tbl <- as_tibble(prevegdata)
datatblpregnveg <- data_tbl %>% 
  filter(preveg != "uprgveg")

anova_one_way <- aov(zinc ~ preveg, data = datatbl)
summary(anova_one_way)
# the end
