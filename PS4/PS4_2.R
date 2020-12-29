
library(tidyr) 
library(dplyr) 
library(ggplot2)

#2.1构造时间序列
wind<- read.csv(file = "2281305.csv", header = T,encoding = "UTF-8")
wind_tb <- as_tibble(wind)
temperature_mean<-wind_tb %>% 
  mutate(temperature = ifelse(substr(TMP,7,7) == "1" |substr(TMP,1,5) != '+9999',
                      as.numeric(substr(TMP,1,5))*0.1,NA)) %>%
  #选出时间
  mutate(month = paste(substr(DATE,1,4),substr(DATE,6,7),sep = "")) %>% 
  filter(month >= 201001 & month <= 202008) %>%
  group_by(month) %>% 
  summarise(month_mean=mean(temperature,na.rm = T)) %>% 
  pull()
#姜浩同学给我解释了时间序列ts的用法
temperature_ts <- ts(temperature_mean, start=c(2010,1),end = c(2020,08) ,frequency=12)
plot(temperature_ts, type="l")
str(temperature_ts)

#2.分解时间序列
temperature_components <- decompose(temperature_ts)
plot(temperature_components)
ds<-temperature_components$random
Box.test(ds,type='Ljung',lag=log(length(ds)))
#p值为1.175e-05，小于0.05，序列为非白噪声

#3.拟合ARIMA模型
temperature_ts_d1<-diff(temperature_ts)
plot(temperature_ts_d1)
acf(temperature_ts)
pacf(temperature_ts)
model <- auto.arima(temperature_ts)
summary(model)


#4.预测2020年9月和10月的月平均气温，由蒋浩同学讲解思路
forecast_2months <- forecast(model, 2)
plot(forecast_2months)

#2020年9月的预测
forecast_2months$mean[1]
#80%置信区间时的预测
forecast_2months$lower[1,1]
forecast_2months$upper[1,1]
#95%置信区间的预测
forecast_2months$lower[1,2]
forecast_2months$upper[1,2]

#2020年10月的预测
forecast_2months$mean[2]
#80%置信区间的预测
forecast_2months$lower[2,1]
forecast_2months$upper[2,1]
#95%置信区间的预测
forecast_2months$lower[2,2]
forecast_2months$upper[2,2]

#获取9月数据真值，10月数据没有
temperature_mean_sep<-wind_tb %>% 
  mutate(temperature = ifelse(substr(TMP,7,7) == "1" |substr(TMP,1,5) != '+9999',
                      as.numeric(substr(TMP,1,5))*0.1,NA)) %>%
  mutate(month = paste(substr(DATE,1,4),substr(DATE,6,7),sep = "")) %>% 
  filter(month == 202009 ) %>%
  group_by(month) %>% 
  summarise(month_mean=mean(temperature,na.rm = T)) %>% 
  pull()

Relative_bias <- (temperature_mean_sep-forecast_2months$mean[1])/temperature_mean_sep
print(Relative_bias)
#Relative bias = 0.01389,偏差很小

# MingYANG noticed:
# in your report, plot is missing
# in 2.2, t-test can`t recognize noise distribution, you should use histogram to verify if it is a Gausian distribution
# the end
