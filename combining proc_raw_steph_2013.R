setwd("E:/Everything else/TEF data/Kero/2013 TFK data/csv")

files <- dir("E:/Everything else/TEF data/Kero/2013 TFK data/csv")

setwd("/media/UUI/Everything else/TEF data/Kero/2013 TFK data/csv")

files <- dir("/media/UUI/Everything else/TEF data/Kero/2013 TFK data/csv")

df.list <- lapply(files, read.csv)

names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

asnum <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.numeric(as.character))
  return(df)
}

#apply function across all dataframes
df.list[names(df.list)] <- lapply(df.list[names(df.list)], asfactor)

library(gtools)

uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

names(df.list)

#####################################################################
BN12013
bn1KArawproc

names(df.list$BN12013)
names(df.list$bn1KArawproc)

df.list$BN12013 <- subset(df.list$BN12013, select = c("plot", "species", "TagCurrent", "STAT13", "DC", "BB", "DM", "ARMRZ", "ARMFN", "HO", "OTHER", "HEIGHT", "NOTES", "MOD", "SP12"))

names(df.list$BN12013)[names(df.list$BN12013 ) == "SP12"] <- "NOTES.1"
names(df.list$BN12013)[names(df.list$BN12013 ) == "ARMFN"] <- "ARMFNS"
names(df.list$BN12013)[names(df.list$BN12013) == "BB"] <- "sv"
names(df.list$BN12013)[names(df.list$BN12013) == "species"] <- "SP12"
names(df.list$BN12013)[names(df.list$BN12013) == "STAT13"] <- "STAT12"

bn12013 <- df.list$BN12013
bn1KArawproc <- df.list$bn1KArawproc

bn12013 <- bn12013[bn12013$STAT12!="",]

bn12013$STAT12 <- as.numeric(levels(bn12013$STAT12))[bn12013$STAT12]

str(bn12013)
str(bn1KArawproc)

bn1rawprocsteph2013 <- uniquerows(bn12013, bn12013$TagCurrent, bn1KArawproc, bn1KArawproc$TagCurrent)

bn1rawprocsteph2013 <- smartbind(bn1rawprocsteph2013, bn1KArawproc[bn1KArawproc$TagCurrent == "?",])

write.csv (bn1rawprocsteph2013, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/bn1rawprocsteph2013.csv", row.names=FALSE)

################################################################################
BN3AH           
bn3KArawprocSCAH

names(df.list$BN3AH)
names(df.list$bn3KArawprocSCAH)

df.list$BN3AH <- subset(df.list$BN3AH, select = c("species.1", "X5016", "STATUS12", "DC", "BB", "DM", "HO", "ARM.RZ", "ARM.FNS", "OTHER", "HEIGHT", "NOTES", "MOD"))

names(df.list$BN3AH)[names(df.list$BN3AH) == "STATUS12"] <- "STAT12"
names(df.list$BN3AH)[names(df.list$BN3AH) == "ARM.FNS"] <- "ARMFNS"
names(df.list$BN3AH)[names(df.list$BN3AH) == "ARM.RZ"] <- "ARMRZ"
names(df.list$BN3AH)[names(df.list$BN3AH) == "BB"] <- "sv"
names(df.list$BN3AH)[names(df.list$BN3AH) == "species.1"] <- "SP12"
names(df.list$BN3AH)[names(df.list$BN3AH) == "X5016"] <- "TagCurrent"

bn3AH <- df.list$BN3AH
bn3KArawprocSCAH <- df.list$bn3KArawprocSCAH

#hmm this doesnt work
bn3AH <- bn3AH[bn3AH$STAT12!="",]
bn3AH <- bn3AH[bn3AH$STAT12!="NA",]
bn3AH <- bn3AH[bn3AH$STAT12!=NA,]

bn3AH <- na.omit(bn3AH$STAT12)
bn3AH <- bn3AH[complete.cases(bn3AH$STAT12),]

bn3rawprocsteph2013 <- uniquerows(bn3AH, bn3AH$TagCurrent, bn3KArawprocSCAH, bn3KArawprocSCAH$TagCurrent)

bn3rawprocsteph2013 <- smartbind(bn3rawprocsteph2013, bn3KArawprocSCAH[bn3KArawprocSCAH$TagCurrent == "?",])

write.csv (bn3rawprocsteph2013, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/bn3rawprocsteph2013.csv", row.names=FALSE)

###########################################################
BS12013     
bs1KArawproc

names(df.list$BS12013)
names(df.list$bs1KArawproc)

df.list$BS12013 <- subset(df.list$BS12013, select = c("species.y","TagCurrent","STAT13","DC","BB","DM","ARMRZ","ARMFN","HO","OTHER","HEIGHT","NOTES","MOD"))

names(df.list$BS12013)[names(df.list$BS12013) == "STAT13"] <- "STAT12"
names(df.list$bs1KArawproc)[names(df.list$bs1KArawproc) == "ARMFN"] <- "ARMFNS"
names(df.list$BS12013)[names(df.list$BS12013) == "ARMFN"] <- "ARMFNS"
names(df.list$BS12013)[names(df.list$BS12013) == "BB"] <- "sv"
names(df.list$BS12013)[names(df.list$BS12013) == "species.y"] <- "SP12"

bs12013 <- df.list$BS12013
bs1KArawproc <- df.list$bs1KArawproc


bs12013 <- bs12013[bs12013$STAT12!="",]
bs12013 <- bs12013[bs12013$STAT12!="NA",]
bs12013 <- bs12013[bs12013$STAT12!=NA,]

#OR
bs12013 <- bs12013[complete.cases(bs12013$STAT12),]

bs1rawprocsteph2013 <- uniquerows(bs12013, bs12013$TagCurrent, bs1KArawproc, bs1KArawproc$TagCurrent)

bs1rawprocsteph2013 <- smartbind(bs1rawprocsteph2013, bs1KArawproc[bs1KArawproc$TagCurrent == "?",])

bs1rawprocsteph2013$plot <- "bs1"

write.csv (bs1rawprocsteph2013, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/bs1rawprocsteph2013.csv", row.names=FALSE)

#########################################################################
UC22013
uc2KArawproc

names(df.list$UC22013)
names(df.list$uc2KArawproc)

df.list$UC22013 <- subset(df.list$UC22013, select = c("species","TagCurrent","STAT13","DC","BB","DM","ARMRZ","ARMFN","HO","OTHER","HEIGHT","NOTES","MOD"))

names(df.list$UC22013)[names(df.list$UC22013) == "STAT13"] <- "STAT12"
names(df.list$UC22013)[names(df.list$UC22013) == "ARMFN"] <- "ARMFNS"
names(df.list$uc2KArawproc)[names(df.list$uc2KArawproc) == "ARMFN"] <- "ARMFNS"
names(df.list$UC22013)[names(df.list$UC22013) == "BB"] <- "sv"
names(df.list$UC22013)[names(df.list$UC22013) == "species"] <- "SP12"

uc22013 <- df.list$UC22013
uc2KArawproc <- df.list$uc2KArawproc


uc22013 <- uc22013[uc22013$STAT12!="",]
uc22013 <- uc22013[uc22013$STAT12!="NA",]
uc22013 <- uc22013[uc22013$STAT12!=NA,]

#OR
uc22013 <- uc22013[complete.cases(uc22013$STAT12),]

uc2rawprocsteph2013 <- uniquerows(uc22013, uc22013$TagCurrent, uc2KArawproc, uc2KArawproc$TagCurrent)

uc2rawprocsteph2013 <- smartbind(uc2rawprocsteph2013, uc2KArawproc[uc2KArawproc$TagCurrent == "?",])

uc2rawprocsteph2013$plot <- "uc2"

write.csv (uc2rawprocsteph2013, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/uc2rawprocsteph2013.csv", row.names=FALSE)
###############################################################
names(df.list)

UN1AH
un1KArawprocSCAH

names(df.list$UN1AH)
names(df.list$un1KArawprocSCAH)

sort(df.list$UN1AH[["SP12"]])

df.list$UN1AH <- subset(df.list$UN1AH, select = c("NOTES.04","species.2","TagCurrent.1","status.12","DC","BB","DM","HO","ARM.RZ","ARM.FNS","OTHER","NOTES","HEIGHT"))

df.list$UN1AH[["NOTES.04"]] <- NULL

names(df.list$UN1AH)[names(df.list$UN1AH) == "status.12"] <- "STAT12"
names(df.list$UN1AH)[names(df.list$UN1AH) == "TagCurrent.1"] <- "TagCurrent"
names(df.list$UN1AH)[names(df.list$UN1AH) == "ARM.FNS"] <- "ARMFNS"
names(df.list$UN1AH)[names(df.list$UN1AH) == "ARM.RZ"] <- "ARMRZ"
names(df.list$UN1AH)[names(df.list$UN1AH) == "BB"] <- "sv"
names(df.list$UN1AH)[names(df.list$UN1AH) == "species.2"] <- "SP12"

un1AH <- df.list$UN1AH
un1KArawprocSCAH <- df.list$un1KArawprocSCAH


un1AH <- un1AH[un1AH$STAT12!="",]
un1AH <- un1AH[un1AH$STAT12!="NA",]
un1AH <- un1AH[un1AH$STAT12!=NA,]

#OR
un1AH <- un1AH[complete.cases(un1AH$STAT12),]

un1rawprocstephAH <- uniquerows(un1AH, un1AH$TagCurrent, un1KArawprocSCAH, un1KArawprocSCAH$TagCurrent)

un1rawprocstephAH <- smartbind(un1rawprocstephAH, un1KArawprocSCAH[un1KArawprocSCAH$TagCurrent == "?",])

un1rawprocstephAH$plot <- "un1"

write.csv (un1rawprocstephAH, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/un1rawprocstephAH.csv", row.names=FALSE)
################################################################
names(df.list)

US2
us2KArawproc

names(df.list$US2)
names(df.list$us2KArawproc)

df.list$us2KArawproc[["X"]] <- NULL

names(df.list$US2)[names(df.list$US2) == "ARMFN"] <- "ARMFNS"
names(df.list$us2KArawproc)[names(df.list$us2KArawproc) == "ARMFN"] <- "ARMFNS"


us2 <- df.list$US2
us2KArawproc <- df.list$us2KArawproc


us2 <- us2[us2$STAT12!="",]
#OR
us2 <- us2[complete.cases(us2$STAT12),]

us2rawprocstephAH <- uniquerows(us2, us2$TagCurrent, us2KArawproc, us2KArawproc$TagCurrent)

us2rawprocstephAH <- smartbind(us2rawprocstephAH, us2KArawproc[us2KArawproc$TagCurrent == "?",])

us2rawprocstephAH$plot <- "us2"

write.csv (us2rawprocstephAH, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/us2rawprocstephAH.csv", row.names=FALSE)
#################################################################
BC3
BC32015

setwd("/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined")
BC32015<-read.csv("BC32015.csv", row.names=NULL, header=T)

names(df.list$BC3)
names(BC32015)

install.packages("data.table")
library(data.table)
tmp <- BC32015
setnames(BC32015, old = c("PLOT","TAG","STAT","DC","SV","DJ","DV","DP","DM","ARMRZ","ARMFN","PBR","HO","OTHER","FOPI","TRAB","MECH.ROOT","PHSC","HEIGHT","INTACT","CHAR","FSCAR","NOTES","MOD","SP","NOTES.1"), new = c("plot","TagCurrent","STAT12","DC","sv","dj","dv","dp","DM","ARMRZ","ARMFN","PBR","HO","OTHER","fopi","trab","mech.root","phsc","HEIGHT","intact","char","fscar","NOTES","MOD","SP12","NOTES.1"))
d

tmp <- NULL


BC3 <- df.list$BC3
BC32015 <- df.list$BC32015


BC3 <- BC3[BC3$STAT12!="",]
#OR
BC3 <- BC3[complete.cases(BC3$STAT12),]

bc3rawprocstephAH <- uniquerows(BC3, BC3$TagCurrent, BC32015, BC32015$TagCurrent)

bc3rawprocstephAH <- smartbind(bc3rawprocstephAH, BC32015[BC32015$TagCurrent == "?",])

bc3rawprocstephAH$plot <- "bc3"

write.csv (bc3rawprocstephAH, "/media/UUI/Everything else/TEF data/Kero/2013 TFK data/combined/bc3rawprocstephAH.csv", row.names=FALSE)