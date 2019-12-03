# FAREED VISUALIZATIONS
library(readr)
library(tidyr)
library(dplyr)
<<<<<<< HEAD
m_sal <- read.csv("./data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
m_sal$Mid.Career.Median.Salary <- parse_number(m_sal$Mid.Career.Median.Salary)
=======
>>>>>>> 564f7b8267cadf3d2f7976857b7ad971611ca3d6

colleges <- read.csv("./data/college-data.csv", stringsAsFactors = FALSE)
colleges <- colleges[1:8]
colleges <- na.omit(colleges)
colnames(colleges) <- c("ID", "name", "state", "college_level", "out_of_state_tuition", "in_state_tuition", "retention_rate", "graduation_rate")

# FAREED VISUALIZATIONS
retention_rate <- function(input) {
  filter <- colleges %>% filter(name %in% input)
  ggplot(data = filter) +
    geom_col(mapping = aes(
      x = input,
      y = retention_rate
    )) + labs(
      y = "University",
      x = "Retention Rate",
      title = "Retention Rate of each University"
    )
}

retention_rate <- function(input) {
  filter <- colleges %>% filter(name %in% input)
  ggplot(data = filter) +
    geom_col(mapping = aes(
      x = input,
      y = retention_rate
    )) + labs(
      y = "University",
      x = "Retention Rate",
      title = "Retention Rate of each University"
    )
}

out_state_tuition <- function(input) {
  filter <- colleges %>% filter(name %in% input)
  ggplot(data = filter) +
    geom_col(mapping = aes(
      x = input,
      y = out_of_state_tuition
    )) + labs(
      y = "University",
      x = "Tuition Cost",
      title = "Out of State Tuition of each University"
    )
}

in_state_tuition <- function(input) {
  filter <- colleges %>% filter(name %in% input)
  ggplot(data = filter) +
    geom_col(mapping = aes(
      x = input,
      y = in_state_tuition
    )) + labs(
      y = "University",
      x = "Tuition Cost",
      title = "In-state Tuition of each University"
    )
}

graduation_rate <- function(input) {
  filter <- colleges %>% filter(name %in% input)
  ggplot(data = filter) +
    geom_col(mapping = aes(
      x = input,
      y = graduation_rate
    )) + labs(
      y = "University",
      x = "Graduation Rate",
      title = "Graduation Rate of each University"
    )
}

# XINYU VISUALIZATIONS
# Iris analysis
data <- read.csv("data/salaries-by-region.csv",
                 stringsAsFactors = FALSE,
                 col.names = c(
                   "school_name", "region", "start_med_salary",
                   "mid_career_salary", "mid_career_10th", "mid_career_25th", "mid_career_75th", "mid_career_90th"
                 )
)

data$start_med_salary <- gsub(",", "", data$start_med_salary)
data$start_med_salary <- gsub("\\$", "", data$start_med_salary)
data$start_med_salary <- as.numeric(data$start_med_salary)
round(data$start_med_salary, 1)

data$mid_career_salary <- gsub(",", "", data$mid_career_salary)
data$mid_career_salary <- gsub("\\$", "", data$mid_career_salary)
data$mid_career_salary <- as.numeric(data$mid_career_salary)
round(data$mid_career_salary, 1)

data$mid_career_10th <- gsub(",", "", data$mid_career_10th)
data$mid_career_10th <- gsub("\\$", "", data$mid_career_10th)
data$mid_career_10th <- as.numeric(data$mid_career_10th)
round(data$mid_career_10th, 1)
data$mid_career_25th <- gsub(",", "", data$mid_career_25th)
data$mid_career_25th <- gsub("\\$", "", data$mid_career_25th)
data$mid_career_25th <- as.numeric(data$mid_career_25th)
round(data$mid_career_25th, 1)

data$mid_career_75th <- gsub(",", "", data$mid_career_75th)
data$mid_career_75th <- gsub("\\$", "", data$mid_career_75th)
data$mid_career_75th <- as.numeric(data$mid_career_75th)
round(data$mid_career_75th, 1)

data$mid_career_90th <- gsub(",", "", data$mid_career_90th)
data$mid_career_90th <- gsub("\\$", "", data$mid_career_90th)
data$mid_career_90th <- as.numeric(data$mid_career_90th)
round(data$mid_career_90th, 1)



mean_start <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(start_med_salary, na.rm = TRUE,round(1)))
}



mean_10th <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(mid_career_10th, na.rm = TRUE,round(1)))
}

mean_25th <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(mid_career_25th, na.rm = TRUE,round(1)))
}

mean_mid <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(mid_career_salary, na.rm = TRUE,round(1)))
}


mean_75th <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(mid_career_75th, na.rm = TRUE,round(1)))
}

mean_90th <- function() {
  data %>%
    group_by(region) %>%
    summarise(sum = mean(mid_career_90th, na.rm = TRUE,round(1)))
}

# SKYE'S VISUALIZATIONS
median_summary <- read.csv("./data/summarise_df.csv", stringsAsFactors = FALSE)
df <- read.csv("./data/modified_df.csv", stringsAsFactors = FALSE)

