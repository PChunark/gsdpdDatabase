library(tidyverse)
library(lubridate)

genFuel <-read.csv("data/controlGenFuel.csv") 

genFuel$TIMESTAMP <- as.POSIXct(genFuel$TIMESTAMP, format = "%m/%d/%Y %H:%M")

genFuel%>% # filter(FUELSUP == "ถ่านหินต่างประเทศ") %>%
  ggplot(aes(x = TIMESTAMP, y = ENERGY_GWH, group = FUELSUP)) +
  geom_line() + 
  facet_grid(~FUELSUP)
