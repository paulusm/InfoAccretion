# Function to create stacked area plots of votes over time, smoothed with Loess function.
# PM June 2012

votingplot <- function(qid, tl, qdata, save=FALSE){
  
  tl <- subset(tl, tl$upvotes>0)
  p <- ggplot(tl, aes(days, upvotes, colour = AnswerId))  
  
  p <- p + geom_dotplot(stackgroups = TRUE, binwidth = 14, binpositions = "all",binaxis = "x", stackdir = "center",aes(colour = AnswerId, fill= AnswerId, order = as.numeric(AnswerId)) ) #, ,, stat="identity"
  #, stat='smooth', method=lm, formula=y ~ poly(x, 2)
  #p <- p + geom_smooth(method="loess",n=3)
  p <- p +  scale_y_continuous(name="Votes")
  p <- p +  scale_x_continuous(name="Days")
  p <- p +  theme_complete_bw()
  p <- p +  opts(title = paste(qdata$Title, "\n", qdata$Tags, ", ", qdata$ViewCount, " views")) #,legend.position = "none"
  
  p <- p + scale_fill_manual(values=getColours(tl$AnswerId))
  p <- p + scale_colour_manual(values=getColours(tl$AnswerId))
  
  if(save==TRUE) {ggsave(filename = gsub(" ","", paste("../graphs/",qid,".png")))}
  return(p)
  
}