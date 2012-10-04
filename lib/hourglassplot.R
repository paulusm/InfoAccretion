# Not used in final paper
# Creates a streamgraph, but seems flakey

# data: Masaaki Ishida (luna@pos.to)
# http://luna.pos.to/whale/sta.html


hourglass.plot <- function(qid, df, qdata, save=FALSE) {
  # Added by PM to adjust dataset

  df<-data.frame(df$days, df$AnswerId, df$upvotes) #df$cumvotes
  df<-dcast(df,df.days~df.AnswerId)
  # end PM added
  
  stack.df <- df[,-1]
  stack.df <- stack.df[,sort(colnames(stack.df))]
  stack.df <- apply(stack.df, 1, cumsum)
  stack.df <- apply(stack.df, 1, function(x) sapply(x, cumsum))
  stack.df <- t(apply(stack.df, 1, function(x) x - mean(x)))
  # use this for actual data
  ##  coords.df <- data.frame(x = rep(c(df[,1], rev(df[,1])), times = dim(stack.df)[2]), y = c(apply(stack.df, 1, min), as.numeric(apply(stack.df, 2, function(x) c(rev(x),x)))[1:(length(df[,1])*length(colnames(stack.df))*2-length(df[,1]))]), id = rep(colnames(stack.df), each = 2*length(df[,1])))
  
  ##  qplot(x = x, y = y, data = coords.df, geom = "polygon", color = I("white"), fill = id)
  
  # use this for smoothed data
  density.df <- apply(stack.df, 2, function(x) spline(x = df[,1], y = x))
  id.df <- sort(rep(colnames(stack.df), each = as.numeric(lapply(density.df, function(x) length(x$x)))))
  density.df <- do.call("rbind", lapply(density.df, as.data.frame))
  density.df <- data.frame(density.df, id = id.df)
  smooth.df <<- data.frame(x = unlist(tapply(density.df$x, density.df$id, function(x) c(x, rev(x)))), y = c(apply(unstack(density.df[,2:3]), 1, min), unlist(tapply(density.df$y, density.df$id, function(x) c(rev(x), x)))[1:(table(density.df$id)[1]+2*max(cumsum(table(density.df$id))[-dim(stack.df)[2]]))]), id = rep(names(table(density.df$id)), each = 2*table(density.df$id)))
  
  p <- ggplot(smooth.df, aes(x, y, colour = id),size=0)  
  p <- p + geom_polygon(aes(colour =id, fill = id),size=0)
  p <- p +  scale_y_continuous(name="Votes")
  p <- p +  scale_x_continuous(name="Days")
  p <- p +  theme_complete_bw()
  p <- p + scale_fill_manual(values=getColours(smooth.df$id))
  p <- p + scale_colour_manual(values=getColours(smooth.df$id))
  p <- p +  opts(title = paste(qdata$Title, "\n", qdata$Tags, ", ", qdata$ViewCount, " views"),axis.text.y =  theme_blank()) 
  #
  #legend.position = "none",
  if(save==TRUE) {ggsave(filename = gsub(" ","", paste("charts/",qid,".png")))}
  
  return(p)
  
 }

