setwd("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join")
files <- dir("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/join")

df.list <- lapply(files, read.csv)

names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

aschar <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.character)
  return(df)
}

df.list[names(df.list)] <- lapply(df.list[names(df.list)], aschar)

df.list$cleanpath[["uniqueid"]] <- trimall(df.list$cleanpath[["uniqueid"]])

df.list$cleanpath[["uniqueid"]][df.list$cleanpath[["tag"]]==""] <- NA

cleanpath <- df.list$cleanpath

rawcrew2011 <- df.list$rawcrew2011

rawcrew2011$uniqueid <- paste(rawcrew2011$tg_04, rawcrew2011$plot)

rawcrew2011$uniqueid <- trimall(rawcrew2011$uniqueid)

rawcrew2011$uniqueid[rawcrew2011$tg_04==""] <- NA

colnames(rawcrew2011) <- paste(colnames(rawcrew2011), "r11", sep=".")

colnames(rawcrew2011)[colnames(rawcrew2011)=="uniqueid.r11"] <- "uniqueid"

pathraw<-merge(cleanpath, rawcrew2011, by = "uniqueid", all = TRUE, incomparables = NA)

#######merge malc 2015

df.list$malc2015[["uniqueid"]] <- paste(df.list$malc2015[["tg_11"]], df.list$malc2015[["all.trees_plot"]])

df.list$malc2015[["uniqueid"]] <- trimall(df.list$malc2015[["uniqueid"]])

df.list$malc2015[["uniqueid"]][df.list$malc2015[["tg_11"]]==""] <- NA

colnames(df.list$malc2015) <- paste(colnames(df.list$malc2015), "m15", sep=".")

colnames(df.list$malc2015)[colnames(df.list$malc2015)=="uniqueid.m15"] <- "uniqueid"

path.raw.malc2015<-merge(pathraw, df.list$malc2015, by = "uniqueid", all.x = TRUE, all.y = FALSE, incomparables = NA)

#####merge malc 2005

malc2005 <- df.list$malc2005

malc2005$uniqueid <- paste(malc2005$tag_current, malc2005$plot)

malc2005$uniqueid <- trimall(malc2005$uniqueid)

malc2005$uniqueid[malc2005$tag_current==""] <- NA

colnames(malc2005) <- paste(colnames(malc2005), "m05", sep=".")

colnames(malc2005)[colnames(malc2005)=="uniqueid.m05"] <- "uniqueid"

path.raw.malc.2005.2015<-merge(path.raw.malc2015, malc2005, by = "uniqueid", all.x = TRUE, all.y = FALSE, incomparables = NA)

write.csv (path.raw.malc.2005.2015, "/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/joined/TFKfinal2015.csv", row.names=FALSE)

###################################
str(df.list$malc2015)

TFKfinal2015$dups <- duplicated(TFKfinal2015[,c(1,4:12,14,)]))

count(duplicated(TFKfinal2015[c(1,3:10)]))

cleanpath$dups <- duplicated(cleanpath[,c(1:11,13,20,22)]))

write.csv (cleanpath, "/home/ashleyhawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/cleanpathdups.csv", row.names=FALSE)