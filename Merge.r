setwd ("/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join")


BC1path<-read.csv("BC1.csv", header=T)
BC2path<-read.csv("BC2.csv", header=T)
BC3path<-read.csv("BC3.csv", header=T)
BN1path<-read.csv("BN1.csv", header=T)
BN2path<-read.csv("BN2.csv", header=T)
BN3path<-read.csv("BN3.csv", header=T)
BS1path<-read.csv("BS1.csv", header=T)
BS2path<-read.csv("BS2.csv", header=T)
BS3path<-read.csv("BS3.csv", header=T)
UC1path<-read.csv("UC1.csv", header=T)
UC2path<-read.csv("UC2.csv", header=T)
UC3path<-read.csv("UC3.csv", header=T)
US1path<-read.csv("US1.csv", header=T)
US2path<-read.csv("US2.csv", header=T)
US3path<-read.csv("US3.csv", header=T)
UN1path<-read.csv("UN1.csv", header=T)
UN2path<-read.csv("UN2.csv", header=T)
UN3path<-read.csv("UN3.csv", header=T)



bc1rem<-read.csv("bc1malc2014.csv", row.names=NULL,header=T)
bc2rem<-read.csv("bc2malc2014.csv", row.names=NULL,header=T)
bc3rem<-read.csv("bc3malc2014.csv", row.names=NULL,header=T)
bn1rem<-read.csv("bn1malc2014.csv", row.names=NULL,header=T)
bn2rem<-read.csv("bn2malc2014.csv", row.names=NULL,header=T)
bn3rem<-read.csv("bn3malc2014.csv", row.names=NULL,header=T)
bs1rem<-read.csv("bs1malc2014.csv", row.names=NULL,header=T)
bs2rem<-read.csv("bs2malc2014.csv", row.names=NULL,header=T)
bs3rem<-read.csv("bs3malc2014.csv", row.names=NULL,header=T)
uc1rem<-read.csv("uc1malc2014.csv", row.names=NULL,header=T)
uc2rem<-read.csv("uc2malc2014.csv", row.names=NULL,header=T)
uc3rem<-read.csv("uc3malc2014.csv", row.names=NULL,header=T)
un1rem<-read.csv("un1malc2014.csv", row.names=NULL,header=T)
un2rem<-read.csv("un2malc2014.csv", row.names=NULL,header=T)
un3rem<-read.csv("un3malc2014.csv", row.names=NULL,header=T)
us1rem<-read.csv("us1malc2014.csv", row.names=NULL,header=T)
us2rem<-read.csv("us2malc2014.csv", row.names=NULL,header=T)
us3rem<-read.csv("us3malc2014.csv", row.names=NULL,header=T)




BCmalc<-read.csv("BCmalc.csv", header=T,)

BNmalc<-read.csv("BNmalc.csv", header=T,)

BSmalc<-read.csv("BSmalc.csv", header=T,)

UCmalc<-read.csv("UCmalc.csv", header=T,)

UNmalc<-read.csv("UNmalc.csv", header=T,)

USmalc<-read.csv("USmalc.csv", header=T,)


bc3malc<-BCmalc[BCmalc$plot=="bc3",]

bc2malc<-BCmalc[BCmalc$plot=="bc2",]

bc1malc<-BCmalc[BCmalc$plot=="bc1",]

bn3malc<-BNmalc[BNmalc$plot=="bn3",]

bn2malc<-BNmalc[BNmalc$plot=="bn2",]

bn1malc<-BNmalc[BNmalc$plot=="bn1",]

bs3malc<-BSmalc[BSmalc$plot=="bs3",]

bs2malc<-BSmalc[BSmalc$plot=="bs2",]

bs1malc<-BSmalc[BSmalc$plot=="bs1",]

uc3malc<-UCmalc[UCmalc$plot=="uc3",]

uc2malc<-UCmalc[UCmalc$plot=="uc2",]

uc1malc<-UCmalc[UCmalc$plot=="uc1",]

un3malc<-UNmalc[UNmalc$plot=="un3",]

un2malc<-UNmalc[UNmalc$plot=="un2",]

un1malc<-UNmalc[UNmalc$plot=="un1",]

us3malc<-USmalc[USmalc$plot=="us3",]

us2malc<-USmalc[USmalc$plot=="us2",]

us1malc<-USmalc[USmalc$plot=="us1",]




names(BC1path)

colnames(BC1path)[2] <- "tg_11"
colnames(BC2path)[2] <- "tg_11"
colnames(BC3path)[2] <- "tg_11"
colnames(BN1path)[2] <- "tg_11"
colnames(BN2path)[2] <- "tg_11"
colnames(BN3path)[2] <- "tg_11"
colnames(BS1path)[2] <- "tg_11"
colnames(BS2path)[2] <- "tg_11"
colnames(BS3path)[2] <- "tg_11"
colnames(UC1path)[2] <- "tg_11"
colnames(UC2path)[2] <- "tg_11"
colnames(UC3path)[2] <- "tg_11"
colnames(US1path)[2] <- "tg_11"
colnames(US2path)[2] <- "tg_11"
colnames(US3path)[2] <- "tg_11"
colnames(UN1path)[2] <- "tg_11"
colnames(UN2path)[2] <- "tg_11"
colnames(UN3path)[2] <- "tg_11"


library(plyr)

bc1math<-join(BC1path,bc1rem, by = "tg_11", type = "full", match = "all")
bc2math<-join(BC2path,bc2rem, by = "tg_11", type = "full", match = "all")
bc3math<-join(BC3path,bc3rem, by = "tg_11", type = "full", match = "all")
bn1math<-join(BN1path,bn1rem, by = "tg_11", type = "full", match = "all")
bn2math<-join(BN2path,bn2rem, by = "tg_11", type = "full", match = "all")
bn3math<-join(BN3path,bn3rem, by = "tg_11", type = "full", match = "all")
bs1math<-join(BS1path,bs1rem, by = "tg_11", type = "full", match = "all")
bs2math<-join(BS2path,bs2rem, by = "tg_11", type = "full", match = "all")
bs3math<-join(BS3path,bs3rem, by = "tg_11", type = "full", match = "all")
uc1math<-join(UC1path,uc1rem, by = "tg_11", type = "full", match = "all")
uc2math<-join(UC2path,uc2rem, by = "tg_11", type = "full", match = "all")
uc3math<-join(UC3path,uc3rem, by = "tg_11", type = "full", match = "all")
un1math<-join(UN1path,un1rem, by = "tg_11", type = "full", match = "all")
un2math<-join(UN2path,un2rem, by = "tg_11", type = "full", match = "all")
un3math<-join(UN3path,un3rem, by = "tg_11", type = "full", match = "all")
us1math<-join(US1path,us1rem, by = "tg_11", type = "full", match = "all")
us2math<-join(US2path,us2rem, by = "tg_11", type = "full", match = "all")
us3math<-join(US3path,us3rem, by = "tg_11", type = "full", match = "all")


write.table (bc1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bc1math.csv", sep=",", row.names=FALSE)
write.table (bc2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bc2math.csv", sep=",", row.names=FALSE)
write.table (bc3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bc3math.csv", sep=",", row.names=FALSE)
write.table (bn1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bn1math.csv", sep=",", row.names=FALSE)
write.table (bn2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bn2math.csv", sep=",", row.names=FALSE)
write.table (bn3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bn3math.csv", sep=",", row.names=FALSE)
write.table (bs1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bs1math.csv", sep=",", row.names=FALSE)
write.table (bs2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bs2math.csv", sep=",", row.names=FALSE)
write.table (bs3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/bs3math.csv", sep=",", row.names=FALSE)
write.table (uc1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/uc1math.csv", sep=",", row.names=FALSE)
write.table (uc2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/uc2math.csv", sep=",", row.names=FALSE)
write.table (uc3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/uc3math.csv", sep=",", row.names=FALSE)
write.table (un1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/un1math.csv", sep=",", row.names=FALSE)
write.table (un2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/un2math.csv", sep=",", row.names=FALSE)
write.table (un3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/un3math.csv", sep=",", row.names=FALSE)
write.table (us1math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/us1math.csv", sep=",", row.names=FALSE)
write.table (us2math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/us2math.csv", sep=",", row.names=FALSE)
write.table (us3math, "/home/ash/Documents/TEF data/TFKPAP1/Path 2011 remeasure join/us3math.csv", sep=",", row.names=FALSE)
