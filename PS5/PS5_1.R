library("sp")
library("rgdal")
library("sf")
library("raster")

#1.1
wind_Jan <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_01.tif")
wind_Feb <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_02.tif")
wind_Mar <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_03.tif")
wind_Apr <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_04.tif")
wind_May <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_05.tif")
wind_Jun <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_06.tif")
wind_Jul <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_07.tif")
wind_Aug <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_08.tif")
wind_Sep <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_09.tif")
wind_Oct <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_10.tif")
wind_Nov <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_11.tif")
wind_Dec <- raster("wc2.1_2.5m_wind/wc2.1_2.5m_wind_12.tif")
prec_Jan <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_01.tif")
prec_Feb <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_02.tif")
prec_Mar <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_03.tif")
prec_Apr <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_04.tif")
prec_May <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_05.tif")
prec_Jun <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_06.tif")
prec_Jul <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_07.tif")
prec_Aug <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_08.tif")
prec_Sep <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_09.tif")
prec_Oct <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_10.tif")
prec_Nov <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_11.tif")
prec_Dec <- raster("wc2.1_2.5m_prec/wc2.1_2.5m_prec_12.tif")
srad_Jan <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_01.tif")
srad_Feb <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_02.tif")
srad_Mar <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_03.tif")
srad_Apr <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_04.tif")
srad_May <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_05.tif")
srad_Jun <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_06.tif")
srad_Jul <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_07.tif")
srad_Aug <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_08.tif")
srad_Sep <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_09.tif")
srad_Oct <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_10.tif")
srad_Nov <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_11.tif")
srad_Dec <- raster("wc2.1_2.5m_srad/wc2.1_2.5m_srad_12.tif")

#1.2  

wind_annual<-(wind_Jan+wind_Feb+wind_Mar+wind_Apr+wind_May+wind_Jun+wind_Jul+
              wind_Aug+wind_Sep+wind_Oct+wind_Nov+wind_Dec)/12

prec_annual <- (prec_Jan+prec_Feb+prec_Mar+prec_Apr+prec_May+prec_Jun+prec_Jul+
                prec_Aug+prec_Sep+prec_Oct+prec_Nov+prec_Dec)/12

srad_annual <- (srad_Jan+srad_Feb+srad_Mar+srad_Apr+srad_May+srad_Jun+srad_Jul+
                srad_Aug+srad_Sep+srad_Oct+srad_Nov+srad_Dec)/12

China <- readOGR("China_map", "bou2_4p")
col <- terrain.colors(30)
#1.3
wind_china<-crop(wind_annual,China)
wind_china <- mask(wind_annual,China,na.rm=T)
plot(wind_china,  main="wind in china", col=col)
contour(wind_china, add=T, levels=4,col="green")
#从图中可以看出西藏青海地区适合建设风力发电厂
#1.4
prec_china<-crop(prec_annual,China)
prec_china <- mask(prec_china,China,na.rm=T)
plot(prec_china,  main="prec in china", col=col)
contour(prec_china, add=T,levels=100, col="green")

srad_china<-crop(srad_annual,China)
srad_china <- mask(srad_china,China,na.rm=T)
plot(srad_china,  main="srad in china", col=col)
contour(srad_china, add=T,levels=16000, col="green")
#从图中可以看出新疆适合建设光伏发电厂