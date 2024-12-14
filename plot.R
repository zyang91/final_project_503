library(tidyverse)

setwd("C:/Users/zyang/OneDrive/desktop/final_project_503")

ggplot(complete,aes(x=totpopE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Total Population vs Heat",x="Total Population",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=medIncE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Median Income vs Heat",x="Median Income",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=poverty_rate_percentage,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Poverty Rate vs Heat",x="Poverty Rate",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=asianE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Asian Population vs Heat",x="Asian Population",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=blackE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Black Population vs Heat",x="Black Population",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=hisp_latxE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="Hispanic/Latine Population vs Heat",x="Hispanic/Latine Population",y="Heat")+
  theme_minimal()

ggplot(complete,aes(x=whiteE,y=heat))+
  geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="White Population vs Heat",x="White Population",y="Heat")+
  theme_minimal()


## model with racial + income
model1<-lm(heat~asianE+medIncE, data=complete)
summary(model1)

model1_1<-lm(heat~asianE+poverty_rate_percentage, data=complete)
summary(model1_1)

model2<-lm(heat~blackE+medIncE, data=complete)
summary(model2)

model2_1<-lm(heat~blackE+poverty_rate_percentage, data=complete)
summary(model2_1)

model3<-lm(heat~hisp_latxE+medIncE, data=complete)
summary(model3)

model3_1<-lm(heat~hisp_latxE+poverty_rate_percentage, data=complete)
summary(model3_1)

model4<-lm(heat~whiteE+medIncE, data=complete)
summary(model4)

model4_1<-lm(heat~whiteE+poverty_rate_percentage, data=complete)
summary(model4_1)