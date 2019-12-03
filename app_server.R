library("openintro")
library(dplyr)
library(eeptools)
source("analysis.R")

server <- function(input, output) {
  output$ret_rate <- renderPlot({
    retention_rate(input$c_picks)
  })
  output$out_tuition <- renderPlot({
    out_state_tuition(input$c_picks)
  })
  output$in_tuition <- renderPlot({
    in_state_tuition(input$c_picks)
  })
  output$grad_rate <- renderPlot({
    graduation_rate(input$c_picks)
  })
  output$median_sal_plot <- renderPlot({
    filter <- m_sal %>% filter(
      Undergraduate.Major %in% input$m_choices
    )
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
  
  # the table server
  output$major_choice <- {(
    renderText(input$m_choices)
  )}
  first_data <- reactive({
    m_sal %>% filter(Undergraduate.Major == input$first_major_select) %>% 
      select(Starting.Median.Salary, Mid.Career.Median.Salary)
  })
  second_data <- reactive({
    m_sal %>% filter(Undergraduate.Major == input$second_major_select) %>% 
      select(Starting.Median.Salary, Mid.Career.Median.Salary)
  })
  third_data <- reactive({
    m_sal %>% filter(Undergraduate.Major == input$third_major_select) %>% 
      select(Starting.Median.Salary, Mid.Career.Median.Salary)
  })
  
  output$first_major_list <- renderTable({
    first_data()
  })
  output$second_major_list <- renderTable({
    second_data()
  })
  output$third_major_list <- renderTable({
    third_data()
  })
}