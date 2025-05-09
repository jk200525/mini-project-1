# Data Analysis
library(dplyr)
library(tidyverse)
# Importing the file
anime = read.csv("D:/BCA sem 4/Data Science/mini-project1 (Anime analysis)/anime.csv")

# Remove rows with missing values in critical columns
anime_clean <- anime %>% 
  drop_na(Age., Gender., Are.you.an.anime.watcher.)

# Check for duplicates and remove if necessary
anime_clean <- anime_clean %>% 
  distinct()

# Calculate mean satisfaction level of anime watchers regarding availability in their region
mean_satisfaction <- mean(anime_clean$How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE)

# Calculate median satisfaction level
median_satisfaction <- median(anime_clean$How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE)

# Calculate standard deviation of satisfaction level
sd_satisfaction <- sd(anime_clean$How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE)

# Calculate quantiles of satisfaction level
satisfaction_quantiles <- quantile(anime_clean$How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE)

# Average satisfaction by gender
anime_clean %>%
  group_by(Gender.) %>%
  summarise(Average_Satisfaction = mean(How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE))

# Average satisfaction by age
anime_clean %>%
  group_by(Age.) %>%
  summarise(Average_Satisfaction = mean(How.satisfied.are.you.with..current.availability.of.anime.in.your.region., na.rm = TRUE))

# Create a contingency table: Chi-square test for association between gender and watching status
table_gender_watch <- table(anime_clean$Gender., anime_clean$Are.you.an.anime.watcher.)
chisq.test(table_gender_watch)
table_gender_watch

# Display summary statistics of the data set
summary(anime_clean)