#### Preamble ####
# Purpose: Simulates a dataset of TTC streetcar delays, including the streetcar line, date and time (year, month, hour), location
# Author: Kevin Shen
# Date: 28 September 2024
# Contact: kevinz.shen@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
set.seed(2620) # last 4 digits of student number used for seed

#### Download data ####
# Get package
package <- show_package("b68cb71b-44a7-4394-97e2-5d2f41462a5d")

# Retrieve resources
resources <- list_package_resources("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
datastore_resources <- filter(resources, tolower(format) == 'xlsx')

# Load TTC data for delays in the year of 2022
ttc_delay_data_2022 <- filter(datastore_resources,
                          name == "ttc-streetcar-delay-data-2022") %>% get_resource()

# Save data
write_csv(delay_data_2023, "data/raw_data/unedited_ttc_streetcar_delay_2022.csv") 