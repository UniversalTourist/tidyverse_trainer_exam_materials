# Load library
library(tidyverse)

#Load data
nordic_data <- read_csv("nordic_data.csv")

## Pipes
nordic_data %>% 
  select(Country_Name, Fertility_rate_total_births_per_woman_, year) %>% 
  filter( year == 1960) 


##

