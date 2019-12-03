library("openintro")
library(dplyr)
library(eeptools)
source("analysis.R")

server <- function(input, output) {
  # output$ret_rate <- renderPlot({
  #   filter <- colleges %>% filter(name %in% input$c_picks)
  # })
  output$median_sal_plot <- renderPlot({
    filter <- m_sal %>% filter(
      Undergraduate.Major %in% input$m_choices
    )
    x <- input$m_choices
    y <- m_sal$Mid.Career.Median.Salary
    ggplot(data = filter) +
      geom_col(mapping = aes(
        x = input$m_choices,
        y = Mid.Career.Median.Salary
      )) + labs(
        y = "Major",
        x = "Salary",
        title = "Salary of Each Selected Major"
      )
  })
  
  output$major_choice <- {(
    renderText(input$m_choices)
  )}
}