
library(odfWeave)

currentDefs <- getStyleDefs()
currentDefs$ArialCenteredBold$fontSize <- "8"
currentDefs$ArialCentered$fontSize <- "8"
setStyleDefs(currentDefs)

imageDefs <- getImageDefs()
imageDefs$dispWidth <- 6
imageDefs$dispHeight<- 6
setImageDefs(imageDefs)

inFile <- "/home/paulus/R/projects/StackAccretion/doc/findingstemplate.odt"
outFile <- "/home/paulus/R/projects/StackAccretion/doc/findingsprocessed.odt"

ctl<-odfWeaveControl(zipCmd = c("zip -r $$file$$ .", "unzip -o $$file$$"), 
                     cleanup = TRUE, 
                     verbose = TRUE, 
                     debug = FALSE)

odfWeave(inFile,outFile,workDir="/home/paulus/R/projects/StackAccretion/odfWeave",control=ctl)