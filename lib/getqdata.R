# Get basic question data for charts
# PM Sep 2012

getqdata <- function(qid){
  
  # return if already available
  objname<-paste("qdata_", qid,".df", sep="")
  if (objname %in% ls(envir = .GlobalEnv))
  {
    return(get(objname,envir = .GlobalEnv))
  }
  
  #..or load from DB
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
  
  
  #question details
  getqdata <- dbGetQuery(con, paste("SELECT Title, Tags, ViewCount
      FROM posts WHERE Id =",qid))
  
  foo<-dbDisconnect(con) 
  
  #cache result 
  assign(objname, getqdata, envir = .GlobalEnv)
  cache(objname)
  
  return(getqdata)
}