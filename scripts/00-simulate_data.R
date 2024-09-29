#### Preamble ####
# Purpose: Simulates a dataset of TTC streetcar delays, including the streetcar line, date and time (year, month, hour), location
# Author: Kevin Shen
# Date: 28 September 2024
# Contact: kevinz.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(tidyverse)
set.seed(2620) # Last four digits of student number used for seed

#### Simulate data ####
# Set the number of random dates you want to generate
num_rows <- 150

data <-
  tibble(
    year = 2022,
    month = as.integer(runif(
      n = num_rows,
      min = 1,
      max = 12
    )),
    hour = as.integer(runif(
      n = num_rows,
      min = 0,
      max = 23
    )),
    delay_mins = as.integer(runif(
      n = num_rows,
      min = 1,
      max = 120
    )),
    streetcar_line = sample(
      c(301, 512, 504, 509, 511, 505, 510, 503),
      size = num_rows, replace = TRUE
    ),
    location = sample(
      c("ST CLAIR STATION", "BATHURST STATION", "SPADINA AND KING", "MUNRO AND GERRARD"),
      size = num_rows, replace = True
    ),
    reason = sample(
      c("Emergency Services", "Operations", "Cleaning - Unsanitary", "Security"), 
      size = num_rows, replace = TRUE
    )
  )

#### Write_csv
write_csv(data, file = "data/simulated_data/simulated_streetcar_delay.csv")
