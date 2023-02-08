library(tidyverse)
library(lubridate)

#Load the data
genFuel <-read.csv("data/controlGenFuel.csv") 

#Convert the data to DATE-TIME
genFuel$DATA_DATE <- as.POSIXct(genFuel$DATA_DATE, format = "%m/%d/%Y %H:%M")

#Add separate year month yday
genFuel <- genFuel %>%
          mutate(year = year(DATA_DATE),
                 month = month(DATA_DATE),
                 yday = yday(DATA_DATE),) %>%
          mutate(month.abr = month.abb[month])

#Add date and time
genFuel$date <- as.Date(genFuel$DATA_DATE, format = "%m/%d/%Y")
genFuel$time <- format(as.POSIXct(genFuel$DATA_DATE), format = "%H:%M")  

# Draw coal figure
genFuel%>%  filter(FUELSUP == "ถ่านหินต่างประเทศ") %>%
  ggplot(aes(x = DATA_DATE, y = ENERGY_GWH, group = month)) +
  geom_line() + 
  facet_grid(year~.)
