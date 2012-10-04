# Diffs analysis
# PM 2012

qdiffs.correlation <- function(){
  qdiffcor<-cor (qdiff.df,use="complete.obs", method="spearman")
  qdiffcor
}

adiffs.correlation <- function(){
  adiffcor<-cor (adiff.df,use="complete.obs", method="spearman")
  adiffcor
}

diffs.scatter<-function(){
  qdiff.sample.df <- qdiff.df[sample(1:dim(qdiff.df)[1], size=250, replace=FALSE),]
  qplot(diff,minsbetween, data=qdiff.sample.df)
}

adiffs.barplot<-function(){ 
  p <- ggplot(adiff.df, aes(diff) )
  p <- p + geom_bar() 
  p <- p + theme_complete_bw()
  p
}

qdiffs.barplot<-function(){ 
  p <- ggplot(qdiff.df, aes(diff) )
  p <- p + geom_bar() 
  p <- p + theme_complete_bw()
  p
}

diffs.linefreq<- function(){
  p <- ggplot(qdiff.df) 
  p <- p + geom_freqpoly(aes(x = diff), colour="red",size = 1.5,binwidth=0.02) 
  p <- p + geom_freqpoly(data=adiff.df,aes( x = diff), colour="blue",linetype="dashed",size = 1.5,binwidth=0.02)
  p <- p + scale_x_continuous(limits=c(0, 0.98))
  p <- p + theme_complete_bw()
  return(p)
}

diffs.timefreq<- function(){
  library(scales)
  p <- ggplot(qdiff.df) 
  p <- p + geom_freqpoly(aes(x = minsbetween/60/24), colour="red",size = 1.5) 
  p <- p + geom_freqpoly(data=adiff.df,aes( x = minsbetween/60/24), colour="blue",linetype="dashed",size = 1.5)
  p <- p + scale_x_log10(name="days (log scale)", labels=comma)
  p <- p + theme_complete_bw()
  return(p)
}
