setwd("E:/Everything else/TEF data/Kero/Raw notebook data to be combined/csv")

files <- dir("E:/Everything else/TEF data/Kero/Raw notebook data to be combined/csv")

#read files into a list of data frames
df.list <- lapply(files, read.csv)

#name data frames with list of file names
names(df.list) <- files

#function to perform on each data frame
asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

#apply function across all dataframes
df.list[names(df.list)] <- lapply(df.list[names(df.list)], asfactor)

#check structure of individuals
str(df.list[[2]])

###################################################################################

BC2KA2014.04.30
BC2KA2014.5.14

names(df.list$BC2KA2014.04.30)
names(df.list$BC2KA2014.5.14)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bc2KAraw <- uniquerows(df.list$BC2KA2014.04.30, df.list$BC2KA2014.04.30[["TagCurrent"]], df.list$BC2KA2014.5.14, df.list$BC2KA2014.5.14[["TagCurrent"]])

bc2KAraw$plot <- "bc2"

#write
write.csv (bc2KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/bc2KAraw.csv", row.names=FALSE)

##################################################################################

BN1KA2014.05.06
BN1KA2014.05.07Part2
BN1KA2014.05.15

names(df.list$BN1KA2014.05.06)
names(df.list$BN1KA2014.05.07Part2)
names(df.list$BN1KA2014.05.15)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bn1KAraw <- uniquerows(df.list$BN1KA2014.05.06, df.list$BN1KA2014.05.06[["TagCurrent"]], df.list$BN1KA2014.05.07Part2, df.list$BN1KA2014.05.07Part2[["TagCurrent"]])

bn1KAraw2 <- uniquerows(bn1KAraw, bn1KAraw$TagCurrent, df.list$BN1KA2014.05.15, df.list$BN1KA2014.05.15[["TagCurrent"]])

bn1KAraw2$plot <- "bn1"

write.csv (bn1KAraw2, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/bn1KAraw.csv", row.names=FALSE)

####################################################################################
BN3KA2014.05.16
BN3KA2014.5.1

names(df.list$BN3KA2014.05.16)
names(df.list$BN3KA2014.5.1)

names(df.list$BN3KA2014.05.16)[names(df.list$BN3KA2014.05.16) == 'TagCur'] <- 'TagCurrent'
names(df.list$BN3KA2014.05.16)[names(df.list$BN3KA2014.05.16) == 'NOTE'] <- 'NOTES'
names(df.list$BN3KA2014.05.16)[names(df.list$BN3KA2014.05.16) == 'mech'] <- 'mech.root'

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bn3KAraw <- uniquerows(df.list$BN3KA2014.05.16, df.list$BN3KA2014.05.16[["TagCurrent"]], df.list$BN3KA2014.5.1, df.list$BN3KA2014.5.1[["TagCurrent"]])

str(df.list$BN3KA2014.05.16)
str(df.list$BN3KA2014.5.1)

bn3KAraw$plot <- "bn3"

write.csv (bn3KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/bn3KAraw.csv", row.names=FALSE)

##################################################################

BS1KA2014.5.6
BS1KA2014.05.07Part2
BS1KA2014.5.15

names(df.list$BS1KA2014.5.6)
names(df.list$BS1KA2014.05.07Part2)
names(df.list$BS1KA2014.5.15)

str(df.list$BS1KA2014.5.6)
str(df.list$BS1KA2014.05.07Part2)
str(df.list$BS1KA2014.5.15)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bs1KAraw <- uniquerows(df.list$BS1KA2014.5.6, df.list$BS1KA2014.5.6[["TagCurrent"]], df.list$BS1KA2014.05.07Part2, df.list$BS1KA2014.05.07Part2[["TagCurrent"]])

bs1KAraw2 <- uniquerows(bs1KAraw, bs1KAraw$TagCurrent, df.list$BS1KA2014.5.15, df.list$BS1KA2014.5.15[["TagCurrent"]])

str(df.list$BS1KA2014.5.6)
str(df.list$BS1KA2014.05.07Part2)

bs1KAraw2$plot <- "bs1"

write.csv (bs1KAraw2, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/bs1KAraw.csv", row.names=FALSE)

######################################################################################
BS2KA2014.04.23
BS2KA2014.05.55

names(df.list$BS2KA2014.04.23)
names(df.list$BS2KA2014.05.55)


str(df.list$BS2KA2014.04.23)
str(df.list$BS2KA2014.05.55)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
bs2KAraw <- uniquerows(df.list$BS2KA2014.04.23, df.list$BS2KA2014.04.23[["TagCurrent"]], df.list$BS2KA2014.05.55, df.list$BS2KA2014.05.55[["TagCurrent"]])


str(df.list$BS2KA2014.04.23)
str(df.list$BS2KA2014.05.55)

bs2KAraw$plot <- "bs1"

write.csv (bs2KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/bs2KAraw.csv", row.names=FALSE)

##########################################################################################
UC3KA2014.04.25
UC3KA2014.04.29
UC3KA2014.4.30
UC3KA2014.5.6

names(df.list$UC3KA2014.04.25)
names(df.list$UC3KA2014.04.29)
names(df.list$UC3KA2014.4.30)
names(df.list$UC3KA2014.5.6)

str(df.list$UC3KA2014.04.25)
str(df.list$UC3KA2014.04.29)
str(df.list$UC3KA2014.4.30)
str(df.list$UC3KA2014.5.6)
#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
uc3KAraw <- uniquerows(df.list$UC3KA2014.04.25, df.list$UC3KA2014.04.25[["TagCurrent"]], df.list$UC3KA2014.04.29, df.list$UC3KA2014.04.29[["TagCurrent"]])

uc3KAraw2 <- uniquerows(uc3KAraw, uc3KAraw$TagCurrent, df.list$UC3KA2014.4.30, df.list$UC3KA2014.4.30[["TagCurrent"]])

uc3KAraw3 <- uniquerows(uc3KAraw2, uc3KAraw2$TagCurrent, df.list$UC3KA2014.5.6, df.list$UC3KA2014.5.6[["TagCurrent"]])

str(df.list$UC3KA2014.04.25)
str(df.list$UC3KA2014.04.29)

uc3KAraw3$plot <- "uc3"

write.csv (uc3KAraw3, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/uc3KAraw.csv", row.names=FALSE)

####################################################################################

UN1KA2014.05.16
UN1KA2014.05.20
UN1KA2014.5.1

names(df.list$UN1KA2014.05.16)
names(df.list$UN1KA2014.05.20)
names(df.list$UN1KA2014.5.1)


str(df.list$UN1KA2014.05.16)
str(df.list$UN1KA2014.05.20)
str(df.list$UN1KA2014.5.1)

#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
un1KAraw <- uniquerows(df.list$UN1KA2014.05.16, df.list$UN1KA2014.05.16[["TagCurrent"]], df.list$UN1KA2014.05.20, df.list$UN1KA2014.05.20[["TagCurrent"]])

un1KAraw2 <- uniquerows(un1KAraw, un1KAraw$TagCurrent, df.list$UN1KA2014.5.1, df.list$UN1KA2014.5.1[["TagCurrent"]])

str(df.list$UN1KA2014.05.16)
str(df.list$UN1KA2014.05.20)

un1KAraw$plot <- "un1"

write.csv (un1KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/un1KAraw.csv", row.names=FALSE)

####################################################################
UN2KA2014.04.29
UN2KA2014.04.30

names(df.list$UN2KA2014.04.29)
names(df.list$UN2KA2014.04.30)


str(df.list$UN2KA2014.04.29)
str(df.list$UN2KA2014.04.30)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
un2KAraw <- uniquerows(df.list$UN2KA2014.04.29, df.list$UN2KA2014.04.29[["TagCurrent"]], df.list$UN2KA2014.04.30, df.list$UN2KA2014.04.30[["TagCurrent"]])


str(df.list$UN2KA2014.04.29)
str(df.list$UN2KA2014.04.30)

un2KAraw$plot <- "un2"

write.csv (un2KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/un2KAraw.csv", row.names=FALSE)

##############################################################################
US2KA2014.05.07
US2KA2014.05.14

names(df.list$US2KA2014.05.07)
names(df.list$US2KA2014.05.14)


str(df.list$US2KA2014.05.07)
str(df.list$US2KA2014.05.14)


#unique rows
library(gtools)
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
us2KAraw <- uniquerows(df.list$US2KA2014.05.07, df.list$US2KA2014.05.07[["TagCurrent"]], df.list$US2KA2014.05.14, df.list$US2KA2014.05.14[["TagCurrent"]])


str(df.list$US2KA2014.05.07)
str(df.list$US2KA2014.05.14)

us2KAraw$plot <- "us2"

write.csv (us2KAraw, "E:/Everything else/TEF data/Kero/Raw notebook data to be combined/combined/us2KAraw.csv", row.names=FALSE)
