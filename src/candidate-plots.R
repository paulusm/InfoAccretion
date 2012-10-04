# Experimenting with question plots

qid<-652788
p<-stackplot(qid, gettldata(qid,1000,15,T), getqdata(qid), F) 
p

# sort dictionary by value
qid<-613183
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid), F) 
p

# new emerging - jquery grid
qid<-159025
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid), F) 
p

#fave git features muticolured
qid<-347901
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid), F) 
p



#PDO v Mysqli - new preferred answer
qid<-13569
p<-stackplot(qid, , getqdata(qid), F) 


#Euler question
qid<-295579
p<-stackplot(qid, gettldata(qid,200,6,T), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,200,6,initcols=F), getqdata(qid), F) 
p

# SOAP Android - Nice mix (complementary?)
qid<-297586
p<-stackplot(qid, gettldata(qid,1000,10,initcols=T), getqdata(qid), F) 
p
#p<-hourglass.plot(qid, gettldata(qid,1000,10,initcols=T), getqdata(qid), F) 
#p
p<-votingplot(qid, gettldata(qid,1000,10,initcols=F), getqdata(qid), F) 
p


# iphone
qid<-422066
p<-stackplot(qid, gettldata(qid,1000,2,initcols=T), getqdata(qid), F) 
p
p<-hourglass.plot(qid, gettldata(qid,1000,2,initcols=F), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,1000,2,initcols=F), getqdata(qid), F) 
p


# Cost of iPhone app
qid<-209170
p<-stackplot(qid, gettldata(qid,1000,10,initcols=T), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,1000,10,initcols=F), getqdata(qid), F) 
p