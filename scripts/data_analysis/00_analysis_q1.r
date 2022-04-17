library(tidyverse)

# Getting new table of overall number of COVID-19 tested, positive, active, and
# hospitalized cases by country (with tested column in descending order)
covid19_allstates_daily_sum <- covid19_allstates_daily %>% 
                               group_by(Country_Region) %>%
                               summarise(tested = daily_tested %>% sum,
                                         positive = daily_positive %>% sum,
                                         active = active %>% sum,
                                         hospitalized = hospitalizedCurr %>% sum
                               ) %>%
                               arrange(-tested)

# Getting first 10 countries of covid19_allstates_daily_sum
covid19_top10 <- head(covid19_allstates_daily_sum, 10)

# Extracting vector for countries, tests, and positives
countries <- covid19_top10 %>% pull(Country_Region)
tested_cases <- covid19_top10 %>% pull(tested)
positive_cases <- covid19_top10 %>% pull(positive)

# Assigning the country names to the tests and positive vectors
names(tested_cases) <- countries
names(positive_cases) <- countries

# CONCLUSION 
# Getting vector of positives/tests ratio and finding the top 4
positive_tested_ratio <- sort(positive_cases / tested_cases)
ratio_top4 <- positive_tested_ratio[length(positive_tested_ratio):
                                    (length(positive_tested_ratio) - 3)]

# We save the results of the top4 countries in a smaller version of our data
# set in the form of a matrix


