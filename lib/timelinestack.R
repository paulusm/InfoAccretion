sample100random <- function(){


library(RMySQL)

con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")

#sample of questions with a few answers and votes - and score >3

qsample <- dbGetQuery(con,"select Id, count(*) from z_timeline
where type = 'answer' and score >4
group by Id
having count(*) > 3 
order by rand()
limit 100")

for(i in 1:nrow(qsample)) {
  tldata <- gettldata(qsample[i,]$Id)
  qdata <- getqdata(qsample[i,]$Id)
  hourglassplot(qsample[i,]$Id,tldata,qdata,T)  
  
}
dbDisconnect(con) 
}

