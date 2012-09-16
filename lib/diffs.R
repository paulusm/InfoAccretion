
library("ggplot2")
library("grid")

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