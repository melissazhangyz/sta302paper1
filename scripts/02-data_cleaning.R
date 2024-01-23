#### Preamble ####
# Purpose: Cleans the raw crisis data
# Author: Yingzhi Zhang
# Date: 22 January 2024 
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(tidyr)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

raw_data <- 
  raw_data %>% 
  clean_names() %>% 
  drop_na()

cleaned_data <-
  raw_data %>% 
  select(objectid, event_year, event_month, event_dow, event_hour, event_type, 
         occurrence_created, apprehension_made, hood_158, neighbourhood_158) %>% 
  rename(ID = objectid,
         Year = event_year,
         Month = event_month,
         Day = event_dow,
         Time = event_hour,
         Type = event_type,
         Occurence = occurrence_created,
         Apprehension = apprehension_made,
         Neighbourhood_number = hood_158,
         Neighbourhood_name = neighbourhood_158)

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")
