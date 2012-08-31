doROCChart<-function(newPlot=FALSE){

pp <- test.df$prob
ll <- test.df$accepted

#par(mfrow=c(1,1))

pred<- prediction(pp, ll)

perf <- performance(pred, "tpr", "fpr")

if(newPlot)
  plot(perf, avg= "threshold", lwd= 3,col="grey78")
else
  plot(perf, avg= "threshold", lwd= 3,col="grey78")

#plot(perf, lty=3, col="grey78", add=T)

#return the area under the ROC chart
return(as.double(performance(pred,"auc")@y.values[1]))

}