wrapper <- function(qid){
  stackplot(qid, gettldata(qid), getqdata(qid), T)
}