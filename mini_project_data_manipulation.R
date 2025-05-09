# Data Manipulation
library(dplyr)

# Importing the file
anime = read.csv("D:/BCA sem 4/Data Science/mini-project1 (Anime analysis)/anime.csv")

# Remove rows with missing values in critical columns
anime_clean <- anime %>% 
  drop_na(Age., Gender., Are.you.an.anime.watcher.)

# Check for duplicates and remove if necessary
anime_clean <- anime_clean %>% 
  distinct()

# Displaying the names of people who filled the form
names <- anime_clean$Name.
names

# Selecting specific columns for analysis
age_anime_pref <- select(anime_clean, Name., Age., Are.you.an.anime.watcher.)
age_anime_pref

# Filtering anime watchers 
anime_watchers <- anime_clean %>%
  filter(Are.you.an.anime.watcher. %in% c("YESSSSSSSSS", "Occasional watcher")) %>%
  select(Name., Age., Gender.)
anime_watchers

# Filtering by preferences (e.g., anime watchers vs. non-watchers)
anime_watchers_pref <- anime_clean %>%
  select(Name., Age., Gender., Are.you.an.anime.watcher.)
anime_watchers_pref

# Grouping preference by age
age_prefer <- anime_clean %>%
  filter(Are.you.an.anime.watcher. %in% c("YESSSSSSSSS", "Occasional watcher")) %>%
  group_by(Age., What.do.you.prefer..1) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(desc(Count))
age_prefer

# Counting gender distribution among anime watchers, occasional watchers, and non-watchers
gender_distribution <- anime_clean %>%
  filter(Are.you.an.anime.watcher. == "YESSSSSSSSS") %>%
  count(Gender.)
gender_distribution

# Count preferences of anime watchers (movie vs. series)
anime_pref <- anime_clean %>%
  filter(Are.you.an.anime.watcher. %in% c("YESSSSSSSSS", "Occasional watcher")) %>%
  count(What.do.you.prefer..1)
anime_pref

# Count subbed/dubbed preference of anime watchers
sub_dub_pref <- anime_clean %>%
  filter(Are.you.an.anime.watcher. %in% c("YESSSSSSSSS", "Occasional watcher")) %>%
  count(What.do.you.prefer..2)
sub_dub_pref

# Categorizing satisfaction level into "High", "Low", "Medium"
anime_clean <- anime_clean %>%
  mutate(Satisfaction_Level = case_when(
    How.satisfied.are.you.with..current.availability.of.anime.in.your.region. <= 3 ~ "Low",
    How.satisfied.are.you.with..current.availability.of.anime.in.your.region. <= 7 ~ "Medium",
    TRUE ~ "High"
  ))
table(anime_clean$Satisfaction_Level)