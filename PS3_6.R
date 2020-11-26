#6
library(tidyr)
library(dplyr)
library(ggplot2)


library(MASS)
data(cpus)
#这一题的思路由蒋浩同学提供
sample_index <- sample(nrow(cpus),nrow(cpus)*0.8)
cpus_train <- cpus[sample_index,]
cpus_test  <- cpus[-sample_index,]

library(leaps)
subset_result <- regsubsets(perf~ syct+mmin+mmax+cach+chmin+chmax, data=cpus_train,
                            nbest=2, nvmax = 6)
plot(subset_result, scale="bic")

#2
model_cpus <- lm( perf ~ syct+mmin+mmax+cach+chmax, data=cpus_train )
#predict函数是蒋浩同学讲解的
cpus_predict <- predict(model_cpus,cpus_test)
plot(cpus_test$perf, cpus_predict)

#求相对平均偏差是蒋浩同学讲解
mean_bias<-(mean(cpus_predict) - mean(cpus_test$perf))/
  mean(cpus_test$perf)*100
print(paste("The relative average deviation is",mean_bias,"%"))

# good work
# using "mean(cpus_predict - cpus_test$perf)" may be more suitable in this problem
