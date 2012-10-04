# Preprocessing script.
# PM 2012
library(RMySQL)

# Logistic regression on acceptance
# Get all the data from SQL
con <-dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
accpt.train <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=1 order by rand() limit 5000")
nonaccpt.train <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=0 order by rand() limit 5000")
accpt.test <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=1 order by rand() limit 5000")
nonaccpt.test <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=0 order by rand() limit 5000")


foo<-dbDisconnect(con) 

training.df <- rbind(accpt.train, nonaccpt.train)
test.df <-  rbind(accpt.test, nonaccpt.test)

cache('training.df')
cache('test.df')

# get the diffs data
con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")

qdiff.df <- dbGetQuery(con, "select `score`, `viewcount`, `diff`, `minsbetween`, `bodyedits`, `titleedits`  from z_edit_summary where PostTypeId=1 and diff<1 order by rand() limit 100000")
qdiff.df$viewcount<-as.integer( qdiff.df$viewcount)
con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflowDec11", host="localhost")

adiff.df <- dbGetQuery(con, "select `score`, `diff`, `minsbetween`, `bodyedits` from z_edit_summary where PostTypeId=2 and diff<1 order by rand() limit 100000")

cache('qdiff.df')
cache('adiff.df')

foo<-dbDisconnect(con) 

