#* @get /demoR
get_predict_length <- function(){

  dataset <- iris

  # create the model
  model <- lm(Petal.Length ~ Petal.Width, data = dataset)
  petal_width = "0.4"

  #petal_width = '0.4'
  # convert the input to a number
  petal_width <- as.numeric(petal_width)

  #create the prediction data frame
  prediction_data <- data.frame(Petal.Width=petal_width)

  # create the prediction
  predict(model,prediction_data)
}
