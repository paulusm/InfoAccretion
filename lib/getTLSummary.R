# Return a summary table for the timeline data
# PM 2012
getTLSummary <- function(){

  
  # return if already available
  objname<-"timeline_summary.df"
  if (objname %in% ls(envir = .GlobalEnv))
  {
    return(get(objname,envir = .GlobalEnv))
  }
  
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
    
  
  # main voting data
  tltable <- dbGetQuery(con,"SELECT  'Answers above 30 days old scoring more highly' as Description, count(*) FROM `z_scorebytime_summary2` WHERE thereafter > firstthirty
    union
    SELECT 'Answers less than 30 days old scoring more highly', count(*) FROM `z_scorebytime_summary2` WHERE thereafter <= firstthirty
    union
    SELECT  'No answers after 30 days', count(*) FROM `z_scorebytime_summary2` WHERE thereafter is null")

  
  foo<-dbDisconnect(con) 
  
  #cache result
  assign(objname, tltable, envir = .GlobalEnv)
  cache(objname)
  
  return(tltable)
  
}