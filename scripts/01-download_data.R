#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Yingzhi Zhang
# Date: 22 January 2024
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
raw_data <- read.csv("~/Documents/UofT/3rd year/STA302/sta302paper1/inputs/data")

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
