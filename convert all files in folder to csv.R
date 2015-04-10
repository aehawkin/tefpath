setwd ("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined")

library(gdata)

tmp = list.files(pattern="*.xls")
rawkerodata <- lapply(tmp, read.xls)

sapply(names(rawkerodata), 
       function (x) write.table(rawkerodata[[x]], file     
                                =paste(x, "csv", sep=",")))

names(rawkerodata)<-tmp

setwd ("E:/Other Stuff/TEF data/Kero/Raw notebook data to be combined/tmp")

lapply(seq_along(rawkerodata), function(i) { write.csv(rawkerodata[[i]], 
                                                       file = paste(names(rawkerodata[i]), ".csv"),
                                                       row.names = FALSE)})
