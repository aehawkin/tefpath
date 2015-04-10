setwd("/media/UUI/Everything else/TEF data/rawTFKdata2015/data")

files <- dir("/media/UUI/Everything else/TEF data/rawTFKdata2015/data")

df.list <- lapply(files, read.csv)

names(df.list) <- gsub('\\<csv\\>|[[:punct:]]',"", files)

asfactor <- function(df){
  df[names(df)] <- lapply(df[names(df)], as.factor)
  return(df)
}

#apply function across all dataframes
df.list[names(df.list)] <- lapply(df.list[names(df.list)], asfactor)

names(df.list)

tmp <- smartbind("df.list$bc1path2015", "df.list$bc2path2015", "df.list$bc3path2015", "df.list$bn1path2015", "df.list$bn2path2015", "df.list$bn3path2015", "df.list$bs1path2015", "df.list$bs2path2015", "df.list$bs3path2015", "df.list$uc1path2015", "df.list$uc2path2015", "df.list$uc3path2015", "df.list$un1path2015", "df.list$un2path2015", "df.list$un3path2015", "df.list$us1path2015", "df.list$us2path2015", "df.list$us3path2015")

library(plyr)
tmp <- ldply("df.list$bc1path2015", "df.list$bc2path2015", "df.list$bc3path2015", "df.list$bn1path2015", "df.list$bn2path2015", "df.list$bn3path2015", "df.list$bs1path2015", "df.list$bs2path2015", "df.list$bs3path2015", "df.list$uc1path2015", "df.list$uc2path2015", "df.list$uc3path2015", "df.list$un1path2015", "df.list$un2path2015", "df.list$un3path2015", "df.list$us1path2015", "df.list$us2path2015", "df.list$us3path2015")

tmp <- ldply(df.list)

tmp <- smartbind(df.list)

tmp <- do.call("rbind", df.list)

