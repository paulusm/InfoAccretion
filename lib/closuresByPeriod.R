closuresbyperiod <- function(){
  
  library(RMySQL)
   
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")  
    
  # main voting data
  closures.df <- dbGetQuery(con, "SELECT period, `count(*)` as closures
  FROM z_dupe_closures_by_period
  ORDER BY period")

  p <- ggplot(closures.df, aes(period, closures))
  p <- p + geom_point()
  p <- p + geom_smooth(aes(group=1))
  return(p)
}