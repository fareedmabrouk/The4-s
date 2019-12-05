source("analysis.R")
library(shiny)
library("ggplot2")
library("shinythemes")
ui <- function(request) {
  fluidPage(
    navbarPage(
      theme = shinytheme("united"),
      "College Major Insights",
      intro,
      table_viz,
      college_comparison,
      salary_by_region_viz,
      college_type_viz,

      conclusion,
      about_us
    )
  )
}


intro <- tabPanel(
  "Introduction",
  fluidRow(
    column(6, fluidPage(
      h1("Background"),
      h3("Problem Situation"),
      p("This site is designed to give students the facts when it comes to
                deciding on a major. The amount of majors a college offers can be
                daunting, but we believe we can make the process easier! With
                data on each major's earnings, debt, satisfaction,
                post-graduation, undergraduates can make an informed decision on
                their major choice."),
      h3("Why does it matter?"),
      p("It matters because colleges usually have hundreds of majors
                  available for students. It is really hard for college
                  students and their parents to decide what they want to major
                  in while considering future situations of the major. If a
                  student chooses to major in a field he interests in but
                  ignores the fact that it has a low employment rate, it is not
                  an ideal major for him. Moreover, if the student is forced to
                  choose a major just because the salary afterward is high,
                  college life could be painful for the student. In sum, our
                  project will provide the most up-to-date and helpful
                  information for college students to search for their ideal
                  major.")
    )), column(6, fluidPage(
      h3("How will it be addressed?"),
      p("This project collects data from various resources and integrates
              them into an overall outlook, presenting an inclusive trend of
              the current most popular majors in bachelor’s degrees (ranking by
              popularity). It provides a key indicator and guideline for
              incoming college freshmen to choose a college major based on the
              major’s prospects, including employment rate of majors and annual
              salary of alumni graduated from specific majors, across different
              states and period. Ultimately, the project will offer a clear
              direction for incoming freshmen on which way they should go
              further."),
      h1("Research Questions"),
      p("How can we help students narrow down their search for possible college and major options?"),
      p("Which majors can expect the highest initial salary post-graduation?"),
      p("What areas of the U.S. offer education with a high return salary-wise?")
    ))
  ),
  h3("Click here to check out the project proposal!", a("Link", href = "https://github.com/fareedmabrouk/college-insights/wiki/Project-Proposal-2"))
)

college_comparison <- tabPanel(
  "Compare Colleges",
  strong(" Have plenty of offers but can't make up your mind?", br(), "Select colleges below to compare the tuition,
    rentention, and graduate rates.", br(), "This information might be helpful for your college choice.", br(), br()),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "c_picks",
        label = "Please select the colleges you want to compare:",
        choices = colleges$name,
        multiple = TRUE
      )
    ),
    mainPanel(
      h1("See how the colleges you're considering stack up!"),
      h3("Compare Retention Rate"),
      plotOutput(outputId = "ret_rate"),
      h3("Compare In-state Tuition Prices"),
      plotOutput(outputId = "in_tuition"),
      h3("Compare Out-of-state Tuition Prices"),
      plotOutput(outputId = "out_tuition"),
      h3("Compare Graduation Rates"),
      plotOutput(outputId = "grad_rate"),
      h3("Analysis"),
      p("As an incoming freshman, there are no shortage of colleges that want your application/commitment,
         and the choices can be daunting. By providing you with an easy way to objectively compare any number
         of colleges you are considering based on tuition, retention, and graduation data, we hope to help
         make your decision easier and more informed.")
    )
  )
)
salary_by_region_viz <- tabPanel(
  "Salary by Regions",
  strong(
    "Which region has better salary across US? Choose regions you'd like to compare to see the result.", br(),
    "(Scroll the page for see more details for starting salaries in different regions, e.g. percentile)"
  ),

  titlePanel("Salary based on region"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "region",
        label = ("Select region for starting median salary"),
        choices = data$region,
        multiple = T,
        selected = "California"
      )
    ),


    mainPanel(
      plotOutput(outputId = "region_info"),
      plotOutput(outputId = "region_info1"),
      plotOutput(outputId = "region_info2"),
      plotOutput(outputId = "region_info3"),
      plotOutput(outputId = "region_info4"),
      plotOutput(outputId = "region_info5"),
      h3("Analysis"),
      p("These plots serve to help you narrow down your search geographically
         by looking at the statistics for colleges in the region you are considering.
         With the knowledge of starting, mid-career, and late-career salary statistics,
         we hope to help make the region you decide to attend college in one that promotes
         financial security.")
    )
  )
)

# The bar graphs and boxplots of salaries based on different school types.
college_type_viz <- tabPanel(
  "College-Type Comparison",
  strong("Have problems with school types?"),
  strong("Choose bar graphs or boxplots to see salaries for 
           different college types for help."),
  p(),
  fluidPage(
    boxplot_page <- tabPanel(
      # Give the title of the page.
      "Salaries based on college types",
      # Create the sidebar layout on this page.
      sidebarLayout(
        sidebarPanel(
          p(),
          p("Click the button below to check out the median of 
                  Starting salaries bar chart."),
          p(),
          actionButton(
            inputId = "plot1",
            label = "Starting salary bar chart"
          ),
          p(),
          p("Click the button below to check out the median of 
                  mid-career salaries bar chart."),
          p(),
          actionButton(
            inputId = "plot2",
            label = "Mid-career salary bar chart"
          ),
          p(),
          h4("Click buttons below for boxplots, 
                   to see the distributions."),
          p("(Scroll the page might be needed for the whole graph)"),
          p(),
          p("Click the button below to check out 
                  the starting salaries boxplot."),
          p(),
          actionButton(
            inputId = "plot3",
            label = "Starting salary boxplot"
          ),
          p(),
          p("Click the button below to check out the mid-career 
                  salaries boxplot."),
          p(),
          actionButton(
            inputId = "plot4",
            label = "Mid-career salary boxplot"
          ),
        ),
        # Create the main panel of two bar plots (one base on gender,
        # the other one by party) of the representatives of the
        # state selected by users in the side bar(selectInput).
        mainPanel(
          plotOutput(outputId = "starting_bar"),
          plotOutput(outputId = "mid_bar"),
          plotOutput(outputId = "starting_boxplot"),
          plotOutput(outputId = "mid_career_boxplot")
        )
      )
    )
  )
)

table_viz <- tabPanel(
  "Salary by Table",
  strong("Here is where we will put our salary table comparison that lets users
       easily compare salary projections for majors they're interested in
       exploring.", br(), br()),

  sidebarPanel(
    selectInput("first_major_select",
      label = h3("Select First Major"),
      choices = m_sal$Undergraduate.Major
    ),
    selectInput("second_major_select",
      label = h3("Select Second Major"),
      choices = m_sal$Undergraduate.Major
    ),
    selectInput("third_major_select",
      label = h3("Select Third Major"),
      choices = m_sal$Undergraduate.Major
    ),
  ),
  mainPanel(
    h3("Major Comparison Chart"),
    tableOutput("first_major_list"),
    tableOutput("second_major_list"),
    tableOutput("third_major_list")
  )
)

conclusion <- tabPanel(
  "Conclusion",
  fluidPage(
    h3("Conclusion for college types:"),
    p("The result can be more clear for this part since the ivy league 
          colleges and engineering schools always have higher salaries, 
          both on the starting and mid career salaries."),
    p("Also, the box plot shows that the salaries of Ivy League school 
          graduates are more condensed, which means there are higher 
          possibilities to get higher salary if you go to an Ivy League school."),
    p("Engineering schools can be a good choice as well, since they have 
          relatively high starting and mid-career salaries."),
    h3("Conlusion for regions:"),
    p("For salaries by regions, we found that the regions where have 
      higher starting salaries, have higher mid-career median salaries, 
      except in northeastern regions. It shows that, in general, 
      the northeastern region has better salaries development, 
      though California still has the highest median salary for mid career."),
    p(
      "For the midwestern region, it has the highest mid-career 90th-percentile salaries, 
    which means there are more exceptional salaries in midwestern, more extreme high salaries.
    If you want to have the absolute high salary, California is your better choice.", br(), br(),
      "However, if you are looking for the relatively better salary or job development, 
      the northeast might be more appropriate for you."
    )
  )
)

about_fareed <- fixedRow(
  column(3, img(src="fareed_picture2.png", height="60%", width="60%")),
  column(6, h4("My name is Fareed and I'm a sophomore at the University of Washington pursuing Informatics. In my free time I enjoy filmmaking and traveling!")),
  column(3, "")
)

about_skye <- fixedRow(
  column(3, img(src="skye_picture.png", height="60%", width="60%")),
  column(6, h4("I’m Skye, a current junior economics student at UW. I’m also minor in informatics. I’m collecting all prawn dishes across the world🦐.")),
  column(3, "")
)

about_iris <- fixedRow(
  column(3, img(src="xinyu_picture.png", height="60%", width="60%")),
  column(6, h4("I’m Xinyu and I’m a junior at UW. I’m currently major in economics and minor in informatics. I enjoy cooking,watching interesting shows and I hate running 🏃.")),
  column(3, "")
)

about_quinn <- fixedRow(
  column(3, img(src="quinn_picture.png", height="60%", width="60%")),
  column(6, h4("I’m Quinn and currently a psych major junior. I love my dog.")),
  column(3, "")
)

about_us <- tabPanel(
  "About Us",
  fluidPage(
    h1("Meet the Team!"),
    about_fareed,
    about_skye,
    about_iris,
    about_quinn
  )
)

