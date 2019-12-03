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
  
  #region_salary_graph server
  output$region_info <- renderPlot({
    ploting <- mean_start() %>%
      filter(region %in% input$region)
    
    
    x <- input$region
    y <- data$start_med_salary
    
    ggplot(data = ploting, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("Starting_median_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info1 <- renderPlot({
    plot1 <- mean_10th() %>%
      filter(region %in% input$region)
    
    x <- input$region1
    y <- data$mid_career_10th
    
    ggplot(data = plot1, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("mid_career_10th_Percentile_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info2 <- renderPlot({
    plot2 <- mean_25th() %>%
      filter(region %in% input$region)
    
    x <- input$region2
    y <- data$mid_career_25th
    ggplot(data = plot2, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("mid_career_25th_Percentile_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info3 <- renderPlot({
    plot3 <- mean_mid() %>%
      filter(region %in% input$region)
    
    x <- input$region3
    y <- data$mid_career_salary
    
    ggplot(data = plot3, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("mid_career_median_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info4 <- renderPlot({
    plot4 <- mean_75th() %>%
      filter(region %in% input$region)
    
    x <- input$region4
    y <- data$mid_career_75th
    
    ggplot(data = plot4, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("mid_career_75th_Percentile_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info5 <- renderPlot({
    plot5 <- mean_90th() %>%
      filter(region %in% input$region)
    
    x <- input$region5
    y <- data$mid_career_90th
    
    ggplot(data = plot5, aes(x = input$region, y = sum)) + geom_bar(stat = "identity", fill = "steelblue") +
      xlab("region") + ylab("$(In dollar)") + ggtitle("mid_career_90th_Percentile_salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
}