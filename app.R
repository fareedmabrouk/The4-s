#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(readr)
library("ggplot2")
m_sal <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)
m_sal$Mid.Career.Median.Salary <- parse_number(m_sal$Mid.Career.Median.Salary)
custom_plot <- ggplot(data = majors_salary) +
    geom_col(mapping = aes(
        x = factor(month, level = sorted_summary$month),
        y = shooting_events
    )) + labs(
        y = "Major",
        x = "Salary",
        title = "Salary of each major"
    )


ui <- function(request) {
    fluidPage(
    navbarPage(
        "College Major Insights",
        intro,
        visualizations,
        conclusion,
        tech,
        about_us
        )
)
}
intro <- tabPanel(
    "Introduction",
    fluidPage(
        h1("Background"),
        p("This site is designed to give students the facts when it comes to
            deciding on a major. The amount of majors a college offers can be
            daunting, but we believe we can make the process easier! With
            data on each major's earnings, debt, satisfaction,
            post-graduation, undergraduates can make an informed decision on
            their major choice."),
        h1("Research Question"),
        p("- What top ten majors are the most in demand for the current job
           market across the U.S.?"),
        p("- How are those top ten majors related to the average salary and 
           employment rates?")
    )  
    )
    
tech <- tabPanel(
    "Behind the Tech",
    fluidPage(
        h1("Behind the Scenes"),
        h3("Data Visualization"),
        p("To create our graphs, we used..."),
        h3("Visuals"),
        p("To construct the UI for our site, Shiny was...")
    )
)
visualizations <- tabPanel(
    "Our visualizations1",
    sidebarLayout(
        sidebarPanel(
            selectInput(
                inputId = "m_choices",
                label = "Please select the majors you want to explore",
                choices = m_sal$Undergraduate.Major,
                multiple = T
            )
        ),
        mainPanel(
            plotOutput(outputId = "median_sal_plot"),
            textOutput(outputId = "major_choice")
        )
    )
)

conclusion <- tabPanel(
    "Conclusion",
    fluidPage(
        h1("Our results"),
        p("Our data shows...")
    )
)

about_fareed <- fixedRow(
    column(6, img(src="fareed_picture.png", height="25%", width="25%")),
    column(6, "My name is Fareed and I love UW!")
)      
about_skye <- fixedRow(
    column(6, img(src="fareed_picture.png", height="25%", width="25%")),
    column(6, "My name is Skye and I super love UW!")
)   

about_us <- tabPanel(
    "About Us",
    fluidPage(
        h1("Meet the Team!"),
        about_fareed,
        about_skye
        )
    )


server <- function(input, output) {
    output$median_sal_plot <- renderPlot({
        x <- input$m_choices
        y <- m_sal$Mid.Career.Median.Salary[m_sal$Undergraduate.Major == input$m_choices]
        ggplot(data = m_sal) +
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

# Run the application 
shinyApp(ui = ui, server = server)

