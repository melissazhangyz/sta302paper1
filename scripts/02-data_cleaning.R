#### Preamble ####
# Purpose: Cleans the raw crisis data
# Author: Yingzhi Zhang
# Date: 22 January 2024 
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)

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
  rename(
    ID = objectid,
    Year = event_year,
    Month = event_month,
    Day = event_dow,
    Time = event_hour,
    Type = event_type,
    Occurence = occurrence_created,
    Apprehension = apprehension_made,
    Neighbourhood_number = hood_158,
    Neighbourhood_name = neighbourhood_158
    ) %>% 
  mutate(
    Month = 
      case_match(
        Month,
        "January" ~ "01",
        "February" ~ "02",
        "March" ~ "03",
        "April" ~ "04",
        "May" ~ "05",
        "June" ~ "06",
        "July" ~ "07",
        "August" ~ "08",
        "September" ~ "09",
        "October" ~ "10",
        "November" ~ "11",
        "December" ~ "12"
      ) 
    ) %>%  
  mutate(
    Year = as.integer(Year),
    Time = as.integer(Time),
    Neighbourhood_number = as.integer(Neighbourhood_number)
    )

head(cleaned_data)

### Save general cleaned data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")



### Generating data for type classification ###
crisis_type_data <-
  cleaned_data %>% 
  group_by(Year, Type) %>%
  summarize(Number_of_crisis_call = n(), .groups = 'drop')

head(crisis_type_data)

#Save crisis_type data
write_csv(crisis_type_data, "outputs/data/crisis_type_data.csv")



### Generating data for Neighborhood ###
neighbourhood_data <-
  cleaned_data %>% 
  group_by(Year, Neighbourhood_number, Neighbourhood_name) %>% 
  summarise(Number = n(), .groups = 'drop') %>% 
  mutate(
    Council = 
      case_when(
        Neighbourhood_number >= 1 & Neighbourhood_number <= 26 ~ "Etobicoke York",
        Neighbourhood_number >= 27 & Neighbourhood_number <= 56 ~ "North York", 
        Neighbourhood_number >= 57 & Neighbourhood_number <= 115 ~ "Downtown Toronto and East York",
        Neighbourhood_number >= 116 & Neighbourhood_number <= 148 ~ "Scarborough",
        Neighbourhood_number >= 149 & Neighbourhood_number <= 155 ~ "North York",
        Neighbourhood_number >= 156 & Neighbourhood_number <= 157 ~ "Scarborough",
        Neighbourhood_number >= 158 & Neighbourhood_number <= 161 ~ "Etobicoke York",
        Neighbourhood_number >= 162 ~ "Downtown Toronto and East York"
      )
  )

head(neighbourhood_data)

#Save neighborhood_year data
write_csv(neighbourhood_data, "outputs/data/neighbourhood_data.csv")
  


### Generating data for time of the date
time_data <-
  cleaned_data %>% 
  mutate(
    time_of_day= 
      case_when(
        Time >= 0 & Time <= 6   ~ "Midnight",
        Time >= 7 & Time <= 12  ~ "Morning",
        Time >= 13 & Time <= 17 ~ "Afternoon",
        Time >= 18 & Time <= 23 ~ "Night")
    ) %>% 
  group_by(Type, time_of_day)

head(time_data)

#Save time_of_day data
write_csv(time_data, "outputs/data/time_data.csv")
  