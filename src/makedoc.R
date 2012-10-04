# Main document weaver
# PM 2012

library(odfWeave)

currentDefs <- getStyleDefs()
currentDefs$ArialCenteredBold$fontSize <- "8"
currentDefs$ArialCentered$fontSize <- "8"
setStyleDefs(currentDefs)

# adjust plot sizes & res.
imageDefs <- getImageDefs()
imageDefs$dispWidth <- 4
imageDefs$dispHeight<- 4
imageDefs$plotWidth <- 800
imageDefs$plotHeight<- 800
setImageDefs(imageDefs)

inFile <- paste(getwd(),"/doc/accretionarticletemplate.odt",sep="")
outFile <- paste(getwd(),"/doc/accretionarticle.odt",sep="")

ctl<-odfWeaveControl(zipCmd = c("zip -r $$file$$ .", "unzip -o $$file$$"), 
                     cleanup = TRUE, 
                     verbose = TRUE, 
                     debug = FALSE)

odfWeave(inFile,outFile,workDir=paste(getwd(),"/odfWeave",sep=""),control=ctl)