## colour utility for monchrome or colour representation
# PM 2012

initColours <-function(idvec){
# monochrome 
#color_key <<- rep(c("#DADAEB", "#BCBDDC", "#9E9AC8", "#807DBA","#6A51A3", "#4A1486" ), 5)
# Colourful
color_key <<- rep(c("#6699FF", "#FFCC66", "#FF6699", "#99FF99","#FFFF66", "#99FFFF","#CC99FF", "#6666FF" ), 10)
names(color_key) <<- unique(c(as.character(idvec)))
}

getColours <-function(idvec){
  return(color_key[names(color_key) %in% as.character(idvec)])
}
