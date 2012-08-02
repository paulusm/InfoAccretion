closuresbyperiod <- function(){
  
  library(RMySQL)
   
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")  
    
  # main voting data
  closures.df <- dbGetQuery(con, "SELECT period, `count(*)` as closures
  FROM z_dupe_closures_by_period
  ORDER BY period")
  
  questions.df <- dbGetQuery(con, "SELECT period, `count(*)` as questions
  FROM z_questions_by_period
  ORDER BY period")
  
  data.df <- questions.df[3:41,]
  data.df$closures <- closures.df$closures

  p <- ggplot(data.df, aes(period, (closures/questions)*100))
  p <- p + geom_point()
  #p <- p + geom_point(aes(period, questions/100))
  p <- p + geom_smooth(aes(group=1))
  p <- p +  scale_y_continuous(name="Duplicate closures as a percentage of questions")
  p <- p + opts(axis.text.x=theme_text(angle=90,hjust=1,vjust=1))
  return(p)
}