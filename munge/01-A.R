# Example preprocessing script.
library(RMySQL)

# Logistic regression on acceptance
# Get all the data from SQL
con <-dbConnect(MySQL(), user="stacko", password="stacko",dbname="StackOverflow", host="localhost")
accpt.train <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=1 order by rand() limit 5000")
nonaccpt.train <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=0 order by rand() limit 5000")
accpt.test <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=1 order by rand() limit 5000")
nonaccpt.test <-dbGetQuery(con,"select * from z_logistic_with_rank where accepted=0 order by rand() limit 5000")


foo<-dbDisconnect(con) 

#users[sample(1:dim(users)[1], size=2000, replace=FALSE),]

training.df <- rbind(accpt.train, nonaccpt.train)
test.df <-  rbind(accpt.test, nonaccpt.test)

#training.df <- rbind(accpt[sample(1:dim(accpt)[1], size=5000, replace=FALSE),],nonaccpt[sample(1:dim(nonaccpt)[1], size=5000, replace=FALSE),])
#test.df <-  rbind(accpt[sample(1:dim(accpt)[1], size=5000, replace=FALSE),],nonaccpt[sample(1:dim(nonaccpt)[1], size=5000, replace=FALSE),])

# Doesn't work as ranking needs to be done before sampling!
# training.df <- ddply(training.df, .(question), transform, rank=rank(mins))
# test.df <- ddply(test.df, .(question), transform, rank=rank(mins))


cache('training.df')
cache('test.df')

