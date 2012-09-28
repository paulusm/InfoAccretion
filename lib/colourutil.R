initColours <-function(idvec){
color_key <<- rep(c("#DADAEB", "#BCBDDC", "#9E9AC8", "#807DBA","#6A51A3", "#4A1486" ), 5)
oo<<-as.character(idvec)
names(color_key) <<- unique(c(as.character(idvec)))
}

getColours <-function(idvec){
  return(color_key[names(color_key) %in% as.character(idvec)])
}
