# functions to run logistic regression and get predictions using different models
# PM 2012

doAccptReg <- function(eqn){
  eqn<-as.formula(eqn)

  #training.df <- scale(training.df)
  training.df$containscode <- as.factor(training.df$containscode)
  test.df$containscode <- as.factor(test.df$containscode)
  #accpt.log <- glm(accepted ~  mins + answerlength + containscode + userrep  + useraccpt + useranscount,
  #                data=training.df,family=binomial())
  accpt.log <- glm(eqn,data=training.df,family=binomial())
  test.df$prob <<- predict(accpt.log, newdata=test.df, type="response")
  return(accpt.log)
}

getPredictionAccuracy <- function(){
  return ((nrow(with(test.df, subset(test.df, prob>=0.5 & accepted==1)))
            + nrow(with(test.df,subset(test.df, prob<0.5 & accepted==0)))) / nrow(test.df))
}

doAccptModelling <- function(){
  modelnames<-vector()
  predictions<-vector()
  AUC<-vector()
  
  model<-doAccptReg("accepted~ranked")
  modelnames<-append(modelnames, "temporal rank")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~ranked + ranked^2")
  modelnames<-append(modelnames, "quadratic temporal rank")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~log(ranked)")
  modelnames<-append(modelnames, "log of temporal rank")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~mins")
  modelnames<-append(modelnames, "time after question posted")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~answerlength")
  modelnames<-append(modelnames, "answer length (chars)")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~answerlength")
  modelnames<-append(modelnames, "Contains code")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~ranked+mins")
  modelnames<-append(modelnames, "temporal rank + time after question")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~ranked+answerlength")
  modelnames<-append(modelnames, "temporal rank + answer length")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~ranked+ answerlength + containscode")
  modelnames<-append(modelnames, "temporal rank + answer length + contains code")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  model<-doAccptReg("accepted~log(ranked)+ answerlength + containscode")
  modelnames<-append(modelnames, "log of temporal rank + answer length + contains code")
  predictions<-append(predictions, getPredictionAccuracy())
  AUC<-append(AUC, doROCChart())
  
  out.df<-data.frame(modelnames, predictions, AUC)
  colnames(out.df)<-c("Model","Prediction Accuracy(%)", "Area Under ROC Curve")
  return(out.df)
}