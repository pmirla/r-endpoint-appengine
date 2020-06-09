#* @get /predict_petal_length
get_predict_length <- function(){

  dataset <- iris

  # create the model
  model <- lm(Petal.Length ~ Petal.Width, data = dataset)
  petal_width = "0.4"

  # convert the input to a number
  petal_width <- as.numeric(petal_width)

  #create the prediction data frame
  prediction_data <- data.frame(Petal.Width=petal_width)

  # create the prediction
  predict(model,prediction_data)
}



#* @get /readiness_check
readiness_check<- function(){
    return ("app ready edit2")
}


#' @get /
#' @html
function(){
  "<html><h1>It works!</h1></html>"
}


#' @get /hello
#' @html
function(){
  "<html><h1>hello world</h1></html>"
}

#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' Plot out data from the iris dataset
#' @param spec If provided, filter the data to only this species (e.g. 'setosa')
#' @get /plot
#' @png
function(spec){
  myData <- iris
  title <- "All Species"

  # Filter if the species was specified
  if (!missing(spec)){
    title <- paste0("Only the '", spec, "' Species")
    myData <- subset(iris, Species == spec)
  }

  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title, xlab="Sepal Length", ylab="Petal Length")
}

