#PDO v Mysqli - new preferred answer
qid<-13569
p<-stackplot(qid, gettldata(qid,1000,6,T), getqdata(qid), F) 
p
p<-hourglass.plot(qid, gettldata(qid,1000,6,F), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,1000,6,initcols=F), getqdata(qid), F) 
p

#xPath tester - late activity
qid<-688323
p<-stackplot(qid, gettldata(qid,initcols=T), getqdata(qid), F) 
p
p<-hourglass.plot(qid, gettldata(qid,initcols=F), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,initcols=F), getqdata(qid), F) 
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
p<-hourglass.plot(qid, gettldata(qid,1000,10,initcols=F), getqdata(qid), F) 
p
p<-votingplot(qid, gettldata(qid,1000,10,initcols=F), getqdata(qid), F) 
p