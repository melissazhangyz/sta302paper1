#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Yingzhi Zhang
# Date: 22 January 2024
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(lubridate)

#### Download data ####
raw_crisis_data <- 
  read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/persons-in-crisis-calls-for-service-attended/resource/4c8c589f-59d6-480e-81eb-7850dbdc1717/download/Persons%20in%20Crisis%20-%20Calls%20for%20Service%20Attended.csv")

head(raw_data)

#### Save data ####
write_csv(raw_crisis_data, "inputs/data/raw_data.csv") 

         
