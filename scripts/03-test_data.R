#### Preamble ####
# Purpose: Test for data set
# Author: Yingzhi Zhang
# Date: 22 January 2024
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
read_csv("outputs/data/cleaned_data.csv")

#### Test types are correct####
types_of_crisis <- c("Person in Crisis", "Overdose", "Suicide-related")
sort(unique(cleaned_data$Type)) == sort(types_of_crisis)

#### Test year data####
min(cleaned_data$Year) == 2014
max(cleaned_data$Year) == 2023

#### Test month data####
is.character(cleaned_data$Month) == TRUE
sort(unique(cleaned_data$Month)) == c("01", "02", "03", "04", "05", "06", "07",
                                     "08", "09", "10", "11", "12")

#### Test occurrence and apprehension data####
sort(unique(cleaned_data$Occurence)) == sort(c("Yes", "No"))
sort(unique(cleaned_data$Apprehension)) == sort(c("Yes", "No"))

#### Test neighborhood number####
min(cleaned_data$Neighbourhood_number, na.rm = TRUE) >= 1
max(cleaned_data$Neighbourhood_number, na.rm = TRUE) <= 180

