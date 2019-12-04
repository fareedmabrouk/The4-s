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
    
    ggplot(data = ploting, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#f5985b") +
      xlab("region") + 
      ylab("$(In dollar)") + 
      ggtitle("Starting Median Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info1 <- renderPlot({
    plot1 <- mean_10th() %>%
      filter(region %in% input$region)
    
    x <- input$region1
    y <- data$mid_career_10th
    
    ggplot(data = plot1, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#4abdac") +
      xlab("region") + 
      ylab("$(In dollar)") + 
      ggtitle("Mid Career 10th Percentile Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info2 <- renderPlot({
    plot2 <- mean_25th() %>%
      filter(region %in% input$region)
    
    x <- input$region2
    y <- data$mid_career_25th
    ggplot(data = plot2, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#f5985b") +
      xlab("region") + 
      ylab("$(In dollar)") + 
      ggtitle("Mid Career 25th Percentile Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info3 <- renderPlot({
    plot3 <- mean_mid() %>%
      filter(region %in% input$region)
    
    x <- input$region3
    y <- data$mid_career_salary
    
    ggplot(data = plot3, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#4abdac") +
      xlab("region") + 
      ylab("$(In dollar)") + 
      ggtitle("Mid Career Median Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info4 <- renderPlot({
    plot4 <- mean_75th() %>%
      filter(region %in% input$region)
    
    x <- input$region4
    y <- data$mid_career_75th
    
    ggplot(data = plot4, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#f5985b") +
      xlab("region") + 
      ylab("$(In dollar)") + 
      ggtitle("Mid Career 75th Percentile Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  output$region_info5 <- renderPlot({
    plot5 <- mean_90th() %>%
      filter(region %in% input$region)
    
    x <- input$region5
    y <- data$mid_career_90th
    
    ggplot(data = plot5, aes(x = input$region, y = sum)) + 
      geom_bar(stat = "identity", fill = "#4abdac") +
      xlab("region") + 
      ylab("$(In dollar)") +
      ggtitle("Mid Career 90th Percentile Salary") +
      geom_text(aes(label = sum), vjust = 1.6, color = "white", size = 3)
  })
  
# ---------------- salaries by college types ---------------
  # plot 1
  starting1 <- eventReactive(input$plot1, {
    ggplot(data = median_summary, 
           aes(x = school_type, y = starting_salary)) +
      geom_bar(stat = "identity", fill = "#f7b733") + xlab("School Type") +
      ylab("Median of Starting  Salaries") +
      ggtitle("The bar graph of starting salaries of different school types") +
      geom_text(aes(label = starting_salary), vjust = 1.6, color = "white", size = 3)
  })
  output$starting_bar <- renderPlot({
    starting1()
  })
  
  # plot 2
  mid1 <- eventReactive(input$plot2, {
    ggplot(data = median_summary, 
           aes(x = school_type, y = mid_career_salary)) +
      geom_bar(stat = "identity", fill = "#DF744A") + xlab("School Type") +
      ylab("Median of mid-career salaries of different school types") +
      ggtitle("The bar graph of Mid-career Salaries") +
      geom_text(aes(label = mid_career_salary), vjust = 1.6, color = "white", size = 3)
  })
  output$mid_bar <- renderPlot({
    mid1()
  })
  
  # plot 3
  starting2 <- eventReactive(input$plot3, {
    ggplot(df, aes(x = School.Type, y = Starting.Median.Salary)) +
      ggtitle("The boxplot of starting salaries") +
      geom_boxplot(fill = "#f7b733", color = "darkorange") +
      xlab("School Type") +
      ylab("Median of starting Salaries")
  })
  output$starting_boxplot <- renderPlot({
    starting2()
  })
  
  # plot 4
  mid2 <- eventReactive(input$plot4, {
    ggplot(df, aes(x = School.Type, y = Mid.Career.Median.Salary)) +
      ggtitle("The box plot of mid-career salaries") +
      geom_boxplot(fill = "#f5985b", color = "darkorange") +
      xlab("School Type") +
      ylab("Median of mid-career Salaries")
  })
  output$mid_career_boxplot <- renderPlot({
    mid2()
  })
}
