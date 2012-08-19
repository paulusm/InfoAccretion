doAccptReg <- function(){
  
  #training.df <- scale(training.df)
  
  accpt.log <- glm(accepted ~  mins + answerlength + containscode + userrep  + useraccpt + useranscount,
                  data=training.df,family=binomial())
  summary(accpt.log)
  test.df$prob <<- predict(accpt.log, newdata=test.df, type="response")
  
}