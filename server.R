library(shiny)

# data set and prediction
library(datasets)
library(caret)
library(randomForest)

# loading 
data(iris)

# prediction

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

shinyServer(
  function(input, output){
    output$species <- renderPrint({findSpecies(input$sl, input$sw, input$pl, input$pw)})

    output$plot1 <- renderPlot({
      print(
          plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data", xlab="Petal Length", ylab="Petal Width")
        )
      print(legend("topleft",inset=.05, as.vector(unique(iris$Species)),  fill=c("red", "green3", "blue")))
    })
    
    output$plot2 <- renderPlot({
      print(
        plot(iris$Sepal.Length, iris$Sepal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data", xlab="Sepal Length", ylab="Sepal Width")
      )
      print(legend("topleft",inset=.05, as.vector(unique(iris$Species)),  fill=c("red", "green3", "blue")))
    })

  })

  })

