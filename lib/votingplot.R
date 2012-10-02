# Function to create stacked area plots of votes over time, smoothed with Loess function.
# PM June 2012

votingplot <- function(qid, tl, qdata, save=FALSE){
  
  tl <- subset(tl, tl$upvotes>0)
  p <- ggplot(tl, aes(days, 0, colour = AnswerId,size=upvotes)  )
  p <-p+ scale_area(range=c(5,20))
 # p <- p + geom_dotplot(stackgroups = TRUE, binwidth = 16, binpositions = "all",binaxis = "x", stackdir = "center",aes(colour = AnswerId, fill= AnswerId, order = as.numeric(AnswerId), dotsize=log(upvotes) )) #, ,, stat="identity"

  p <- p + geom_point() #, ,, stat="identity"
  
  
  p <- p +  scale_y_continuous(name="Votes",limits=c(-0.5,0.5))
  p <- p +  scale_x_continuous(name="Days")
  p <- p +  theme_complete_bw()
  p <- p +  opts(title = paste(qdata$Title, "\n", qdata$Tags, ", ", qdata$ViewCount, " views"), axis.text.y =  theme_blank()) #,legend.position = "none"
  
  p <- p + scale_fill_manual(values=getColours(tl$AnswerId))
  p <- p + scale_colour_manual(values=getColours(tl$AnswerId))
  
  if(save==TRUE) {ggsave(filename = gsub(" ","", paste("../graphs/",qid,".png")))}
  return(p)
  
}