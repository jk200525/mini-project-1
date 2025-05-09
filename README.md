Project Title:
Anime Survey Data Analysis in R
__________________________________
Description:
This project explores anime awareness, preferences, and satisfaction levels based on survey responses from individuals across different age groups and genders. 
Using R and the tidyverse ecosystem, the project applies data cleaning, manipulation, analysis, and visualization techniques to uncover insights into anime fandom trends.
_________
Dataset:
1. File: `anime.csv`
2. Contains responses to questions about:
  * Anime awareness
  * Watching habits (regular/occasional/non-watchers)
  * Format preferences (movies or series)
  * Subtitle choices (subbed/dubbed)
  * Favorite genres and studios
  * Satisfaction with anime availability
_________
Technologies Used:
1. R
2. tidyverse
3. dplyr
4. ggplot2
5. tm
6. wordcloud
7. RColorBrewer
__________
Data Cleaning:
1. Removed NA values
2. Standardized text fields (e.g., preferences)
3. Converted age into categorical data
4. Cleaned textual entries for text mining (word cloud)
__________
Data Analysis & Manipulation:
1. Grouped responses by gender, age, and watching status
2. Filtered and counted subgroups (e.g., regular watchers)
3. Summarized viewer satisfaction (mean, median, etc.)
__________
Visualizations:
1. Bar & pie charts for watcher distribution
2. Histogram for satisfaction levels
3. Word cloud for favorite anime studios
4. Age and gender-based viewer breakdown using ggplot2
__________
Key Insights:
1. How many people are aware of anime
2. Popular genres and formats
3. Differences in viewing behavior by age and gender
4. Satisfaction with anime availability across regions
__________
Report:
A detailed report (`Anime_Project_Report.docx`) is included that explains all steps, graphs, and findings from the project.
__________
Getting Started:
To run this project:
1. Clone the repository.
2. Open `anime_project.R` in RStudio.
3. Ensure all required packages are installed.
4. Run each section of code to explore insights.
__________
Contribution:
Feel free to fork, suggest improvements, or adapt it for your own survey-based projects.
