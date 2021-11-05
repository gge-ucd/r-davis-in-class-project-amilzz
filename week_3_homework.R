#read in .csv
survey_data <- read.csv("data/portal_data_joined.csv")

head(survey_data)

#col names list
colnames(survey_data)

#selecting rows 1:60 & columns 6, 9 and 13
survey_subset <- surveys[1:60, c(6, 9, 13)]

#converting factor data to character
survey_subset$species_id <- as.character(survey_subset$species_id) 

#converting factor data to character 
survey_subset$plot_type <- as.character(survey_subset$plot_type)  


#selecting rows without NAs 
survey_subset <- survey_subset[complete.cases(survey_subset), ] 

#selecting weights greater than 150
challenge_base <- survey_subset[(survey_subset[, 2]>150),] 
