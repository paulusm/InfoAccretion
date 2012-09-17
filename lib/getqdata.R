getqdata <- function(qid){

  
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
  
  
  #question details
  getqdata <- dbGetQuery(con, paste("SELECT Title, Tags, ViewCount
      FROM posts WHERE Id =",qid))
  
  foo<-dbDisconnect(con) 
  
  return(getqdata)
}