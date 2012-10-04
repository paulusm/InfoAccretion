# not used in paper
# exploratory work
# PM 2012

getscoreandtimingsscatter<-function(){
  library(RMySQL)
  library(ggplot2)
  library(grid)
  con <-dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
   
  sql <- "SELECT * FROM `z_Timings_Scores_Summary2` order by rand() limit 1000"
  
  data.df <-dbGetQuery(con,sql)
  
  nonacc.df<-subset(data.df, data.df$AScore <= data.df$BestNAScore)
  acc.df<-subset(data.df, data.df$AScore > data.df$BestNAScore)
  
  score<-c(mean(data.df$AScore), mean(data.df$BestNAScore))
  timing<-c(median(data.df$AMins),median(data.df$BestNAMins))
  count<-c(length(acc.df$AScore),length(nonacc.df$AScore))
  label<-c("Accepted", "Not Accepted")
  
  summary.df <- data.frame(score,timing,count,label)
  
  ggplot(summary.df, aes(x=score, y=timing, size=count, label=label))+
    geom_point(colour="white", fill="red", shape=21)+ scale_area(range=c(10,25))+
    scale_x_continuous(name="Average score", limits=c(0,5))+
    scale_y_continuous(name="Minutes after Question", limits=c(0,100))+
    geom_text(size=4)+
    opts(legend.position = "none") 
  
  foo<-dbDisconnect(con) 
  
}