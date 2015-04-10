setwd("E:/Everything else/TEF data/Kero/Raw notebook data to be combined/csv")

#make list of file names in dir
files <- dir("E:/Everything else/TEF data/Kero/Raw notebook data to be combined/csv")

files <- dir("C:/temp/profile/Desktop/documents-export-2015-01-27(1)")

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

#the same function can be done on individual data frames too
BS1KA2014.5.6 <- asfactor(BS1KA2014.5.6)
str(BS1KA2014.5.6)

#write to file
setwd("/media/ashleyhawkins/UUI/Other Stuff/TEF data/Kero/Raw notebook data to be combined/csv/tmp")

lapply(seq_along(df.list), function(i) { 
  write.csv(df.list[[i]], 
  file = paste(names(df.list[i]), ".csv"),
  row.names = FALSE)})
