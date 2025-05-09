# Data Cleaning
library(tidyr)
library(dplyr)

# Importing the file
anime = read.csv("D:/BCA sem 4/Data Science/mini-project1 (Anime analysis)/anime.csv")

# Check for missing values and handle if necessary
summary(anime)

# Remove rows with missing values in critical columns
anime_clean <- anime %>% 
  drop_na(Age., Gender., Are.you.an.anime.watcher.)

# Check for duplicates and remove if necessary
anime_clean <- anime_clean %>% 
  distinct()

# Ensure proper data types (e.g., converting Age to a factor)
anime_clean$Age. <- factor(anime_clean$Age., levels = c("10-12", "13-18", "19-25", "25+"), ordered = TRUE)

# View cleaned data
head(anime_clean)
