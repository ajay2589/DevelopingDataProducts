library(shiny)
library(datasets)
library(caret)
library(randomForest)

findSpecies <- function(sl,sw,pl,pw){
  result <- "versicolor"
  
  Sepal.Length <- sl
  Sepal.Width <- sw
  Petal.Length <- pl
  Petal.Width <- pw
                   
  rfModel <- randomForest(Species~.,data=iris, ntree=100, importance=TRUE)
  temp <- cbind(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
                   
  predictedSpecies <- predict(rfModel, temp, type="class")
  if(predictedSpecies == "versicolor")
    result <- "Versicolor"
  if(predictedSpecies == "virginica")
    result <- "Virginica"
  if(predictedSpecies == "setosa")
    result <- "Setosa"
  result
}



data(iris)
shinyServer(
  function(input, output){
    output$species <- renderPrint({findSpecies(input$sl, input$sw, input$pl, input$pw)})
    
  })