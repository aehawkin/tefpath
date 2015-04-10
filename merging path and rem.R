##append path data

setwd("/media/UUI/TFK/TFKPAP1/RemeasurePathJoin/malc")
setwd("/home/ash/Dropbox/Public/TFKPAP1/RemeasurePathJoin/malc")

files <- dir("/media/UUI/TFK/TFKPAP1/RemeasurePathJoin/malc")

files <- dir("/home/ash/Dropbox/Public/TFKPAP1/RemeasurePathJoin/malc")

df.list <- lapply(files, read.csv)

names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

aschar <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.character)
  return(df)
}

df.list[names(df.list)] <- lapply(df.list[names(df.list)], aschar)

str(df.list[[1]])
str(df.list[[2]])

library(plyr)

malc2015 <- rbind.fill(df.list)

malc2015$uniqueid <- paste(malc2015$tg_11, malc2015$all.trees_plot)

malc2015$uniqueid <- trimall(malc2015$uniqueid)

write.csv (malc2015, "/home/ash/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join/malc2015.csv", row.names=FALSE)

##################
##merge path and Malcolm's cleaned remeasure data
setwd("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join")
files <- dir("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join")

df.list <- lapply(files, read.csv)

names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

df.list$cleanpath[["uniqueid"]] <- trimall(df.list$cleanpath[["uniqueid"]])

df.list$cleanpath[["uniqueid"]][df.list$cleanpath[["tag"]]==""] <- NA

df.list$cleanpath[["uniqueid"]][is.na(df.list$cleanpath[["tag"]])] <- ""

df.list$malc2015[["uniqueid"]] <- paste(df.list$malc2015[["tg_11"]], df.list$malc2015[["all.trees_plot"]])

df.list$malc2015[["uniqueid"]] <- trimall(df.list$malc2015[["uniqueid"]])

df.list$malc2015[["uniqueid"]][df.list$malc2015[["tg_11"]]==""] <- NA

df.list$malc2015[["uniqueid"]][is.na(df.list$malc2015[["uniqueid"]])] <- ""

colnames(df.list$malc2015) <- paste(colnames(df.list$malc2015), "m15", sep = ".")

#######################33
names(df.list$malc2015)=="uniqueid.m15" <- "uniqueid"
########################3
library(plyr)

pathrem<-join(df.list$cleanpath, df.list$malc2015, by = "uniqueid", type = "full", match = "all")

write.csv (pathrem, "/media/ashleyhawkins/UUI/TFK/TFKPAP1/RemeasurePathJoin/join/pathrem.csv", row.names=FALSE)

############################################
##append raw field crew data 2011
setwd("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/raw field crew data")

files2 <- dir("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/raw field crew data")

df.list2 <- lapply(files2, read.csv)

names(df.list2) <- gsub('\\<csv\\>|[[:punct:]]',"", files2)

aschar <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.character)
  return(df)
}

df.list2[names(df.list2)] <- lapply(df.list2[names(df.list2)], aschar)

library(plyr)

rawcrew2011 <- rbind.fill(df.list2)

rawcrew2011$uniqueid <- paste(rawcrew2011$tg_04, rawcrew2011$plot)

rawcrew2011$uniqueid <- trimall(rawcrew2011$uniqueid)

rawcrew2011$uniqueid[rawcrew2011$tg_04==""] <- NA

rawcrew2011$uniqueid[is.na(rawcrew2011$uniqueid)] <- ""

pathrem$uniqueid[is.na(pathrem$uniqueid)] <- ""

colnames(rawcrew2011) <- paste(colnames(rawcrew2011), "r11", sep = ".")

write.csv (rawcrew2011, "/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join/rawcrew2011.csv", row.names=FALSE)

#########################################################
##merge Malcolm's 2015, path, and raw field crew data

pathremrawfield<-join(pathrem, rawfieldcrew2011, by = "uniqueid", type = "full", match = "all")

pathremrawfield$uniqueid[is.na(pathremrawfield$uniqueid)] <- ""

##################################################
## merge with Malcolm's old data (2005)
setwd("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/malc2005")

malc2005 <- read.csv("Cleaned tree2 with worksheet treatments.csv", header=T)

malc2005$uniqueid <- paste(malc2005$tag_current, malc2005$plot)

malc2005$uniqueid <- trimall(malc2005$uniqueid)

malc2005$uniqueid[malc2005$tag_current==""] <- ""

colnames(malc2005) <- paste(colnames(malc2005), "m05", sep = ".")

pathremrawfieldmalc2005<-join(pathremrawfield, malc2005, by = "uniqueid", type = "full", match = "all")

write.csv (pathremrawfieldmalc2005, "/media/ashleyhawkins/UUI/TFK/TFKPAP1/RemeasurePathJoin/join/path.allmalc.csv", row.names=FALSE)


summary(pathremrawfieldmalc2005)
