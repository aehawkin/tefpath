setwd ("/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD")


bn1KA<-read.csv("bn1combined.csv", header=T)

bn12013 <-read.csv("BN12013.7.25.csv", header=T)


#rows in BN12013.7.25 not in bn1combined
bn12013unique<-bn12013[bn12013$TagCurrent %in% setdiff(bn12013$TagCurrent,bn1KA$TagCurrent),]

library(plyr)

bn1KAand2013<-rbind.fill(bn1KA, bn12013unique)



write.csv (bn1KAand2013, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1KAand2013.csv", row.names=FALSE)

write.csv (bn12013unique, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn12013unique.csv", row.names=FALSE)
