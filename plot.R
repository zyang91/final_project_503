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

