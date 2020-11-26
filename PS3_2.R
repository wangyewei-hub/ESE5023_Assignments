#3.2
library(tidyr)
library(dplyr)
library(ggplot2)
bone_T<-c(11.10,11.22,11.29,11.49,11.32,11.40,11.71,11.60,11.78,12.05,
          10.61,10.88,11.12,11.24,11.43,10.92,11.20,11.30,11.62,11.70,
          11.70,11.79,11.91,12.15,11.33,11.41,11.62,12.15,12.30,11.32,
          11.65,11.96,12.15,11.54,11.89,12.04,10.93,11.01,11.08,11.12,
          11.28,11.37,11.35,11.43,11.50,11.57,11.92,11.95,12.01,12.25,
          12.30,12.39)
bone<-c("Rib","Rib","Rib","Rib","Gastralia","Gastralia","Gastralia","Gastralia","Gastralia",
        "Gastralia","Dorsal_vertebra","Dorsal_vertebra","Dorsal_vertebra","Dorsal_vertebra",
        "Dorsal_vertebra","Dorsal_vertebra","Dorsal_vertebra","Dorsal_vertebra",
        "Dorsal_vertebra","Dorsal_vertebra","Femur","Femur","Femur","Femur",
        "Tibia","Tibia","Tibia","Tibia","Tibia","Metatarsal","Metatarsal","Metatarsal","Metatarsal",
        "Phalange", "Phalange", "Phalange","Proximal_caudal","Proximal_caudal","Proximal_caudal",
        "Proximal_caudal","Proximal_caudal","Proximal_caudal",
        "Mid_caudal", "Mid_caudal", "Mid_caudal", "Mid_caudal", "Mid_caudal",
        "Distal_caudal","Distal_caudal","Distal_caudal","Distal_caudal","Distal_caudal")
a<-cbind(bone,bone_T)
Tyrannosaurus_Rex<-as_tibble(a)
Tyrannosaurus_Rex_tbl<- Tyrannosaurus_Rex%>% 
  mutate(bone_factor = factor(bone, ordered = TRUE)) %>% 
  mutate(bone_value=as.numeric(bone_T)) 
anova_one_way <- aov(bone_value ~ bone_factor, data =Tyrannosaurus_Rex_tbl)
summary(anova_one_way)
#P值为1.01e-06，有理由说两组之间统计数据存在差异，我们可以相信霸王龙不是温血动物。

# MingYANG recommended：
# you can also try the code bellow for defining the appropriate data 
Bones<-"initiate"
Bones[1:4]<-"Rib_16"
Bones[5:7]<-"Gastralia"
Bones[8:10]<-"Gastralia2"
Bones[11:15]<-"Dorsal_vertebra"
Bones[16:20]<-"Dorsal_vertebra2"
Bones[21:24]<-"Femur"
Bones[25:29]<-"Tibia"
Bones[30:33]<-"Metatarsal"
Bones[34:36]<-"Phalange"
Bones[37:42]<-"Proximal_caudal"
Bones[43:47]<-"Mid_caudal"
Bones[48:52]<-"Distal_caudal"
Rib_16<-c(11.10, 11.22, 11.29, 11.49)
Gastralia<-c(11.32,	11.40,	11.71)
Gastralia2<-c(11.60,	11.78,	12.05)
Dorsal_vertebra<-c(10.61,	10.88,	11.12,	11.24,	11.43)
Dorsal_vertebra2<-c(10.92,	11.20, 11.30,	11.62,	11.70)
Femur<-c(11.70,	11.79,	11.91,	12.15)
Tibia<-c(11.33,	11.41,	11.62,	12.15,	12.30)
Metatarsal<-c(11.32,	11.65,	11.96,	12.15)
Phalange<-c(11.54,	11.89,	12.04)
Proximal_caudal<-c(10.93,	11.01,	11.08,	11.12,	11.28,	11.37)
Mid_caudal<-c(11.35,	11.43,	11.50,	11.57,	11.92)
Distal_caudal<-c(11.95,	12.01,	12.25,	12.30,	12.39)
# plot
Poxygen<-cbind(Rib_16,Gastralia,Gastralia2,Dorsal_vertebra,Dorsal_vertebra2,Femur,Tibia,Metatarsal,Phalange,Proximal_caudal,Mid_caudal,Distal_caudal)
boxplot(Poxygen,xlab="Bones",ylab="OIC",col=c(2:12))
# analyse
oxygen<-c(Rib_16,Gastralia,Gastralia2,Dorsal_vertebra,Dorsal_vertebra2,Femur,Tibia,Metatarsal,Phalange,Proximal_caudal,Mid_caudal,Distal_caudal)
bone_oxygen<-cbind(Bones,oxygen)
bone_oxygen_tb1<-as_tibble(bone_oxygen)
anova_one_way <- aov(oxygen ~ Bones, data = bone_oxygen_tb1)
summary(anova_one_way)
# the end
