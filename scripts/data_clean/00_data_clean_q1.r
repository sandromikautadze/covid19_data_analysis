library(tidyverse)

# loading raw data
covid19_raw <- read.csv("raw_data/covid19.csv")

# keeping only "All States" row-values from "Province_State" column
covid19_allstates <- covid19_raw %>% filter(Province_State == "All States")

# keeping only daily-valued columns
covid19_allstates_daily <- covid19_allstates %>% select(Date,
                                                        Country_Region,
                                                        active,
                                                        hospitalizedCurr,
                                                        daily_tested,
                                                        daily_positive)

# Data is now clean


# NOTE:
# All of this could have been easily done in one line with
# covid19_allstates_daily <- read.csv("raw_data/covid19.csv") %>%
#                            filter(Province_State == "All States") %>%
#                            select(Date,
#                                   Country_Region,
#                                   active,
#                                   hospitalizedCurr,
#                                   daily_tested,
#                                   daily_positive)
# Even if this method is much preferred for readability, I decided to split
# the commands at each step for clarity reasons in the report.