library(tidyr)
library(dplyr)
library(ggplot2)
#1  研究ph和Chlorophyll的关系
data1<- read.csv(file = "water_quality.csv", header = T,encoding = "UTF-8")
 water<-as_tibble(data1)
PH1_Chlorophyll<-water %>% 
filter(pH==8.4) %>% 
pull(Chlorophyll.a..μg.L.)
PH1_Chlorophyll<-as.numeric(PH1_Chlorophyll)
PH2_Chlorophyll<-water %>% 
  filter(pH==8) %>% 
  pull(Chlorophyll.a..μg.L.)
PH2_Chlorophyll<-as.numeric(PH2_Chlorophyll)
t.test(PH2_Chlorophyll, PH1_Chlorophyll)
#p<0.05，数据存在差异，说明两者相关

#2.方差分析  是否ph不同，会影响Chlorophyll的浓度变化？
water_pH<-water %>% 
  mutate(pH_factor = factor(pH, ordered = TRUE)) %>%
  mutate(Chlorophyll=as.numeric(Chlorophyll.a..μg.L.)) %>% 
  select(pH_factor,Chlorophyll)

anova_one_way <- aov(Chlorophyll ~ pH_factor, data =water_pH)
summary(anova_one_way)
#根据结果可得，p值远小于0.05，所以有信心说Chlorophyll浓度有变化,即ph会影响Chlorophyll的浓度变化

