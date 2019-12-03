# FAREED VISUALIZATIONS
library(readr)
library(tidyr)

colleges <- read.csv("data/college-data.csv", stringsAsFactors = FALSE)
colleges <- colleges[1:8]
colleges <- na.omit(colleges)
colnames(colleges) <- c("ID", "name", "state", "college_level", "out_of_state_tuition", "in_state_tuition", "retention_rate", "graduation_rate")

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


