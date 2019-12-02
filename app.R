source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)























#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# library(shiny)
# library(readr)
# library("ggplot2")
# library(dplyr)
# m_sal <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
# m_sal$Mid.Career.Median.Salary <- parse_number(m_sal$Mid.Career.Median.Salary)
# 
# ui <- function(request) {
#     fluidPage(
#     navbarPage(
#         "College Major Insights",
#         intro,
#         salary_viz,
#         map_viz,
#         conclusion,
#         tech,
#         barchart_viz,
#         table_viz,
#         about_us
#         )
# )
# }
# 
# 
# intro <- tabPanel(
#     "Introduction",
#     fluidRow(
#             column(6, fluidPage(
#                 h1("Background"),
#                 h3("Problem Situation"),
#                 p("This site is designed to give students the facts when it comes to
#                 deciding on a major. The amount of majors a college offers can be
#                 daunting, but we believe we can make the process easier! With
#                 data on each major's earnings, debt, satisfaction,
#                 post-graduation, undergraduates can make an informed decision on
#                 their major choice."),
#                 h3("Why does it matter?"),
#                 p("It matters because colleges usually have hundreds of majors
#                   available for students. It is really hard for college
#                   students and their parents to decide what they want to major
#                   in while considering future situations of the major. If a
#                   student chooses to major in a field he interests in but
#                   ignores the fact that it has a low employment rate, it is not
#                   an ideal major for him. Moreover, if the student is forced to
#                   choose a major just because the salary afterward is high,
#                   college life could be painful for the student. In sum, our
#                   project will provide the most up-to-date and helpful
#                   information for college students to search for their ideal
#                   major.")
#         )), column(6, fluidPage(
#             h3("How will it be addressed?"),
#             p("This project collects data from various resources and integrates
#               them into an overall outlook, presenting an inclusive trend of
#               the current most popular majors in bachelor’s degrees (ranking by
#               popularity). It provides a key indicator and guideline for
#               incoming college freshmen to choose a college major based on the
#               major’s prospects, including employment rate of majors and annual
#               salary of alumni graduated from specific majors, across different
#               states and period. Ultimately, the project will offer a clear
#               direction for incoming freshmen on which way they should go
#               further."),
#             h1("Research Questions"),
#             p("Which majors can expect the highest initial salary post-graduation?"),
#             p("From a salary standpoint, graduates from which school can expect the greatest increase in salary development?"),
#             p("What are the most popular majors in each state?")
#         ))
#     ),
#     h3("Click here to check out the project proposal!", a("Link", href="https://github.com/fareedmabrouk/college-insights/wiki/Project-Proposal-2"))
# )
# 
# tech <- tabPanel(
#     "Behind the Tech",
#     fluidPage(
#         h1("Behind the Scenes"),
#         h3("Data Visualization"),
#         p("To create our graphs, we used..."),
#         h3("Visuals"),
#         p("To construct the UI for our site, Shiny was...")
#     )
# )
# 
# salary_viz <- tabPanel(
#     "Salary Graph",
#     h1("This graph compares the mid-career median Salary for your selected majors!"),
#     sidebarLayout(
#         sidebarPanel(
#             selectInput(
#                 inputId = "m_choices",
#                 label = "Please select the majors you want to explore",
#                 choices = m_sal$Undergraduate.Major,
#                 multiple = T
#             )
#         ),
#         mainPanel(
#             plotOutput(outputId = "median_sal_plot"),
#             textOutput(outputId = "major_choice")
#         )
#     )
# )
# 
# college_comparison <- tabPanel(
#     "See how the colleges you're considering stack up!",
#     sidebarLayout(
#         sidebarPanel(
#             selectInput(
#                 inputId = "m_choices",
#                 label = "Please select the majors you want to explore",
#                 choices = m_sal$Undergraduate.Major,
#                 multiple = T
#             )
#         ),
#         mainPanel(
#             plotOutput(outputId = "median_sal_plot"),
#             textOutput(outputId = "major_choice")
#         )
#     )
# )
# map_viz <- tabPanel(
#     "Majors Mapped across the U.S.",
#     fluidPage(
#         h1("Map Visualization"),
#         p("Here is where we will put our interactive visualization where
#            users can select a certain major they're interested and the map
#            will highlight popular areas for those majors. This will allow
#            the user to make an informed decision on where they might feel
#            the strongest sense of community based on major choice.")
#     )
# )
# barchart_viz <- tabPanel(
#     "College-Type Comparison",
#     fluidPage(
#         h1("Bar-chart Comparison Graph"),
#         p("Here is where we will we put a graph that compares salary based
#            on the college types.")
#     )
# )
# table_viz <- tabPanel(
#     "Salary by Table",
#     p("Here is where we will put our salary table comparison that lets users
#        easily compare salary projections for majors they're interested in
#        exploring.")
# )
# 
# conclusion <- tabPanel(
#     "Conclusion",
#     fluidPage(
#         h1("Our results"),
#         p("This is where we will put the insights from the results of our
#            data visualizations.")
#     )
# )
# 
# # about_fareed <- fixedRow(
# #     column(6, img(src="fareed_picture.png", height="25%", width="25%")),
# #     column(6, "My name is Fareed and I love UW!")
# # )      
# 
# about_us <- tabPanel(
#     "About Us",
#     fluidPage(
#         h1("Meet the Team!"),
#         p("Here is where we will put pictures of our team as well as a short
#            description of each member.")
#         )
#     )
# 
# 
# server <- function(input, output) {
#     output$ret_rate <- renderPlot({
#         filter <- colleges %>% filter(name %in% input$)
#     })
#     output$median_sal_plot <- renderPlot({
#         filter <- m_sal %>% filter(
#             Undergraduate.Major %in% input$m_choices
#         )
#         x <- input$m_choices
#         y <- m_sal$Mid.Career.Median.Salary
#         ggplot(data = filter) +
#             geom_col(mapping = aes(
#                 x = input$m_choices,
#                 y = Mid.Career.Median.Salary
#             )) + labs(
#                 y = "Major",
#                 x = "Salary",
#                 title = "Salary of Each Selected Major"
#             )
#     })
#     
#     output$major_choice <- {(
#         renderText(input$m_choices)
#     )}
# }

# Run the application 


