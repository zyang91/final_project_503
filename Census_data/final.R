library(tidyverse)
library(tidycensus)
library(sf)

acs_2022<-load_variables(2022, "acs5")

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
                  geometry = TRUE,
                  year = 2022)

nyc_tract_data <- mc_2022%>%
  mutate(poverty_rate_percentage= (poverty_rate/totpopE)*100)%>%
  select(GEOID, totpopE, asianE, blackE, hisp_latxE, whiteE, medIncE, poverty_rate, poverty_rate_percentage, geometry)

setwd("C:/Users/zyang/OneDrive/Desktop")
st_write(obj = nyc_tract_data, dsn = "nyc.gpkg", delete_dsn = TRUE)


plot(nyc_tract_data["poverty_rate_percentage"])
plot(nyc_tract_data["medIncE"])
plot(nyc_tract_data["totpopE"])
