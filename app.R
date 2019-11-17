#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

majors_salary <- read.csv("data/degrees-that-pay-back.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
    navbarPage(
        intro,
        visualizations,
        about_us
        )
)

intro <- fluidPage(
    "Intro",
    h1("Welcome to College Major Insights!")
    
) 

visualizations <- tabPanel(
    "Our visualizations",
    p("TEST8")
)


about_fareed <- fixedRow(
    column(9,
           fixedRow(
               column(3,
                      img(src="fareed_picture.png", height="75%", width="75%")
               ),
               column(3,
                      "My name is Fareed"
               )
           )
    )
) 
about_skye <- fixedRow(
    column(9,
           fixedRow(
               column(3,
                      img(src="fareed_picture.png", height="75%", width="75%")
               ),
               column(3,
                      "My name is Skye"
               )
           )
    )
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

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

