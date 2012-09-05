diffs.correlation <- function(){

  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")
  
  # main voting data
  qdiff.df <<- dbGetQuery(con, "select `score`, `viewcount`, `diff`, `minsbetween`, `bodyedits` from z_edit_summary where PostTypeId=1")
     
  adiff.df <<- dbGetQuery(con, "select `score`, `viewcount`, `diff`, `minsbetween`, `titleedits` from z_edit_summary where PostTypeId=2")
  
  adiffcor<-cor (adiff.df,use="complete.obs",method="pearson")
  adiffcor
  
  qdiffcor<-cor (qdiff.df,use="complete.obs",method="pearson")
  qdiffcor
}