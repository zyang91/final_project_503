library(tidyverse)
library(sf)
library(raster)
library(tidycensus)
library(exactextractr)

heat<- "C:/Users/zyang/Downloads/LC08_L2SP_013032_20240827_20240831_02_T1_ST_B10.TIF"
heat_raster <- raster(heat)

plot(heat_raster)


census<- st_read("C:/Users/zyang/OneDrive/desktop/final_project_503/data/nyct2020_24d/nyct2020.shp")


st_transform(census, st_crs(heat_raster))

#check
plot(census)

extract_values<-exact_extract(heat_raster, census, fun = "mean")

census$heat <- extract_values

acsVariables <- c(totpop = "B01001_001",
                  asian = "B03002_006", #Asian Non Hispanic alone,
                  black = "B03002_004", #Black non-Hispanic alone
                  hisp_latx = "B03003_003", #Hispanic/Latine
                  white = "B03002_003", #White Non-Hispanic
                  medInc = "B19013_001",
                  poverty_rate = "B17001_002E" ) 

mc_2022<- get_acs(geography = "tract",
                  variables = acsVariables,
                  state = "NY",
                  county = c("New York", "Kings", "Queens", "Bronx", "Richmond"),
                  survey= "acs5",
                  output= "wide",
                  geometry = FALSE,
                  year = 2022)

nyc_tract_data <- mc_2022%>%
  mutate(poverty_rate_percentage= (poverty_rate/totpopE)*100)%>%
  dplyr::select(GEOID, totpopE, asianE, blackE, hisp_latxE, whiteE, medIncE, poverty_rate, poverty_rate_percentage)

complete<-left_join(census, nyc_tract_data, by = c("GEOID" = "GEOID"))

complete<-complete%>%
  dplyr::select(GEOID, heat, totpopE, asianE, blackE, hisp_latxE, whiteE, medIncE, poverty_rate, poverty_rate_percentage)

write.csv(complete, "C:/Users/zyang/OneDrive/desktop/final_project_503/complete.csv")
st_write(complete, "C:/Users/zyang/OneDrive/desktop/final_project_503/complete.gpkg")
