setwd ("E:/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV")

BC2_2012.09.10_KAA<-read.csv("BC2_2012.09.10_KAA.csv", row.names=NULL, header=T)
BC2KA2014.04.30FULLDATA<-read.csv("BC2KA2014.04.30FULL DATA.csv", row.names=NULL, header=T)

#############################################################################
#fuckin around with gsub
#remove alphabetic characters and ()
BC2_2012.09.10_KAA$STAT12 <- gsub('[A-Z|a-z]',"", BC2_2012.09.10_KAA$STAT12)
BC2_2012.09.10_KAA$STAT12 <- gsub('[()]',"", BC2_2012.09.10_KAA$STAT12)
#I think the following works for both
BC2_2012.09.10_KAA$STAT12 <- gsub('[A-z|()]',"", BC2_2012.09.10_KAA$STAT12)
#coerce to factor
BC2_2012.09.10_KAA$STAT12 <- as.factor(BC2_2012.09.10_KAA$STAT12)


tmp<- BC2_2012.09.10_KAA$STAT12


#replace exact phrase
tmp5 <- gsub("\\<burnt\\>","FUCK", BC2_2012.09.10_KAA$STAT12)

sort(BC2_2012.09.10_KAA$STAT12)

#########################################################################
#cleaning up BC2KA

BC2_2012.09.10_KAA<-read.csv("BC2_2012.09.10_KAA.csv", row.names=NULL, header=T)
BC2KA2014.04.30FULLDATA<-read.csv("BC2KA2014.04.30FULL DATA.csv", row.names=NULL, header=T)

#replace 2(SD) with 1
#ok this works to remove the parentheses and then recode "2SD" to 1

BC2_2012.09.10_KAA$STAT12 <- gsub('[()]',"", BC2_2012.09.10_KAA$STAT12)

BC2_2012.09.10_KAA$STAT12 <- gsub('\\<2SD\\>',"1", BC2_2012.09.10_KAA$STAT12)

#put it all together to strip all alphabetical characters, leaving only numbers and convert to factor

BC2_2012.09.10_KAA$STAT12<-gsub("\\<5burnt snag\\>","5",BC2_2012.09.10_KAA$STAT12)
BC2_2012.09.10_KAA$STAT12<-gsub("\\<burnt snag\\>","5",BC2_2012.09.10_KAA$STAT12)
BC2_2012.09.10_KAA$STAT12<-gsub("\\<burnt stump\\>","5",BC2_2012.09.10_KAA$STAT12)
BC2_2012.09.10_KAA$STAT12<-gsub("\\<burnt snag pre treat burn\\>","5",BC2_2012.09.10_KAA$STAT12)
BC2_2012.09.10_KAA$STAT12<-gsub("\\<Burnt log\\>","7",BC2_2012.09.10_KAA$STAT12)

BC2_2012.09.10_KAA$STAT12

# X burnt log
# not a tree but a branch
# see notebook also togged 6802
# X 5 pre treat burn


BC2_2012.09.10_KAA$STAT12<-gsub("\\<5 pre treat burn\\>","5",BC2_2012.09.10_KAA$STAT12)

BC2_2012.09.10_KAA$STAT12<-gsub("\\<burnt log\\>","7",BC2_2012.09.10_KAA$STAT12)


BC2_2012.09.10_KAA <-BC2_2012.09.10_KAA[BC2_2012.09.10_KAA$STAT12 != "not a tree but a branch" & BC2_2012.09.10_KAA$STAT12 != "see notebook also togged 6802",] 

BC2_2012.09.10_KAA$STAT12 <- as.factor(BC2_2012.09.10_KAA$STAT12)

#FUCK YEAH! 

str(BC2KA2014.04.30FULLDATA)

BC2KA2014.04.30FULLDATA$STAT12 <- as.factor(BC2KA2014.04.30FULLDATA$STAT12)

BC2_2012.09.10_KAA$DC<-as.factor(BC2_2012.09.10_KAA$DC)
############################################################################################

BC2_2012.09.10_KAA
BC2KA2014.04.30FULLDATA



BC2_2012.09.10_KAAunique<-BC2_2012.09.10_KAA[BC2_2012.09.10_KAA$TagCurrent %in% setdiff(BC2_2012.09.10_KAA$TagCurrent, BC2KA2014.04.30FULLDATA$TagCurrent),]

BC2KA2014.04.30FULLDATAunique2<-BC2KA2014.04.30FULLDATA[BC2KA2014.04.30FULLDATA$TagCurrent %in% setdiff(BC2KA2014.04.30FULLDATA$TagCurrent,BC2_2012.09.10_KAA$TagCurrent),]

names(BC2_2012.09.10_KAAunique)

names(BC2KA2014.04.30FULLDATAunique2)

library(plyr)
library(gtools)

bc2KA<-smartbind(BC2KA2014.04.30FULLDATAunique2, BC2_2012.09.10_KAAunique)

write.csv (bc2KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/bc2KA.csv", row.names=FALSE)

write.csv (bc2KA, "C:/Users/aehawkin/bc2KA.csv", row.names=FALSE)

bc2KA$plot <- "BC2"

#############################################################################################

BN2_2012.07.31_KA<-read.csv("BN2_2012.07.31_KA.csv", row.names=NULL, header=T)
BN2KA.Full.Tree<-read.csv("BN2KA.Full.Tree.csv", row.names=NULL, header=T)

#rename TAG column without looking up what position it is in
names(BN2_2012.07.31_KA)[names(BN2_2012.07.31_KA) == 'tag_currentMalc'] <- 'TagCurrent'

names(BN2_2012.07.31_KA)[names(BN2_2012.07.31_KA) == 'BB'] <- 'sv'

sort(BN2_2012.07.31_KA$STAT12)
sort(BN2KA.Full.Tree$STAT12)
#clean
BN2_2012.07.31_KA$STAT12 <- gsub('[()]',"", BN2_2012.07.31_KA$STAT12)
BN2_2012.07.31_KA$STAT12 <- gsub('\\<2SD\\>',"1", BN2_2012.07.31_KA$STAT12)
BN2_2012.07.31_KA$STAT12 <- gsub('\\<2 SD\\>',"1", BN2_2012.07.31_KA$STAT12)
BN2_2012.07.31_KA$STAT12 <- gsub('\\<2sd\\>',"1", BN2_2012.07.31_KA$STAT12)
BN2_2012.07.31_KA$STAT12 <- gsub('\\<2 sd\\>',"1", BN2_2012.07.31_KA$STAT12)

BN2_2012.07.31_KA$STAT12 <- as.factor(BN2_2012.07.31_KA$STAT12)

str(BN2_2012.07.31_KA)
str(BN2KA.Full.Tree)


#find unique values between two dfs
BN2_2012.07.31_KAunique<-BN2_2012.07.31_KA[BN2_2012.07.31_KA$TagCurrent %in% setdiff(BN2_2012.07.31_KA$TagCurrent, BN2KA.Full.Tree$TagCurrent),]

BN2KA.Full.Treeunique2<-BN2KA.Full.Tree[BN2KA.Full.Tree$TagCurrent %in% setdiff(BN2KA.Full.Tree$TagCurrent,BN2_2012.07.31_KA$TagCurrent),]

#combine dataframes
library(gtools)

bn2KA<-smartbind(BN2KA.Full.Treeunique, BN2_2012.07.31_KAunique)

str(BN2KA.Full.Treeunique)

str(BN2_2012.07.31_KAunique)

#type mismatch DM and ARMRZ (int vs factor)
BN2_2012.07.31_KA$DM <- gsub('[()]',"", BN2_2012.07.31_KA$STAT12)

BN2KA.Full.Treeunique$DM <- as.factor(BN2KA.Full.Treeunique$DM)
BN2KA.Full.Treeunique$ARMRZ <- as.factor(BN2KA.Full.Treeunique$ARMRZ)
BN2KA.Full.Treeunique$sv <- as.factor(BN2KA.Full.Treeunique$sv)

names(BN2_2012.07.31_KAunique)[names(BN2_2012.07.31_KAunique) == 'BB'] <- 'sv'
names(BN2_2012.07.31_KAunique)[names(BN2_2012.07.31_KAunique) == 'ARMFNS'] <- 'ARMFN'

bn2KA$plot<-"bn2"

write.csv (bn2KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/bn2KA.csv", row.names=FALSE)

#############################################################
#BN3

# BN3_2012.7.18_KA
# BN3KA.Full.Tree
# BN3AH

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


# unique rows KA and Full.Tree
BN3_2012.7.18_KAunique<-BN3_2012.7.18_KA[BN3_2012.7.18_KA$TagCurrent %in% setdiff(BN3_2012.7.18_KA$TagCurrent, BN3KA.Full.Tree$TagCurrent),]

BN3KA.Full.Treeunique2<-BN3KA.Full.Tree[BN3KA.Full.Tree$TagCurrent %in% setdiff(BN3KA.Full.Tree$TagCurrent,BN3_2012.7.18_KA$TagCurrent),]


#recode "HEIGHT" into "intact" column
BN3_2012.7.18_KAunique$intact <- BN3_2012.7.18_KAunique$HEIGHT

BN3_2012.7.18_KAunique$intact <- gsub('[0-9]',"", BN3_2012.7.18_KAunique$intact)

BN3_2012.7.18_KAunique$intact <- gsub('[.]',"", BN3_2012.7.18_KAunique$intact)

BN3_2012.7.18_KAunique$HEIGHT <- gsub('[A-z]',"", BN3_2012.7.18_KAunique$HEIGHT)

BN3_2012.7.18_KAunique$HEIGHT <- as.numeric(BN3_2012.7.18_KAunique$HEIGHT)

BN3_2012.7.18_KAunique$HEIGHT<-trim(BN3_2012.7.18_KAunique$HEIGHT)

str(BN3KA.Full.Treeunique2)
str(BN3_2012.7.18_KAunique)

library (gtools)

bn3KA<-smartbind(BN3KA.Full.Treeunique2, BN3_2012.7.18_KAunique)
#Warning message: In as.vector(vals, mode = mode) : NAs introduced by coercion

write.csv (bn3KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/bn3KA.csv", row.names=FALSE)

BN3AHunique<-BN3AH[BN3AH$TagCurrent %in% setdiff(BN3AH$TagCurrent,bn3KA$TagCurrent),]

names(BN3AHunique)[names(BN3AHunique) == "STATUS12"] <- "STAT12"
names(BN3AHunique)[names(BN3AHunique) == "ARM.RZ"] <- "ARMRZ"
names(BN3AHunique)[names(BN3AHunique) == "ARM.FNS"] <- "ARMFN"
names(BN3AHunique)[names(BN3AHunique) == "NOTES"] <- "NOTE"
names(BN3AHunique)[names(BN3AHunique) == "SPECIES"] <- "SP12"
names(BN3AHunique)[names(BN3AHunique) == "PLOT.NOTES"] <- "NOTES.1"
BN3AHunique$ID<-NULL
BN3AHunique$IDcode<-NULL
BN3AHunique$indexAH<-NULL
BN3AHunique$dupe<-NULL
BN3AHunique$X.1<-NULL
BN3AHunique$X.2<-NULL
BN3AHunique$X<-NULL

bn3AHKA<-smartbind(bn3KA, BN3AHunique)

library(plyr)

tmp2 <- arrange(tmp, ID)

write.csv (bn3AHKA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/bn3AHKA.csv", row.names=FALSE)

######################################################

#BS2_2012_07_09_KA
#BS2KA.Full.Tree


#read
BS2_2012_07_09_KA<-read.csv("BS2_2012_07_09_KA.csv", row.names=NULL, header=T)
BS2KA.Full.Tree<-read.csv("BS2KA.Full.Tree.csv", row.names=NULL, header=T)

#rename
names(BS2_2012_07_09_KA)[names(BS2_2012_07_09_KA) == 'tag_current_MALC'] <- 'TagCurrent'
names(BS2_2012_07_09_KA)[names(BS2_2012_07_09_KA) == 'BB'] <- 'sv'

#unique rows
uniquerows <- function(x, y, z)
  #x=df1, y=df1$key column, z=df2$key column
  { 
  x <- x[y %in% setdiff(y, z),]
}

BS2_2012_07_09_KAunique <- uniquerows(BS2_2012_07_09_KA, BS2_2012_07_09_KA$TagCurrent, BS2KA.Full.Tree$TagCurrent)

BS2KA.Full.Treeunique <- uniquerows(BS2KA.Full.Tree, BS2KA.Full.Tree$TagCurrent, BS2_2012_07_09_KA$TagCurrent)

#recode and class changes
##recode STAT12
###motherfucking breakthrough ####writingfunctions
recodeSTAT12 <- function (x) 
{
  x <- gsub('[()]',"", x)
  x <- gsub('\\<2SD\\>|\\<2sd\\>|\\<fcJ\\>',"1", x)
  x <- gsub('\\<cut\\>',"3", x)
  x <- trim(x)
}
BS2_2012_07_09_KAunique$STAT12 <- recodeSTAT12(BS2_2012_07_09_KAunique$STAT12)
BS2_2012_07_09_KAunique[BS2_2012_07_09_KAunique$STAT12=="part of 2374",]
BS2_2012_07_09_KAunique <- BS2_2012_07_09_KAunique[-238,]

##recode HEIGHT
BS2_2012_07_09_KAunique$intact <- BS2_2012_07_09_KAunique$HEIGHT
recodeintact <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- trim(x)
}
recodeHEIGHT <- function (x) 
{
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
BS2_2012_07_09_KAunique$HEIGHT <- recodeHEIGHT(BS2_2012_07_09_KAunique$HEIGHT)
BS2_2012_07_09_KAunique$intact <- recodeintact(BS2_2012_07_09_KAunique$intact)

##recode sv
BS2_2012_07_09_KAunique$dj <- BS2_2012_07_09_KAunique$sv
BS2_2012_07_09_KAunique$dp <- BS2_2012_07_09_KAunique$sv
recodesv <- function (x) 
{
  x <- gsub('\\<old\\>',"1", x)
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}
recodedj <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dp\\>|\\<old\\>',"", x)
  x <- gsub('\\<dj\\>',"1", x)
  x <- trim(x)
}
recodedp <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dj\\>|\\<old\\>',"", x)
  x <- gsub('\\<dp\\>',"1", x)
  x <- trim(x)
}
BS2_2012_07_09_KAunique$sv <- recodesv(BS2_2012_07_09_KAunique$sv)
BS2_2012_07_09_KAunique$dj <- recodedj(BS2_2012_07_09_KAunique$dj)
BS2_2012_07_09_KAunique$dp <- recodedp(BS2_2012_07_09_KAunique$dp)

##recode DC
recodeDC <- function (x) 
{
  x <- gsub('[[:punct:]]',"", x)
  x <- trim(x)
}
BS2KA.Full.Treeunique$DC <- recodeDC(BS2KA.Full.Treeunique$DC)

##class change
BS2_2012_07_09_KAunique$HEIGHT <- as.numeric(BS2_2012_07_09_KAunique$HEIGHT)
BS2_2012_07_09_KAunique$STAT12 <- as.numeric(BS2_2012_07_09_KAunique$STAT12)
BS2_2012_07_09_KAunique$sv <- as.numeric(BS2_2012_07_09_KAunique$sv)
BS2_2012_07_09_KAunique$dj <- as.numeric(BS2_2012_07_09_KAunique$dj)
BS2_2012_07_09_KAunique$dp <- as.numeric(BS2_2012_07_09_KAunique$dp)
BS2KA.Full.Treeunique$DC <- as.numeric(BS2KA.Full.Treeunique$DC)

##bind
bs2KA<-smartbind(BS2KA.Full.Treeunique, BS2_2012_07_09_KAunique)

##fill plot
bs2KA$plot <- bs2

##write
write.csv (bs2KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/bs2KA.csv", row.names=FALSE)

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

#recode stat
sort(UN1_7.12.12KA$STAT12)
library(gdata)
recodeSTAT12 <- function (x) 
{
  x <- gsub('[()]|\\<I\\>|[[:punct:]]',"", x)
  x <- gsub('\\<2SD\\>|\\<2sd?\\>|\\<2 SD\\>',"1", x)
  x <- trim(x)
}
UN1_7.12.12KA$STAT12 <- recodeSTAT12(UN1_7.12.12KA$STAT12)

#recode height
UN1_7.12.12KA$intact <- UN1_7.12.12KA$HEIGHT
recodeintact <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- trim(x)
}
recodeHEIGHT <- function (x) 
{
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
UN1_7.12.12KA$HEIGHT <- recodeHEIGHT(UN1_7.12.12KA$HEIGHT)
UN1_7.12.12KA$intact <- recodeintact(UN1_7.12.12KA$intact)

#recode DC
recodeDC <- function (x) 
{
  x <- gsub('[[:punct:]]',"", x)
  x <- trim(x)
}
un1KA$DC <- recodeDC(un1KA$DC)

#recodesv
UN1_7.12.12KA$dj <- UN1_7.12.12KA$sv
UN1_7.12.12KA$dp <- UN1_7.12.12KA$sv
UN1_7.12.12KA$dv <- UN1_7.12.12KA$sv
recodesv <- function (x) 
{
  x <- gsub('\\<sv\\>',"1", x)
  x <- gsub('\\<old\\>',"2", x)
  x <- gsub('[A-z]|[[:punct:]]|\\<minor\\>',"", x)
  x <- trim(x)
}
recodedj <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dj\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
recodedp <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dp\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
recodedv <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dv\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
UN1_7.12.12KA$sv <- recodesv(UN1_7.12.12KA$sv)
UN1_7.12.12KA$dj <- recodedj(UN1_7.12.12KA$dj)
UN1_7.12.12KA$dp <- recodedp(UN1_7.12.12KA$dp)
UN1_7.12.12KA$dv <- recodedp(UN1_7.12.12KA$dv)

sort(UN1_7.12.12KA$sv)
sort(UN1_7.12.12KA$dj)
sort(UN1_7.12.12KA$dp)
sort(UN1_7.12.12KA$dv)

#class change
un1KA$DM <- as.factor(un1KA$DM)
un1KA$ARMRZ <- as.factor(un1KA$ARMRZ)
un1KA$ARMFN <- as.factor(un1KA$ARMFN)
un1KA$sv <- as.factor(un1KA$sv)
un1KA$dj <- as.factor(un1KA$dj)
un1KA$dp <- as.factor(un1KA$dp)
un1KA$dp <- as.factor(un1KA$dv)
UN1_7.12.12KA$sv <- as.factor(UN1_7.12.12KA$sv)
UN1_7.12.12KA$dj <- as.factor(UN1_7.12.12KA$dj)
UN1_7.12.12KA$dp <- as.factor(UN1_7.12.12KA$dp)
UN1_7.12.12KA$dp <- as.factor(UN1_7.12.12KA$dv)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
un1KA <- uniquerows(UN1_7.12.12KA, UN1_7.12.12KA$TagCurrent, un1KA, un1KA$TagCurrent)

#write
write.csv (un1KA, "E:/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/un1KA.csv", row.names=FALSE)

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

#recode stat
sort(UN2_2012.07.24_KA$STAT12)
library(gdata)
recodeSTAT12 <- function (x) 
{
  x <- gsub('[()]|\\<I\\>|[[:punct:]]',"", x)
  x <- gsub('\\<2SD\\>|\\<2sd?\\>|\\<2 SD\\>|\\<2sp\\>',"1", x)
  x <- trim(x)
}
UN2_2012.07.24_KA$STAT12 <- recodeSTAT12(UN2_2012.07.24_KA$STAT12)
UN2KA.Full.Tree$STAT12 <- recodeSTAT12(UN2KA.Full.Tree$STAT12)
sort(UN2_2012.07.24_KA$STAT12)
sort(UN2KA.Full.Tree$STAT12)

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
sort(UN2_2012.07.24_KA$STAT12)
UN2_2012.07.24_KA[UN2_2012.07.24_KA$STAT12=="part of 4156",]
UN2_2012.07.24_KA <- UN2_2012.07.24_KA[-682,]
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#recode height
UN2_2012.07.24_KA$intact <- UN2_2012.07.24_KA$HEIGHT
recodeintact <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- trim(x)
}
recodeHEIGHT <- function (x) 
{
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
recodeHEIGHT2 <- function (x) 
{
  x <- gsub('[A-z]|[?]',"", x)
  x <- trim(x)
}
UN2_2012.07.24_KA$HEIGHT <- recodeHEIGHT(UN2_2012.07.24_KA$HEIGHT)
UN2_2012.07.24_KA$intact <- recodeintact(UN2_2012.07.24_KA$intact)
UN2KA.Full.Tree$HEIGHT <- recodeHEIGHT2(UN2KA.Full.Tree$HEIGHT)

#recode DC
recodeDC <- function (x) 
{
  x <- gsub('[[:punct:]]',"", x)
  x <- trim(x)
}
UN2KA.Full.Tree$DC <- recodeDC(UN2KA.Full.Tree$DC)
sort(UN2KA.Full.Tree$DC)

#recodesv
UN2_2012.07.24_KA$dj <- UN2_2012.07.24_KA$sv
UN2_2012.07.24_KA$dp <- UN2_2012.07.24_KA$sv
UN2_2012.07.24_KA$dv <- UN2_2012.07.24_KA$sv
recodesv <- function (x) 
{
  x <- gsub('\\<sv\\>',"1", x)
  x <- gsub('\\<old\\>',"2", x)
  x <- gsub('[A-z]|[[:punct:]]|\\<minor\\>',"", x)
  x <- trim(x)
}
recodedj <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dj\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
recodedp <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dp\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
recodedv <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- gsub('\\<dv\\>',"1", x)
  x <- gsub('[A-z]',"", x)
  x <- trim(x)
}
UN2_2012.07.24_KA$sv <- recodesv(UN2_2012.07.24_KA$sv)
UN2_2012.07.24_KA$dj <- recodedj(UN2_2012.07.24_KA$dj)
UN2_2012.07.24_KA$dp <- recodedp(UN2_2012.07.24_KA$dp)
UN2_2012.07.24_KA$dv <- recodedp(UN2_2012.07.24_KA$dv)

sort(UN2_2012.07.24_KA$sv)
sort(UN2_2012.07.24_KA$dj)
sort(UN2_2012.07.24_KA$dp)
sort(UN2_2012.07.24_KA$dv)

#class change
UN2KA.Full.Tree$DM <- as.factor(UN2KA.Full.Tree$DM)
UN2KA.Full.Tree$ARMRZ <- as.factor(UN2KA.Full.Tree$ARMRZ)
UN2KA.Full.Tree$ARMFN <- as.factor(UN2KA.Full.Tree$ARMFN)
UN2KA.Full.Tree$HO <- as.factor(UN2KA.Full.Tree$sv)
UN2KA.Full.Tree$HEIGHT <- as.numeric(UN2KA.Full.Tree$HEIGHT)
UN2KA.Full.Tree$STAT12 <- as.factor(UN2KA.Full.Tree$STAT12)
UN2_2012.07.24_KA$HEIGHT <- as.numeric(UN2_2012.07.24_KA$HEIGHT)
UN2_2012.07.24_KA$STAT12 <- as.factor(UN2_2012.07.24_KA$STAT12)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x[y %in% setdiff(y, y2),]
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
UN2KA <- uniquerows(UN2_2012.07.24_KA, UN2_2012.07.24_KA$TagCurrent, UN2KA.Full.Tree, UN2KA.Full.Tree$TagCurrent)

str(UN2_2012.07.24_KA)
str(UN2KA.Full.Tree)
sort(UN2_2012.07.24_KA$STAT12)

#write
write.csv (UN2KA, "E:/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/cleaned combined steph ash kero/UN2KA.csv", row.names=FALSE)

#####################################################################################


