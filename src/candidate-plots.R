# Experimenting with question plots

qid<-652788
p<-stackplot(qid, gettldata(qid,1000,15,T), getqdata(qid), F) 
p

qid<-176264
p<-stackplot(qid, gettldata(qid,1000,3,T), getqdata(qid),T) 
p

#why use i as varname
qid<-454303 
p<-stackplot(qid, gettldata(qid,400,5,T), getqdata(qid)) 
p

# sort dictionary by value
qid<-613183
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid), F) 
p

# new emerging - jquery grid
qid<-159025
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid), T) 
p

#fave git features muticolured
qid<-347901
p<-stackplot(qid, gettldata(qid,1000,5,T), getqdata(qid),T) 
p



#PDO v Mysqli - new preferred answer
qid<-13569
p<-stackplot(qid, gettldata(qid,1000,1,T), getqdata(qid), T) 


#Euler question
qid<-295579
p<-stackplot(qid, gettldata(qid,200,6,T), getqdata(qid), F) 
tiff("graphs/test.tif",width=1024, height=102)
print(p)
dev.off()

# SOAP Android - Nice mix (complementary?)
qid<-297586
p<-stackplot(qid, gettldata(qid,1000,10,initcols=T), getqdata(qid), T) 
p
#p<-hourglass.plot(qid, gettldata(qid,1000,10,initcols=T), getqdata(qid), F) 
#p
p<-votingplot(qid, gettldata(qid,1000,10,initcols=F), getqdata(qid), F) 
p


# iphone
qid<-422066
p<-stackplot(qid, gettldata(qid,1000,2,initcols=T), getqdata(qid), T) 
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