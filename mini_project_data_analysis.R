# Data Analysis
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

# Display summary statistics of the dataset
summary(anime_clean)
