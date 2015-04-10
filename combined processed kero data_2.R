setwd("E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv")

BC2_2012.09.10_KAA<-read.csv("BC2_2012.09.10_KAA.csv", row.names=NULL, header=T)
BC2KA2014.04.30FULLDATA<-read.csv("BC2KA2014.04.30FULL DATA.csv", row.names=NULL, header=T)


#function to perform on each data frame
asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

BC2_2012.09.10_KAA <- asfactor(BC2_2012.09.10_KAA)
BC2KA2014.04.30FULLDATA <- asfactor(BC2KA2014.04.30FULLDATA)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bc2KAproc <- uniquerows(BC2_2012.09.10_KAA, BC2_2012.09.10_KAA$TagCurrent, BC2KA2014.04.30FULLDATA, BC2KA2014.04.30FULLDATA$TagCurrent)

bc2KAproc$plot <- "bc2"
BC2KA2014.04.30FULLDATA$plot <- "bc2"

bc2KAproc <- smartbind(bc2KAproc, BC2KA2014.04.30FULLDATA[BC2KA2014.04.30FULLDATA$TagCurrent == "?",])

write.csv (bc2KAproc, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/bc2KAproc.csv", row.names=FALSE)
############################################################################################

BN2_2012.07.31_KA<-read.csv("BN2_2012.07.31_KA.csv", row.names=NULL, header=T)
BN2KA.Full.Tree<-read.csv("BN2KA.Full.Tree.csv", row.names=NULL, header=T)

#rename TAG column without looking up what position it is in
names(BN2_2012.07.31_KA)[names(BN2_2012.07.31_KA) == 'tag_currentMalc'] <- 'TagCurrent'
names(BN2_2012.07.31_KA)[names(BN2_2012.07.31_KA) == 'BB'] <- 'sv'
names(BN2KA.Full.Tree)[names(BN2KA.Full.Tree) == 'ARMFN'] <- 'ARMFNS'

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

BN2_2012.07.31_KA <- asfactor(BN2_2012.07.31_KA)
BN2KA.Full.Tree <- asfactor(BN2KA.Full.Tree)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bn2KAproc <- uniquerows(BN2_2012.07.31_KA, BN2_2012.07.31_KA$TagCurrent, BN2KA.Full.Tree, BN2KA.Full.Tree$TagCurrent)

bn2KAproc$plot <- "bn2"
BN2KA.Full.Tree$plot <- "bn2"

bn2KAproc <- smartbind(bn2KAproc, BN2KA.Full.Tree[BN2KA.Full.Tree$TagCurrent == "?",])


write.csv (bn2KAproc, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/bn2KAproc.csv", row.names=FALSE)

#############################################################
BN3_2012.7.18_KA<-read.csv("BN3_2012.7.18_KA.csv", row.names=NULL, header=T)
BN3KA.Full.Tree<-read.csv("BN3KA.Full.Tree.csv", row.names=NULL, header=T)
BN3AH<-read.csv("BN3AH.csv", row.names=NULL, header=T)

#rename columns
names(BN3KA.Full.Tree)[names(BN3KA.Full.Tree) == 'TagCur'] <- 'TagCurrent'
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == 'tag_current'] <- 'TagCurrent'
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == 'BB'] <- 'sv'
names(BN3AH)[names(BN3AH) == 'BB'] <- 'sv'
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "STATUS12"] <- "STAT12"
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "ARM.RZ"] <- "ARMRZ"
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "ARM.FNS"] <- "ARMFN"
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "NOTES"] <- "NOTE"
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "SPECIES"] <- "SP12"
names(BN3_2012.7.18_KA)[names(BN3_2012.7.18_KA) == "PLOT.NOTES"] <- "NOTES.1"
BN3_2012.7.18_KA$X=NULL
names(BN3AH)[names(BN3AH) == "STATUS12"] <- "STAT12"
names(BN3AH)[names(BN3AH) == "ARM.RZ"] <- "ARMRZ"
names(BN3AH)[names(BN3AH) == "ARM.FNS"] <- "ARMFN"
names(BN3AH)[names(BN3AH) == "NOTES"] <- "NOTE"
names(BN3AH)[names(BN3AH) == "SPECIES"] <- "SP12"
names(BN3AH)[names(BN3AH) == "PLOT.NOTES"] <- "NOTES.1"
BN3AH$ID<-NULL
BN3AH$IDcode<-NULL
BN3AH$indexAH<-NULL
BN3AH$dupe<-NULL
BN3AH$X.1<-NULL
BN3AH$X.2<-NULL
BN3AH$X<-NULL

BN3_2012.7.18_KA$plot <- "bn3"
BN3KA.Full.Tree$plot <- "bn3"
BN3AH$plot <- "bn3"

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

BN3_2012.7.18_KA <- asfactor(BN3_2012.7.18_KA)
BN3KA.Full.Tree <- asfactor(BN3KA.Full.Tree)
BN3AH <- asfactor(BN3AH)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bn3KAproc <- uniquerows(BN3_2012.7.18_KA, BN3_2012.7.18_KA$TagCurrent, BN3KA.Full.Tree, BN3KA.Full.Tree$TagCurrent)

bn3KAproc2 <- uniquerows(bn3KAproc, bn3KAproc$TagCurrent, BN3AH, BN3AH$TagCurrent)

bn3KAproc3 <- smartbind(bn3KAproc2, BN3KA.Full.Tree[BN3KA.Full.Tree$TagCurrent == "?",], BN3AH[BN3AH$TagCurrent == "?",])

write.csv (bn3KAproc3, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/bn3KAproc.csv", row.names=FALSE)

######################################################
BS2_2012_07_09_KA<-read.csv("BS2_2012_07_09_KA.csv", row.names=NULL, header=T)
BS2KA.Full.Tree<-read.csv("BS2KA.Full.Tree.csv", row.names=NULL, header=T)

#rename
names(BS2_2012_07_09_KA)[names(BS2_2012_07_09_KA) == 'tag_current_MALC'] <- 'TagCurrent'
names(BS2_2012_07_09_KA)[names(BS2_2012_07_09_KA) == 'BB'] <- 'sv'
names(BS2KA.Full.Tree)[names(BS2KA.Full.Tree) == 'ARMFN'] <- 'ARMFNS'

BS2_2012_07_09_KA$plot <- "bs2"
BS2KA.Full.Tree$plot <- "bs2"

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

BS2_2012_07_09_KA <- asfactor(BS2_2012_07_09_KA)
BS2KA.Full.Tree <- asfactor(BS2KA.Full.Tree)

#unique rows
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bs2KAproc <- uniquerows(BS2_2012_07_09_KA, BS2_2012_07_09_KA$TagCurrent, BS2KA.Full.Tree, BS2KA.Full.Tree$TagCurrent)

bs2KAproc <- smartbind(bs2KAproc, BS2KA.Full.Tree[BS2KA.Full.Tree$TagCurrent == "?",])

##write
write.csv (bs2KAproc, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/bs2KAproc.csv", row.names=FALSE)

##############################################################################################
UN1_7.12.12 KA
un1KA

#read
UN1_7.12.12KA<-read.csv("UN1_7.12.12 KA.csv", row.names=NULL, header=T)
un1KA<-read.csv("un1KA.csv", row.names=NULL, header=T)

#rename
names(UN1_7.12.12KA)[names(UN1_7.12.12KA) == 'Tag.current'] <- 'TagCurrent'
names(UN1_7.12.12KA)[names(UN1_7.12.12KA) == 'BB'] <- 'sv'
names(UN1_7.12.12KA)[names(UN1_7.12.12KA) == "status.12"] <- "STAT12"
names(UN1_7.12.12KA)[names(UN1_7.12.12KA) == "ARM.RZ"] <- "ARMRZ"
names(UN1_7.12.12KA)[names(UN1_7.12.12KA) == "ARM.FNS"] <- "ARMFN"

UN1_7.12.12KA$plot <- "un1"
un1KA$plot <- "un1"

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

UN1_7.12.12KA <- asfactor(UN1_7.12.12KA)
un1KA <- asfactor(un1KA)

#unique rows
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

un1KAproc <- uniquerows(UN1_7.12.12KA, UN1_7.12.12KA$TagCurrent, un1KA, un1KA$TagCurrent)

un1KAproc <- smartbind(un1KAproc, un1KA[un1KA$TagCurrent == "?",])

#write
write.csv (un1KAproc, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/un1KAproc.csv", row.names=FALSE)

#############################################################################################

UN2_2012.07.24_KA
UN2KA.Full.Tree

#read
UN2_2012.07.24_KA<-read.csv("UN2_2012.07.24_KA.csv", row.names=NULL, header=T)
UN2KA.Full.Tree<-read.csv("UN2KA.Full.Tree.csv", row.names=NULL, header=T)

#rename
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == 'tag_current'] <- 'TagCurrent'
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == 'BB'] <- 'sv'
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == "STATUS12"] <- "STAT12"
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == "ARM.RZ"] <- "ARMRZ"
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == "ARM.FNS"] <- "ARMFN"
names(UN2_2012.07.24_KA)[names(UN2_2012.07.24_KA) == 'SPECIES12'] <- 'SP12'

UN2_2012.07.24_KA$plot <- "un2"
UN2KA.Full.Tree$plot <- "un2"

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

UN2_2012.07.24_KA <- asfactor(UN2_2012.07.24_KA)
UN2KA.Full.Tree <- asfactor(UN2KA.Full.Tree)

#unique rows
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

un2KAproc <- uniquerows(UN2_2012.07.24_KA, UN2_2012.07.24_KA$TagCurrent, UN2KA.Full.Tree, UN2KA.Full.Tree$TagCurrent)

#write
write.csv (un2KAproc, "E:/Everything else/TEF data/Kero/Precessed notebook data that have been combined by me/csv/combined2015/un2KAproc.csv", row.names=FALSE)


#####################################################################################


