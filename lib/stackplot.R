# Function to create stacked area plots of votes over time, smoothed with Loess function.
# PM June 2012

stackplot <- function(qid, tl, qdata, save=FALSE){

      
      #,stat = 'smooth'
      p <- ggplot(tl, aes(days, cumvotes, colour = AnswerId))  
      
      p <- p + geom_area(aes(colour = AnswerId, fill= AnswerId, order = as.numeric(AnswerId), position = 'stack'),stat='smooth', method="loess",size=0 ) #, , stat='smooth', method="loess", span =0.3, n=3
      #, stat='smooth', method=lm, formula=y ~ poly(x, 2)
      #p <- p + geom_smooth(method="loess",n=3)
      p <- p +  scale_y_continuous(name="Cumulative Votes")
      p <- p +  scale_x_continuous(name="Days")
      p <- p +  theme_complete_bw()
      p <- p +  opts(title = paste(qdata$Title, "\n", qdata$Tags, ", ", qdata$ViewCount, " views"),legend.position = "none") 
      
      
      #p <- p + geom_area(subset = .(Type %in% c('a', 'b')),aes(y=Value, fill=Type), position = 'stack')
      #p <- p + geom_area(subset = .(Type %in% c('c', 'd')),aes(y=Value, fill = Type),position = 'stack')
      
      # scale_fill_hue(l=40) + scale_colour_hue(l=40)
      #opts(legend.position = "none") 
      
      p <- p + scale_fill_manual(values=rep(c("#DADAEB", "#BCBDDC", "#9E9AC8", "#807DBA","#6A51A3", "#4A1486" ), 5))
      p <- p + scale_colour_manual(values=rep(c("#DADAEB", "#BCBDDC", "#9E9AC8", "#807DBA","#6A51A3", "#4A1486" ), 5))
      
      if(save==TRUE) {ggsave(filename = gsub(" ","", paste("../graphs/",qid,".png")))}
      return(p)

}