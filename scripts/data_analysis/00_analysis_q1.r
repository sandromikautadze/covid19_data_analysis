#public

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

# Doing a matrix with each top4 country's data
# This method is pretty expensive and non-efficient, but is the only one I know
uk_data <- c(0.11326062 * 100, 1473672, 166909)
us_data <- c( 0.10861819 * 100, 17282363, 1877179)
tur_data <- c(0.08071172 * 100, 2031192, 163941)
it_data <- c(0.06152337 * 100, 4091291, 251710)
top4_matrix <- rbind(uk_data, us_data, tur_data, it_data)
rownames(top4_matrix) <- c("UK", "US", "Turkey", "Italy")
colnames(top4_matrix) <- c("Positive/Tested %", "Tested", "Positive")
