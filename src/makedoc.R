
library(odfWeave)

currentDefs <- getStyleDefs()
currentDefs$ArialCenteredBold$fontSize <- "8"
currentDefs$ArialCentered$fontSize <- "8"
setStyleDefs(currentDefs)

inFile <- "/home/paulus/R/projects/StackAccretion/doc/accretionarticletemplate.odt"
outFile <- "/home/paulus/R/projects/StackAccretion/doc/accretionarticle.odt"

ctl<-odfWeaveControl(zipCmd = c("zip -r $$file$$ .", "unzip -o $$file$$"), 
                     cleanup = TRUE, 
                     verbose = FALSE, 
                     debug = FALSE)

odfWeave(inFile,outFile,workDir="/home/paulus/R/projects/StackAccretion/odfWeave",control=ctl)