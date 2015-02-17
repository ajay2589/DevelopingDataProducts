
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)

#UI

shinyUI(
  navbarPage("Plant Species Predictor",
    tabPanel("Predictor",
      
      sidebarPanel(
        h3("Flower Dimensions"),
        ##p('Please use the sliders to input the dimensions and click on Predict'),
        sliderInput('sl', 'Sepal Length in mm', 6.0, min = 4.3, max = 7.9, step = 0.1),
        sliderInput('sw', 'Sepal Width in mm', 3.0, min = 2.0, max = 4.4, step = 0.1),
        sliderInput('pl', 'Petal Length in mm', 4.0, min = 1.0, max = 6.9, step = 0.1),
        sliderInput('pw', 'Petal Width in mm', 1.0, min = 0.1, max = 2.5, step = 0.1),
        submitButton('Predict')
        ),
      
      mainPanel(
          h3('The species to which your plant belongs is'),
          tags$style(type='text/css', '#species {background-color: rgba(255,255,0,0.40); color: green;}'), 
          tabPanel("Output 1", verbatimTextOutput("species"))
       )
    ),

    
    tabPanel("Distribution",
             mainPanel(
               h2('Distribution of species in Iris Data'),
               h3('Based on Petal Dimensions'),
               plotOutput("plot1"),
               p(""),
               h3('Based on Sepal Dimensions'),
               plotOutput("plot2")
             )
    ),
    
    
    tabPanel("How to use?",
      mainPanel(
        includeMarkdown("Documentation.md")
        )
      )
    )
  )