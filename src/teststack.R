library(ggplot2)

#plot with dummy data
test.df<-data.frame(c(0,1,2,0,1,2,0,1,2), as.factor(c(0,0,0,1,1,1,2,2,2)), c(0,0,2,1,2,3,0,0,3))
colnames(test.df)<-c("days", "colour","answers")

p <- ggplot(test.df, aes(days, answers, colour = colour,fill=colour))  

p <- p + geom_area(stat='smooth', method="loess" ,aes(position = 'stack'),size=0) #, , stat='smooth', method="loess", span =0.3, n=3
p

#test plot
qid<-13569
p<-stackplot(qid, gettldata(qid,1000,6,T), getqdata(qid), F) 
p
p<-hourglass.plot(qid, gettldata(qid,1000,6,F), getqdata(qid), F) 
p