BC2KA2014.04.30
BC2KA2014.5.14
setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

#read
BC2KA2014.04.30<-read.csv("BC2KA2014.04.30.csv", row.names=NULL, header=T)
BC2KA2014.5.14<-read.csv("BC2KA2014.5.14.csv", row.names=NULL, header=T)

#class change
BC2KA2014.5.14$DC <- as.factor(BC2KA2014.5.14$DC)
BC2KA2014.5.14$ARMRZ <- as.factor(BC2KA2014.5.14$ARMRZ)
BC2KA2014.5.14$ARMFN <- as.factor(BC2KA2014.5.14$ARMFN)
BC2KA2014.5.14$HO <- as.factor(BC2KA2014.5.14$HO)
BC2KA2014.5.14$MOD <- as.factor(BC2KA2014.5.14$MOD)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bc2KAraw <- uniquerows(BC2KA2014.04.30, BC2KA2014.04.30$TagCurrent, BC2KA2014.5.14, BC2KA2014.5.14$TagCurrent)

#write
write.csv (bc2KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bc2KAraw.csv", row.names=FALSE)


####################################################################################
setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")
setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

BN1KA2014.05.06
BN1KA2014.05.07Part2


#read
BN1KA2014.05.06<-read.csv("BN1KA2014.05.06.csv", row.names=NULL, header=T)
BN1KA2014.05.07Part2<-read.csv("BN1KA2014.05.07Part2.csv", row.names=NULL, header=T)

#class change
BN1KA2014.05.06$sv <- as.factor(BN1KA2014.05.06$sv)
BN1KA2014.05.06$mech.root <- as.factor(BN1KA2014.05.06$mech.root)
BN1KA2014.05.06$ARMFN <- as.factor(BN1KA2014.05.06$ARMFN)
BN1KA2014.05.06$intact <- as.factor(BN1KA2014.05.06$intact)
BN1KA2014.05.06$NOTES.1 <- as.factor(BN1KA2014.05.06$NOTES.1)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bn1KAraw <- uniquerows(BN1KA2014.05.06, BN1KA2014.05.06$TagCurrent, BN1KA2014.05.07Part2, BN1KA2014.05.07Part2$TagCurrent)


str(BN1KA2014.05.06)
str(BN1KA2014.05.07Part2)

#write
write.csv (bn1KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn2KAraw1.csv", row.names=FALSE)

write.csv (bn1KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn1KAraw1.csv", row.names=FALSE)

#######################################################################################

BN1KA2014.05.15
bn1KAraw

BN1KA2014.05.15<-read.csv("BN1KA2014.05.15.csv", row.names=NULL, header=T)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bn1KAraw2 <- uniquerows(BN1KA2014.05.15, BN1KA2014.05.15$TagCurrent, bn1KAraw, bn1KAraw$TagCurrent)

str(BN1KA2014.05.15)
str(bn1KAraw)

#class change
BN1KA2014.05.15$DM <- as.factor(BN1KA2014.05.15$DM)
BN1KA2014.05.15$HO <- as.factor(BN1KA2014.05.15$HO)
BN1KA2014.05.15$ARMFN <- as.factor(BN1KA2014.05.15$ARMFN)
BN1KA2014.05.15$intact <- as.factor(BN1KA2014.05.15$intact)
BN1KA2014.05.15$NOTES.1 <- as.factor(BN1KA2014.05.15$NOTES.1)
BN1KA2014.05.15$MOD <- as.factor(BN1KA2014.05.15$MOD)

#write
write.csv (bn1KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn2KAraw1.csv", row.names=FALSE)

write.csv (bn1KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn1KAraw1.csv", row.names=FALSE)

#################################################################################

BN3KA2014.05.16
BN3KA2014.5.1

setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

BN3KA2014.05.16<-read.csv("BN3KA2014.05.16.csv", row.names=NULL, header=T)
BN3KA2014.5.1<-read.csv("BN3KA2014.5.1.csv", row.names=NULL, header=T)

names(BN3KA2014.05.16)[names(BN3KA2014.05.16) == 'TagCur'] <- 'TagCurrent'
names(BN3KA2014.05.16)[names(BN3KA2014.05.16) == 'mech'] <- 'mech.root'
names(BN3KA2014.05.16)[names(BN3KA2014.05.16) == 'NOTE'] <- 'NOTES'

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bn3KAraw <- uniquerows(BN3KA2014.05.16, BN3KA2014.05.16$TagCurrent, BN3KA2014.5.1, BN3KA2014.5.1$TagCurrent)

str(BN3KA2014.05.16)
str(BN3KA2014.5.1)

#class change
BN3KA2014.05.16$STAT12 <- as.factor(BN3KA2014.05.16$STAT12)
BN3KA2014.05.16$HO <- as.factor(BN3KA2014.05.16$HO)
BN3KA2014.05.16$ARMFN <- as.factor(BN3KA2014.05.16$ARMFN)
BN3KA2014.05.16$ARMRZ <- as.factor(BN3KA2014.05.16$ARMRZ)
BN3KA2014.05.16$NOTES.1 <- as.factor(BN3KA2014.05.16$NOTES.1)
BN3KA2014.05.16$fopi <- as.factor(BN3KA2014.05.16$MOD)
BN3KA2014.05.16$dj <- as.factor(BN3KA2014.05.16$dj)

#write
write.csv (bn3KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn3KAraw.csv", row.names=FALSE)

write.csv (bn3KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bn3KAraw.csv", row.names=FALSE)


##################################################################

BS1KA2014.5.6
BS1KA2014.05.07Part2
BS1KA2014.5.15

setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")
setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

BS1KA2014.5.6<-read.csv("BS1KA2014.5.6.csv", row.names=NULL, header=T)
BS1KA2014.05.07Part2<-read.csv("BS1KA2014.05.07Part2.csv", row.names=NULL, header=T)
BS1KA2014.5.15<-read.csv("BS1KA2014.5.15.csv", row.names=NULL, header=T)

BS1KA2014.5.6[names(BS1KA2014.5.6)] <- lapply(BS1KA2014.5.6[names(BS1KA2014.5.6)], as.factor)
BS1KA2014.05.07Part2[names(BS1KA2014.05.07Part2)] <- lapply(BS1KA2014.05.07Part2[names(BS1KA2014.05.07Part2)], as.factor)
BS1KA2014.5.15[names(BS1KA2014.5.15)] <- lapply(BS1KA2014.5.15[names(BS1KA2014.5.15)], as.factor)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bs1KAraw <- uniquerows(BS1KA2014.5.6, BS1KA2014.5.6$TagCurrent, BS1KA2014.05.07Part2, BS1KA2014.05.07Part2$TagCurrent)

bs1KAraw2 <- uniquerows(bs1KAraw, bs1KAraw$TagCurrent, BS1KA2014.5.15, BS1KA2014.5.15$TagCurrent)

#write
write.csv (bs1KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs1KAraw.csv", row.names=FALSE)

write.csv (bs1KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs1KAraw.csv", row.names=FALSE)

######################################################################################
BS2KA2014.04.23
BS2KA2014.05.55

setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")
setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

BS2KA2014.04.23<-read.csv("BS2KA2014.04.23.csv", row.names=NULL, header=T)
BS2KA2014.05.55<-read.csv("BS2KA2014.05.55.csv", row.names=NULL, header=T)


BS2KA2014.04.23[names(BS2KA2014.04.23)] <- lapply(BS2KA2014.04.23[names(BS2KA2014.04.23)], as.factor)
BS2KA2014.05.55[names(BS2KA2014.05.55)] <- lapply(BS2KA2014.05.55[names(BS2KA2014.05.55)], as.factor)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bs2KAraw <- uniquerows(BS2KA2014.04.23, BS2KA2014.04.23$TagCurrent, BS2KA2014.05.55, BS2KA2014.05.55$TagCurrent)


#write
write.csv (bs2KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs2KAraw.csv", row.names=FALSE)

write.csv (bs2KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs2KAraw.csv", row.names=FALSE)

###################################################################################
BS2KA2014.04.23
BS2KA2014.05.55

setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")
setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

BS2KA2014.04.23<-read.csv("BS2KA2014.04.23.csv", row.names=NULL, header=T)
BS2KA2014.05.55<-read.csv("BS2KA2014.05.55.csv", row.names=NULL, header=T)


BS2KA2014.04.23[names(BS2KA2014.04.23)] <- lapply(BS2KA2014.04.23[names(BS2KA2014.04.23)], as.factor)
BS2KA2014.05.55[names(BS2KA2014.05.55)] <- lapply(BS2KA2014.05.55[names(BS2KA2014.05.55)], as.factor)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bs2KAraw <- uniquerows(BS2KA2014.04.23, BS2KA2014.04.23$TagCurrent, BS2KA2014.05.55, BS2KA2014.05.55$TagCurrent)


#write
write.csv (bs2KAraw, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs2KAraw.csv", row.names=FALSE)

write.csv (bs2KAraw, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/bs2KAraw.csv", row.names=FALSE)

##########################################################################################
UC3KA2014.04.25
UC3KA2014.04.29

setwd("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")
setwd("/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv")

UC3KA2014.04.25<-read.csv("UC3KA2014.04.25.csv", row.names=NULL, header=T)
UC3KA2014.04.29<-read.csv("UC3KA2014.04.29.csv", row.names=NULL, header=T)


UC3KA2014.04.25[names(UC3KA2014.04.25)] <- lapply(UC3KA2014.04.25[names(UC3KA2014.04.25)], as.factor)
UC3KA2014.04.29[names(UC3KA2014.04.29)] <- lapply(UC3KA2014.04.29[names(UC3KA2014.04.29)], as.factor)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

uc3KAraw1 <- uniquerows(UC3KA2014.04.25, UC3KA2014.04.25$TagCurrent, UC3KA2014.04.29, UC3KA2014.04.29$TagCurrent)

##########

UC3KA2014.4.30
UC3KA2014.5.6

UC3KA2014.4.30<-read.csv("UC3KA2014.4.30.csv", row.names=NULL, header=T)
UC3KA2014.5.6<-read.csv("UC3KA2014.5.6.csv", row.names=NULL, header=T)


UC3KA2014.4.30[names(UC3KA2014.4.30)] <- lapply(UC3KA2014.4.30[names(UC3KA2014.4.30)], as.factor)
UC3KA2014.5.6[names(UC3KA2014.5.6)] <- lapply(UC3KA2014.5.6[names(UC3KA2014.5.6)], as.factor)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

uc3KAraw2 <- uniquerows(UC3KA2014.4.30, UC3KA2014.4.30$TagCurrent, UC3KA2014.5.6, UC3KA2014.5.6$TagCurrent)

##############

uc3KAraw1
uc3KAraw2

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

uc3KAraw3 <- uniquerows(uc3KAraw1, uc3KAraw1$TagCurrent, uc3KAraw2, uc3KAraw2$TagCurrent)

#write

write.csv (uc3KAraw3, "E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/uc3KAraw.csv", row.names=FALSE)

write.csv (uc3KAraw3, "/media/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/combined/uc3KAraw.csv", row.names=FALSE)

####################################################################################