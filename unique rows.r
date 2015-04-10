setwd ("/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV")

BS1KA.Empty.Tree<-read.csv("BS1KA.Empty.Tree.csv", row.names=NULL, header=T)
BS1KA.Full.Tree<-read.csv("BS1KA.Full.Tree.csv", row.names=NULL, header=T)

bs1KAunique<-BS1KA.Full.Tree[BS1KA.Full.Tree$TagCurrent %in% setdiff(BS1KA.Full.Tree$TagCurrent,BS1KA.Empty.Tree$TagCurrent),]

bs1KAunique2<-BS1KA.Empty.Tree[BS1KA.Empty.Tree$TagCurrent %in% setdiff(BS1KA.Empty.Tree$TagCurrent,BS1KA.Full.Tree$TagCurrent),]

library(plyr)

bs1KA<-rbind.fill(bs1KAunique, bs1KAunique2)

write.csv (bs1KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/bs1KA.csv", row.names=FALSE)


##################################

UC2KA.Empty.Tree<-read.csv("UC2KA.Empty.Tree.csv", row.names=NULL, header=T)
UC2KA.Full.Tree<-read.csv("UC2KA.Full.Tree.csv", row.names=NULL, header=T)

UC2KA.Full.Tree<-UC2KA.Full.Tree[1:26]

uc2KAunique<-UC2KA.Full.Tree[UC2KA.Full.Tree$TagCurrent %in% setdiff(UC2KA.Full.Tree$TagCurrent,UC2KA.Empty.Tree$TagCurrent),]

uc2KAunique2<-UC2KA.Empty.Tree[UC2KA.Empty.Tree$TagCurrent %in% setdiff(UC2KA.Empty.Tree$TagCurrent,UC2KA.Full.Tree$TagCurrent),]


uc2KA<-rbind.fill(uc2KAunique, uc2KAunique2)

write.csv (uc2KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/uc2KA.csv", row.names=FALSE)

###############################################

UN1KA.Empty.Tree<-read.csv("UN1KA.Empty.Tree.csv", row.names=NULL, header=T)
UN1KA.Full.Tree<-read.csv("UN1KA.Full.Tree.csv", row.names=NULL,  header=T)

UN1KAunique<-UN1KA.Full.Tree[UN1KA.Full.Tree$TagCurrent %in% setdiff(UN1KA.Full.Tree$TagCurrent,UN1KA.Empty.Tree$TagCurrent),]

UN1KAunique2<-UN1KA.Empty.Tree[UN1KA.Empty.Tree$TagCurrent %in% setdiff(UN1KA.Empty.Tree$TagCurrent,UN1KA.Full.Tree$TagCurrent),]


un1KA<-rbind.fill(UN1KAunique, UN1KAunique2)

write.csv (un1KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/un1KA.csv", row.names=FALSE)


##############################################

US2KA.Empty.Tree
US2KAFull.Tree

US2KA.Empty.Tree<-read.csv("US2KA.Empty.Tree.csv", row.names=NULL, header=T)
US2KAFull.Tree<-read.csv("US2KAFull.Tree.csv", row.names=NULL, header=T)


US2KAunique<-US2KAFull.Tree[US2KAFull.Tree$TagCurrent %in% setdiff(US2KAFull.Tree$TagCurrent,US2KA.Empty.Tree$TagCurrent),]

US2KAunique2<-US2KA.Empty.Tree[US2KA.Empty.Tree$TagCurrent %in% setdiff(US2KA.Empty.Tree$TagCurrent,US2KAFull.Tree$TagCurrent),]


us2KA<-rbind.fill(US2KAunique, US2KAunique2)

write.csv (us2KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/us2KA.csv", row.names=FALSE)

###########################################

bn1KAEmpty.Tree<-read.csv("BN1KA.Empty.Tree.csv", row.names=NULL, header=T)
bn1KAFull.Tree<-read.csv("BN1KA.Full.Tree.csv", row.names=NULL, header=T)


bn1KAunique<-bn1KAFull.Tree[bn1KAFull.Tree$TagCurrent %in% setdiff(bn1KAFull.Tree$TagCurrent,bn1KA.Empty.Tree$TagCurrent),]

bn1KAunique2<-bn1KA.Empty.Tree[bn1KA.Empty.Tree$TagCurrent %in% setdiff(bn1KA.Empty.Tree$TagCurrent,bn1KAFull.Tree$TagCurrent),]


bn1KA<-rbind.fill(bn1KAunique, bn1KAunique2)

write.csv (bn1KA, "/media/UUI/Other Stuff/TEF data/Kero/Kero_Data entry_QAQC/Processed notebook data entered by Kero/CSV/bn1KA.csv", row.names=FALSE)

############################################

#rows in bn1x0506 not in bn1new
bn1x0506unique<-bn1x0506[bn1x0506$TagCurrent %in% setdiff(bn1x0506$TagCurrent,bn1new$TagCurrent),]

#rows in bn1x0507 not in bn1new
bn1x0507unique<-bn1x0507[bn1x0507$TagCurrent %in% setdiff(bn1x0507$TagCurrent,bn1new$TagCurrent),]

#rows in bn1x0515 not in bn1new
bn1x0515unique<-bn1x0515[bn1x0515$TagCurrent %in% setdiff(bn1x0515$TagCurrent,bn1new$TagCurrent),]


library(plyr)

bn1unique<-rbind.fill(bn1new, bn1x0506unique)

bn1unique<-rbind.fill(bn1unique, bn1x0507unique)

bn1unique<-rbind.fill(bn1unique, bn1x0515unique)

bn1unique$dupe<-duplicated(bn1unique$TagCurrent)

bn1unique$tmp<-duplicated(bn1unique$TagCurrent)

tmp2<-order(bn1unique$tmp)

arrange(bn1unique, tmp)

write.csv (tmp, "/media/ashleyhawkins/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1combined.csv", row.names=FALSE)

write.csv (bn1unique, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1combined.csv", row.names=FALSE)




bn1KA<-read.csv("bn1combined.csv", header=T)

BN12013 <-read.csv("BN12013.csv", header=T)


#rows in BN12013.7.25 not in bn1combined
bn1<-BN1trimble[BN1trimble$TagCurrent %in% setdiff(BN1trimble$TagCurrent,bn1combined$TagCurrent),]

write.csv (bn1, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1trimcombin.csv", row.names=FALSE)



bn1trimbuniq <-read.csv("bn1trimcombin.csv", header=T)

bn1trimbcombin<-rbind.fill(bn1combined, bn1trimbuniq)

bn1trimbcombin$dup<-duplicated(bn1trimbcombin$TagCurrent)


write.csv (bn1trimbcombin, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1.csv", row.names=FALSE)



bn1KA2013combined <-read.csv("bn1KA2013combined.csv", header=T)

bn1KA2013combined$dupe<-duplicated(bn1KA2013combined$TagCurrent)

write.csv (bn1KA2013combined, "/media/UUI/Other Stuff/TEF data/TFKPAP1/Path 2011 remeasure join/scratchWD/bn1KA2013dups.csv", row.names=FALSE)
