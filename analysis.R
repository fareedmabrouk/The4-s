# FAREED VISUALIZATIONS
library(readr)
m_sal <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
m_sal$Mid.Career.Median.Salary <- parse_number(m_sal$Mid.Career.Median.Salary)

colleges <- read.csv("data/college-data.csv", stringsAsFactors = FALSE)
colleges <- colleges[1:8]
colnames(colleges) <- c("ID", "name", "state", "college_level", "out_of_state_tuition", "in_state_tuition", "retention_rate", "graduation_rate")
