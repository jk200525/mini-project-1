# Data Visualization
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

# Importing the file
anime = read.csv("D:/BCA sem 4/Data Science/mini-project1 (Anime analysis)/anime.csv")

# Remove rows with missing values in critical columns
anime_clean <- anime %>% 
  drop_na(Age., Gender., Are.you.an.anime.watcher.)

# Check for duplicates and remove if necessary
anime_clean <- anime_clean %>% 
  distinct()

# Graph showing if people filling the survey are familiar with anime
barplot(table(anime_clean$Do.you.know.about.anime.),
        col = "lemonchiffon",
        main = "Do you know about anime?",
        xlab = "Response",
        ylab = "Count")

# Pie chart showing the distribution of anime watchers, occasional watchers, and non-watchers
watcher_data <- table(anime_clean$Are.you.an.anime.watcher.)
custom_colors <- c("royalblue", "lightgreen", "tomato")
pie(watcher_data,
    col = custom_colors[1:length(watcher_data)],
    main = "Are you an anime watcher?")

# Age distribution of anime watchers
ggplot(anime_clean, aes(x = Age.)) +
  geom_bar(fill = "deepskyblue") +
  labs(title = "Age Distribution", x = "Age Range", y = "Count")

# Gender distribution by anime watching status
ggplot(anime_clean, aes(x = Are.you.an.anime.watcher., fill = Gender.)) +
  geom_bar(position = "dodge") +
  labs(title = "Gender Distribution by Anime Watching Status",
       x = "Anime Watching Status",
       y = "Count",
       fill = "Gender") +
  theme_minimal()

# Satisfaction level by gender
ggplot(anime_clean, aes(x = Gender., y = How.satisfied.are.you.with..current.availability.of.anime.in.your.region., fill = Gender.)) +
  geom_boxplot() +
  labs(title = "Satisfaction by Gender", x = "Gender", y = "Satisfaction Level") +
  theme_minimal()

# Most preferred anime genres
anime_clean %>%
  count(Favorite.genre.., sort = TRUE) %>%
  ggplot(aes(x = reorder(Favorite.genre.., n), y = n)) +
  geom_col(fill = "darkred") +
  coord_flip() +
  labs(title = "Most Preferred Anime Genres",
       x = "Genre",
       y = "Count") +
  theme_minimal()

# Word cloud for favorite anime studios
fav_anime <- anime_clean$What.is.your.favorite.anime.studio.
fav_anime <- na.omit(fav_anime)  # Drop NA values

# Clean text for word cloud
library(tm)
fav_anime <- tolower(fav_anime)  # Convert to lowercase
fav_anime <- removePunctuation(fav_anime)  # Remove punctuation
fav_anime <- removeNumbers(fav_anime)      # Remove numbers
fav_anime <- removeWords(fav_anime, stopwords("en"))  # Remove stop words

# Create corpus and term-document matrix
corpus <- Corpus(VectorSource(fav_anime))
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
word_freqs <- sort(rowSums(m), decreasing = TRUE)

# Plot word cloud
set.seed(123)
wordcloud(words = names(word_freqs),
          freq = word_freqs,
          min.freq = 1,
          max.words = 100,
          random.order = FALSE,
          colors = brewer.pal(8, "Dark2"))
