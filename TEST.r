library("ggplot2")

m_sal <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
m_sal$Mid.Career.Median.Salary <- parse_number(m_sal$Mid.Career.Median.Salary)
choices <- c("English", "Film", "Finance", "Forestry")
test_df <- m_sal %>% filter(
  Undergraduate.Major %in% choices
)
plot <- ggplot(data = test_df) +
  geom_col(mapping = aes(
    x = choices,
    y = Mid.Career.Median.Salary
  )) + labs(
    y = "Major",
    x = "Salary",
    title = "Salary of Each Selected Major"
  )