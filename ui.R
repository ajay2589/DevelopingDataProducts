library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Plant Species Predictor"),
    sidebarPanel(
      h3("Flower Dimensions"),
      p('Please use the sliders to input the dimensions and click on Predict'),
      sliderInput('sl', 'Sepal Length in mm', 6.0, min = 4.3, max = 7.9, step = 0.1),
      sliderInput('sw', 'Sepal Width in mm', 3.0, min = 2.0, max = 4.4, step = 0.1),
      sliderInput('pl', 'Petal Length in mm', 4.0, min = 1.0, max = 6.9, step = 0.1),
      sliderInput('pw', 'Petal Width in mm', 1.0, min = 0.1, max = 2.5, step = 0.1),
      submitButton('Predict')
      ),
    mainPanel(
      h3('The species to which your plant belongs is'),
      verbatimTextOutput("species"),
      p("This prediction is made using Random Forest Classifier")
      )
    )
  )