#1
surveys <- read.csv("data/portal_data_joined.csv")
summary(surveys$hindfoot_length)

#condenses
ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length, na.rm = T), 'small', 'big')
surveys <- mutate(surveys,hindfoot_size = ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length, na.rm = T), 'small', 'big'))
surveys$hindfoot_size


##joining
tail <- read_csv('data/tail_length.csv')
str(tail)


surveys_joined <- left_join(surveys,tail, by= "record_id")
str(surveys_joined)

surveys_wide <- surveys %>% filter(!is.na(hindfoot_length)) %>% group_by(genus, plot_type) %>% summarise(mean_hindfoot = mean(hindfoot_length)) %>% pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% arrange(Control)

head(surveys_wide)
summary(surveys_wide)


surveys %>% mutate(weight_cat = case_when(weight >= 20.00 ~ "small",weight > 20.00 & weight < 48.00 ~ "medium",T ~ "large"))


surveys %>% mutate(weight_cat = case_when(weight >= 20.00 ~ "small",weight > 20.00 & weight < 48.00 ~ "medium",weight >= 48.00 ~ "large"))



surveys %>% mutate(weight_cat = ifelse(weight >= 20.00, "small",
ifelse(weight > 20.00 & weight < 48.00, "medium","large")))





