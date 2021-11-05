library(tidyverse)

#load data
surveys <- read.csv("data/portal_data_joined.csv")
head(surveys)
colnames(surveys)

#2 subset
surveys % > % filter(weight > 30 & weight < 60)
surveys %>% 
  filter(weight > 30 & weight < 60)
  
#3 create tibble
biggest_critters <- surveys %>% 
#no NAs
  filter(!is.na(weight)) %>% 
group_by(species_id, sex) %>% 
summarise(max_weight = max(weight))

biggest_critters %>% arrange(max_weight)
#no NA by species
surveys %>% 
filter(is.na(weight)) %>% 
group_by(species) %>% 
tally() %>% 
arrange(desc(n))

#no NA by plot_id
surveys %>% 
filter(is.na(weight)) %>% 
group_by(plot_id) %>% 
tally() %>% 
arrange(desc(n))

#no NA by weight
surveys %>% 
filter(is.na(weight)) %>% 
group_by(year) %>% 
tally() %>% 
arrange(desc(n))

#saved as surveys_avg_weight
surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)

head(surveys_avg_weight)
#add column
surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)

surveys_avg_weight
