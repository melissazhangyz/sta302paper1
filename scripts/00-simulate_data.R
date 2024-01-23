#### Preamble ####
# Purpose: Simulation for data
# Author: Yingzhi Zhang
# Date: 20 January 2024
# Contact: yingzhi.zhang@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(1099)

category_name <- c("Suicide Related", "Overdose", "Person in Crisis", "Elopee", "Jumper")

simulated_data <-
  tibble(
    "year" = rep(2017:2023, each = 5),
    "category" = rep(category_name, times = 7),
    "number" = round (runif(n = 7*5, min = 0, max = 1000), 0)
      )

head(simulated_data)





