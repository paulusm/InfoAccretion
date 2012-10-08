# Scatter charts of closures as a percentage of total questions
# PM 2012

dupeclosuresbyperiod <- function(){
  
  #See if data already available, if so just use it
  objname<-"dupeclosures.df"
  if (objname %in% ls(envir = .GlobalEnv))
  {
     data.df<-get(objname,envir = .GlobalEnv)
  }
  else{
       
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
    
      #cache result
      assign(objname, data.df, envir = .GlobalEnv)
      cache(objname)
  }
  
  p <- ggplot(data.df, aes(period, (closures/questions)*100))
  p <- p + geom_point()
  #p <- p + geom_point(aes(period, questions/100))
  p <- p + theme_complete_bw()
  p <- p + geom_smooth(aes(group=1))
  p <- p +  scale_y_continuous(name="Duplicate closures as a percentage of questions")
  p <- p + opts(axis.text.x=theme_text(angle=90,hjust=1,vjust=1))
  tiff("graphs/closures_dupes.tif",width=1024, height=1024)
  print(p)
  dev.off()
  return(p)
}


offtopicclosuresbyperiod <- function(){
  #See if data already available, if so just return it
  objname<-"offtopicclosures.df"
  if (objname %in% ls(envir = .GlobalEnv))
  {
      data.df <- get(objname,envir = .GlobalEnv)
  }
  else{
      con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")  
      
      # main voting data
      closures.df <- dbGetQuery(con, "SELECT period, `count(*)` as closures
      FROM z_offtopic_closures_by_period
                                ORDER BY period")
      
      questions.df <- dbGetQuery(con, "SELECT period, `count(*)` as questions
      FROM z_questions_by_period
                                 ORDER BY period")
      
      data.df <- questions.df[2:41,]
      data.df$closures <- closures.df$closures
      
      #cache result
      assign(objname, data.df, envir = .GlobalEnv)
      cache(objname)
  }
  
  p <- ggplot(data.df, aes(period, (closures/questions)*100))
  p <- p + geom_point()
  #p <- p + geom_point(aes(period, questions/100))
  p <- p + theme_complete_bw()
  p <- p + geom_smooth(aes(group=1))
  p <- p +  scale_y_continuous(name="Offtopic closures as a percentage of questions")
  p <- p + opts(axis.text.x=theme_text(angle=90,hjust=1,vjust=1))
  tiff("graphs/closures_offtopic.tif",width=1024, height=1024)
  print(p)
  dev.off()
  return(p)
  

}