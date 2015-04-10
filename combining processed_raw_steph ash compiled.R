#WINDOWS
setwd("E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/csv")

#WINDOWS
files <- dir("E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/csv")

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

names(df.list)
#############################################################################
BC220120910KAA
bc2KAproc

names(df.list$BC220120910KAA)
names(df.list$bc2KAproc)

names(df.list$BC220120910KAA)[names(df.list$BC220120910KAA) == 'BC2MALC_tag_current'] <- 'TagCurrent'
names(df.list$BC220120910KAA)[names(df.list$BC220120910KAA) == "ARM.FNS"] <- "ARMFN"
names(df.list$bc2KAproc)[names(df.list$bc2KAproc) == "ARM.FNS"] <- "ARMFN"
df.list$BC220120910KAA[["X"]] <- NULL


bc2KArawproc <- uniquerows(df.list$BC220120910KAA, df.list$BC220120910KAA[["TagCurrent"]], df.list$bc2KAproc, df.list$bc2KAproc[["TagCurrent"]])

bc2KArawproc <- smartbind(bc2KArawproc, df.list$bc2KAproc[df.list$bc2KAproc[["TagCurrent"]] == "?",])

write.csv (bc2KArawproc, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/bc2KArawproc.csv", row.names=FALSE)



bc2KArawproc <- uniquerows(df.list$BC220120910KAA, df.list$BC220120910KAA[["TagCurrent"]], df.list$bc2KAproc, df.list$bc2KAproc[["TagCurrent"]])

bc2KArawproc <- smartbind(bc2KArawproc, df.list$bc2KAproc[df.list$bc2KAproc[["TagCurrent"]] == "?",])

write.csv (bc2KArawproc, "E:/Everything else/TEF data/Kero/combining raw and processed kero data/combined/bc2KArawproc.csv", row.names=FALSE)

###############################################################################
BN220120731KA
bn2KArawproc

names(df.list$BN220120731KA)
names(df.list$bn2KArawproc)

names(df.list$BN220120731KA)[names(df.list$BN220120731KA) == 'tag_currentMalc'] <- 'TagCurrent'
names(df.list$BN220120731KA)[names(df.list$BN220120731KA) == "BB"] <- "sv"
names(df.list$bn2KArawproc)[names(df.list$bn2KArawproc) == "ARMFN"] <- "ARMFNS"

bn2KArawprocSCAH <- uniquerows(df.list$BN220120731KA, df.list$BN220120731KA[["TagCurrent"]], df.list$bn2KArawproc, df.list$bn2KArawproc[["TagCurrent"]])

bn2KArawprocSCAH <- smartbind(bn2KArawprocSCAH, df.list$bn2KArawproc[df.list$bn2KArawproc[["TagCurrent"]] == "?",])

write.csv (bn2KArawprocSCAH, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/bn2KArawprocSCAH.csv", row.names=FALSE)

####################################################################################
BN32012718KA
bn3KArawproc

names(df.list$BN32012718KA)
names(df.list$bn3KArawproc)

names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == 'tag_current'] <- 'TagCurrent'
names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == "BB"] <- "sv"
names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == "ARM.FNS"] <- "ARMFNS"
names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == "ARM.RZ"] <- "ARMRZ"
names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == "STATUS12"] <- "STAT12"
names(df.list$bn3KArawproc)[names(df.list$bn3KArawproc) == "ARMFN"] <- "ARMFNS"
names(df.list$BN32012718KA)[names(df.list$BN32012718KA) == "SPECIES"] <- "SP12"
df.list$BN32012718KA[["X"]] <- NULL

bn3KArawprocSCAH <- uniquerows(df.list$BN32012718KA, df.list$BN32012718KA[["TagCurrent"]], df.list$bn3KArawproc, df.list$bn3KArawproc[["TagCurrent"]])

bn3KArawprocSCAH <- smartbind(bn3KArawprocSCAH, df.list$bn3KArawproc[df.list$bn3KArawproc[["TagCurrent"]] == "?",])

write.csv (bn3KArawprocSCAH, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/bn3KArawprocSCAH.csv", row.names=FALSE)
################################################################################
BS220120709KA
bs2KArawproc

names(df.list$BS220120709KA)
names(df.list$bs2KArawproc)

names(df.list$BS220120709KA)[names(df.list$BS220120709KA) == 'tag_current_MALC'] <- 'TagCurrent'
names(df.list$BS220120709KA)[names(df.list$BS220120709KA) == "BB"] <- "sv"

bs2KArawprocSCAH <- uniquerows(df.list$BS220120709KA, df.list$BS220120709KA[["TagCurrent"]], df.list$bs2KArawproc, df.list$bs2KArawproc[["TagCurrent"]])

bs2KArawprocSCAH <- smartbind(bs2KArawprocSCAH, df.list$bs2KArawproc[df.list$bs2KArawproc[["TagCurrent"]] == "?",])

write.csv (bs2KArawprocSCAH, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/bs2KArawprocSCAH.csv", row.names=FALSE)
#########################################################################################
UN171212KA
un1KArawproc

names(df.list$UN171212KA)
names(df.list$un1KArawproc)

names(df.list$UN171212KA)[names(df.list$UN171212KA) == 'Tag.current'] <- 'TagCurrent'
names(df.list$UN171212KA)[names(df.list$UN171212KA) == "status.12"] <- "STAT12"
names(df.list$UN171212KA)[names(df.list$UN171212KA) == "ARM.RZ"] <- "ARMRZ"
names(df.list$UN171212KA)[names(df.list$UN171212KA) == "ARM.FNS"] <- "ARMFNS"
names(df.list$UN171212KA)[names(df.list$UN171212KA) == "BB"] <- "sv"
names(df.list$un1KArawproc)[names(df.list$un1KArawproc) == "ARMFN"] <- "ARMFNS"

un1KArawprocSCAH <- uniquerows(df.list$UN171212KA, df.list$UN171212KA[["TagCurrent"]], df.list$un1KArawproc, df.list$un1KArawproc[["TagCurrent"]])

un1KArawprocSCAH <- smartbind(un1KArawprocSCAH, df.list$un1KArawproc[df.list$un1KArawproc[["TagCurrent"]] == "?",])

write.csv (un1KArawprocSCAH, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/un1KArawprocSCAH.csv", row.names=FALSE)
##################################################################################################
UN220120724KA
un2KAproc

names(df.list$UN220120724KA)
names(df.list$un2KAproc)

names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == 'tag_current'] <- 'TagCurrent'
names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == "STATUS12"] <- "STAT12"
names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == "ARM.RZ"] <- "ARMRZ"
names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == "ARM.FNS"] <- "ARMFNS"
names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == "BB"] <- "sv"
names(df.list$UN220120724KA)[names(df.list$UN220120724KA) == "SPECIES12"] <- "SP12"
names(df.list$un2KAproc)[names(df.list$un2KAproc) == "ARMFN"] <- "ARMFNS"

un2KAprocSCAH <- uniquerows(df.list$UN220120724KA, df.list$UN220120724KA[["TagCurrent"]], df.list$un2KAproc, df.list$un2KAproc[["TagCurrent"]])

un2KAprocSCAH <- smartbind(un2KAprocSCAH, df.list$un2KAproc[df.list$un2KAproc[["TagCurrent"]] == "?",])

write.csv (un2KAprocSCAH, "E:/Everything else/TEF data/Kero/combining processed_raw_steph ash compiled/combined/un2KAprocSCAH.csv", row.names=FALSE)