setwd("/home/bioinformatics/Documents/AshleyHawkins/Dropbox/Public/TFKPAP1/RemeasurePathJoin/joined")

tfk <- read.csv("TFKfinal2015.csv", header = TRUE)

library(stringr)

names(tfk)

tfk$tag <- ifelse(is.na(tfk$tag), str_sub(tfk$uniqueid, 0, -4), tfk$tag)

tfk$tag <- ifelse(is.na(tfk$tag), tfk$tg_04.r11, 
           ifelse(is.na(tfk$tg_04.r11), tfk$tg_11.m15, 
           ifelse(is.na(tfk$tg_11.m15), tfk$tg_12.m15), 
           ifelse(is.na(tfk$tg_12.m15), tfk$tg_11.1.m15, tfk$tag)
)

tfk$tag <- ifelse(is.na(tfk$tag), 
                  ifelse(is.na(tfk$tg_04.r11), 
                         ifelse(is.na(tfk$tg_11.m15), 
                                ifelse(is.na(tfk$tg_12.m15), 
                                       ifelse(is.na(tfk$tg_11.1.m15), 
                                              NA, 
                                              tfk$tg_11.1.m15), 
                                       tfk$tg_12.m15), 
                                tfk$tg_11.m15), 
                         tfk$tg_04.r11), 
                  tfk$tag)


tmp$c3 <- ifelse(tmp$c3=="", tmp$c2, tmp$c3)

tmp <- ifelse(tfk$tag==NA, str_sub(tfk$uniqueid, 0, -4), tfk$tag)
