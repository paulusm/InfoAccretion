# Prepare dataset for the timeline stack graph
# PM June 2012

gettldata <- function(qid, daystoshow=0, minscore=1, initcols=T){
  
  #See if data already available, if so just return it
  objname<-paste("timeline_", qid,".df", sep="")
  if (objname %in% ls(envir = .GlobalEnv))
  {
   tl<-get(objname,envir = .GlobalEnv)
   if(initcols==T){initColours(tl$AnswerId)}
   return(tl)
  }
  
  #otherwise, hit the DB
  con <- dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
  
    
  
  # main voting data
  tl <- dbGetQuery(con, paste("select c.created, c.AnswerId, ifnull(d.votes,0) as upvotes, ifnull(e.votes,0) as downvotes, c.reputation,c.score from(
      select * from
                              (select  distinct created FROM z_timeline
                              WHERE Id=",qid, " and (type='upvote' or type='downvote')) as a  
                              ,
                              (select  distinct AnswerId, reputation, score FROM z_timeline
                              WHERE Id=",qid, " and (type='answer') ) as b
                              order by a.created, b.score desc) as c
                              left join
                              (SELECT created+86400 as created, AnswerId, count(type) as votes, reputation
                              FROM `z_timeline` 
                              WHERE Id=",qid, " and type='upvote' 
                              group by AnswerId, created, reputation 
                              order by created) as d
                              on c.created = d.created
                              and c.AnswerId = d.AnswerId
                              left join
                              (SELECT created+86400 as created, AnswerId, count(type)*-1 as votes, reputation
                              FROM `z_timeline` 
                              WHERE Id=",qid, " and type='downvote' 
                              group by AnswerId, created, reputation 
                              order by created) as e
                              on c.created = e.created
                              and c.AnswerId = e.AnswerId
                             "))
      # short: 3180. 2732
  # mid: 88,845060
  # long: 1711 (books), 6166 (php ide),888224 (wrong assumptions)
  # Good examples: 800123
  # 845058 (python line count), 43649 (oss projects),3550556  (Cracking)
  tl$AnswerId <- factor (tl$AnswerId)
  #foo<-tapply(tl$votes, INDEX=tl$AnswerId, FUN=cumsum)
  tl <- ddply(tl, .(AnswerId), transform, cumvotes=cumsum(upvotes+downvotes))
  tl <- arrange(tl,desc(score))
  tl$days <- (tl$created - min(tl$created))/60/60/24
  
  # filter by week / day
  if(daystoshow>0){
    tl<-tl[tl$days<=daystoshow,]
  }
  
  #take out scores over threshold
  tl<-tl[tl$score>minscore,]
  
  
  foo<-dbDisconnect(con) 
  
  if(initcols==T){initColours(tl$AnswerId)}
  
  #cache result
  assign(objname, tl, envir = .GlobalEnv)
  cache(objname)
 
  return(tl)
}