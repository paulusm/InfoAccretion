doAccptReg <- function(){
  library(pscl)
  #training.df <- scale(training.df)
  training.df$containscode <- as.factor(training.df$containscode)
  #accpt.log <- glm(accepted ~  mins + answerlength + containscode + userrep  + useraccpt + useranscount,
  #                data=training.df,family=binomial())
  accpt.log <- glm(accepted~ranked,data=training.df,family=binomial())
  test.df$prob <<- predict(accpt.log, newdata=test.df, type="response")
  return(accpt.log)
}