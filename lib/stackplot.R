# Function to create stacked area plots of votes over time, smoothed with Loess function.
# PM June 2012

stackplot <- function(qid, tl, qdata, save=FALSE){

      tl2 <- subset(tl, tl$upvotes>0)
      
      votey <- (sum(tl$upvotes)/5)*-1
      
      #,stat = 'smooth'
      p <- ggplot(tl, aes(days, cumvotes, colour = AnswerId))  
      
      p <- p + geom_area(aes(colour = AnswerId, fill= AnswerId, order = as.numeric(AnswerId), position = 'stack'),stat='smooth', method="loess",size=0 ) #, , stat='smooth', method="loess", span =0.3, n=3
      
      p <- p + geom_point(data=tl2, y=votey, aes(x=days,colour = AnswerId, fill= AnswerId, size=upvotes ))
      
      p <- p + scale_area(range = c(10, 35))
      #p <- p + scale_size_manual(values=c(2,4,6))
      
      #, stat='smooth', method=lm, formula=y ~ poly(x, 2)
      #p <- p + geom_smooth(method="loess",n=3)
      p <- p +  scale_y_continuous(name="Cumulative Votes",limits=c(votey*2, sum(tl$upvotes)+(sum(tl$upvotes)/6)),breaks=c(0,round_any(sum(tl$upvotes),10,floor)) )
      p <- p +  scale_x_continuous(name="Days")
      
      p <- p + geom_abline(intercept = votey, slope = 0)
      p <- p + geom_abline(intercept = 0, slope = 0)
      
      p <- p +  theme_complete_bw()
      p <- p +  opts(title = paste(qdata$Title, "\n", qdata$Tags, ", ", qdata$ViewCount, " views")) #,legend.position = "none"
      
      
      #p <- p + geom_area(subset = .(Type %in% c('a', 'b')),aes(y=Value, fill=Type), position = 'stack')
      #p <- p + geom_area(subset = .(Type %in% c('c', 'd')),aes(y=Value, fill = Type),position = 'stack')
      
      # scale_fill_hue(l=40) + scale_colour_hue(l=40)
      #opts(legend.position = "none") 
      
      p <- p + scale_fill_manual(values=getColours(tl$AnswerId))
      p <- p + scale_colour_manual(values=getColours(tl$AnswerId))
      
      if(save==TRUE) {ggsave(filename = gsub(" ","", paste("../graphs/",qid,".png")))}
      return(p)

}