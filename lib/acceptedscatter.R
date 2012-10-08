# Create the plot of answers by accepted and not
# PM 2012

AcceptedScatter <- function(){
  

    graph.df <- training.df[sample(1:dim(training.df)[1], size=250, replace=FALSE),]
    graph.df$accepted <- as.factor(graph.df$accepted)
    p <- ggplot(graph.df, aes(y=log(mins), x=log(ranked)))
    p <- p + geom_jitter(aes(shape=accepted, colour=accepted), size=4)
    p <- p + scale_shape_manual(values=c(1,3))
    p <- p + theme_complete_bw()
    p <- p + scale_x_continuous("log of temporal rank") 
    p <- p + scale_y_continuous("log of elapsed minutes") 
    
    tiff("graphs/acceptedscatter.tif",width=1024, height=1024)
    print(p)
    dev.off()
    
    
    return(p)
                                                              
 
}