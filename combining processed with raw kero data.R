#WINDOWS
setwd("E:/Everything else/TEF data/Kero/combining raw and processed kero data/csv")

#UBUNTU
setwd("/media/ashleyhawkins/UUI/Everything else/TEF data/Kero/combining raw and processed kero data/csv")

#WINDOWS
files <- dir("E:/Everything else/TEF data/Kero/combining raw and processed kero data/csv")

#UBUNTU
files <- dir("/media/ashleyhawkins/UUI/Everything else/TEF data/Kero/combining raw and processed kero data/csv")

#read files into a list of data frames
df.list <- lapply(files, read.csv)

#name data frames with list of file names minus the file extension
names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

#function to perform on each data frame
asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
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

#############################################################################

bc2KAproc
bc2KAraw

bc2KAproc<-read.csv("bc2KAproc.csv", row.names=NULL, header=T)
bc2KAraw<-read.csv("bc2KAraw.csv", row.names=NULL, header=T)

#function to perform on each data frame
asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

bc2KAproc <- asfactor(bc2KAproc)
bc2KAraw <- asfactor(bc2KAraw)

library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}


bc2rawproc <- uniquerows(bc2KAproc, bc2KAproc$TagCurrent, bc2KAraw, bc2KAraw$TagCurrent)

#no unique values

##########################################################################################
bn1KA
bn1KAraw

bn1KA<-read.csv("bn1KA.csv", row.names=NULL, header=T)
bn1KAraw<-read.csv("bn1KAraw.csv", row.names=NULL, header=T)

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

bn1KA <- asfactor(bn1KA)
bn1KAraw <- asfactor(bn1KAraw)

library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bn1KArawproc <- uniquerows(df.list$bn1KA, df.list$bn1KA[["TagCurrent"]], df.list$bn1KAraw, df.list$bn1KAraw[["TagCurrent"]])

bn1KArawproc <- smartbind(bn1KArawproc, df.list$bn1KAraw[df.list$bn1KAraw[["TagCurrent"]] == "?",])

write.csv (bn1KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bn1KArawproc.csv", row.names=FALSE)

##############################################################################################

BN2KA2014.5.5
bn2KAproc

library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bn2KArawproc <- uniquerows(df.list$BN2KA2014.5.5, df.list$BN2KA2014.5.5[["TagCurrent"]], df.list$bn2KAproc, df.list$bn2KAproc[["TagCurrent"]])

bn2KArawproc <- smartbind(bn2KArawproc, df.list$bn2KAproc[df.list$bn2KAproc[["TagCurrent"]] == "?",])

write.csv (bn2KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bn2KArawproc.csv", row.names=FALSE)

####################################################################

bn3KAproc    
bn3KAraw

library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}

bn3KArawproc <- smartbind(df.list$bn3KAproc, df.list$bn3KAraw[df.list$bn3KAraw[["TagCurrent"]] == "?",])

write.csv (bn3KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bn3KArawproc.csv", row.names=FALSE)

####################################################
bs1KA     
bs1KAraw

bs1KArawproc <- uniquerows(df.list$bs1KA, df.list$bs1KA[["TagCurrent"]], df.list$bs1KAraw, df.list$bs1KAraw[["TagCurrent"]])

tmp <- df.list$bs1KAraw[df.list$bs1KAraw[["TagCurrent"]] == "?",]

bs1KArawproc <- smartbind(bs1KArawproc, df.list$bs1KAraw[df.list$bs1KAraw[["TagCurrent"]] == "?",])

write.csv (bs1KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bs1KArawproc.csv", row.names=FALSE)

############################################################################
bs2KAproc
bs2KAraw

bs2KArawproc <- uniquerows(df.list$bs2KAproc, df.list$bs2KAproc[["TagCurrent"]], df.list$bs2KAraw, df.list$bs2KAraw[["TagCurrent"]])

bs2KArawproc <- smartbind(bs2KArawproc, df.list$bs2KAraw[df.list$bs2KAraw[["TagCurrent"]] == "?",])

write.csv (bs2KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bs2KArawproc.csv", row.names=FALSE)

##############################################################################
BS3KAFullTree
BS3KA20140421

bs3KArawproc <- uniquerows(df.list$BS3KAFullTree, df.list$BS3KAFullTree[["TagCurrent"]], df.list$BS3KA20140421, df.list$BS3KA20140421[["TagCurrent"]])

bs3KArawproc <- smartbind(bs3KArawproc, df.list$BS3KA20140421[df.list$BS3KA20140421[["TagCurrent"]] == "?",])

write.csv (bs3KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bs3KArawproc.csv", row.names=FALSE)

######################################################################
uc2KA
UC2KA20140515

uc2KArawproc <- uniquerows(df.list$uc2KA, df.list$uc2KA[["TagCurrent"]], df.list$UC2KA20140515, df.list$UC2KA20140515[["TagCurrent"]])

uc2KArawproc <- smartbind(uc2KArawproc, df.list$UC2KA20140515[df.list$UC2KA20140515[["TagCurrent"]] == "?",])

write.csv (uc2KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/uc2KArawproc.csv", row.names=FALSE)

######################################################################
UC3KAFullTree
uc3KAraw

uc3KArawproc <- uniquerows(df.list$UC3KAFullTree, df.list$UC3KAFullTree[["TagCurrent"]], df.list$uc3KAraw, df.list$uc3KAraw[["TagCurrent"]])

uc3KArawproc <- smartbind(uc3KArawproc, df.list$uc3KAraw[df.list$uc3KAraw[["TagCurrent"]] == "?",])

write.csv (uc3KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/uc3KArawproc.csv", row.names=FALSE)

########################################################################
un1KAproc
un1KAraw

un1KArawproc <- uniquerows(df.list$un1KAproc, df.list$un1KAproc[["TagCurrent"]], df.list$un1KAraw, df.list$un1KAraw[["TagCurrent"]])

un1KArawproc <- smartbind(un1KArawproc, df.list$un1KAraw[df.list$un1KAraw[["TagCurrent"]] == "?",])

write.csv (un1KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/un1KArawproc.csv", row.names=FALSE)

#########################################################################

un2KAproc
un2KAraw

#no unique values
#no "?" in un2KAraw$TagCurrent

#######################################################################
us2KA
us2KAraw

us2KArawproc <- uniquerows(df.list$us2KA, df.list$us2KA[["TagCurrent"]], df.list$us2KAraw, df.list$us2KAraw[["TagCurrent"]])

us2KArawproc <- smartbind(us2KArawproc, df.list$us2KAraw[df.list$us2KAraw[["TagCurrent"]] == "?",])

write.csv (us2KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/us2KArawproc.csv", row.names=FALSE)
