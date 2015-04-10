setwd("/home/ashleyhawkins/Dropbox/Public/TFKPAP1/rawTFKdata2015/allplots")

raw2015<-read.csv("finalraw2015.csv", row.names=NULL, header=T)

raw2015[] <- lapply(raw2015, as.character)

#####recode stat
raw2015$stat.note <- raw2015$stat
recode.stat.note <- function (x) 
{
  x <- gsub('[0-9]',"", x)
  x <- trim(x)
}

recode.stat <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

#####trim leading and trailing white space
trim <- function (x) 
  {
  x <- gsub("^\\s+|\\s+$", "", x)
}

#####trim leading, trailing, and internal whitespace
trimall <- function (x)
{
  x <- gsub("\\s+", "", x)
}

raw2015$stat.note <- recode.stat.note(raw2015$stat.note)
raw2015$stat <- recode.stat(raw2015$stat)


#####recode tag
raw2015$tag.note <- raw2015$tag

recode.tag <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

raw2015$tag.note <- recode.tag.note(raw2015$tag.note)
raw2015$tag <- recode.tag(raw2015$tag)

#####recode sp
raw2015$sp.note <- raw2015$sp
recode.sp <- function (x) 
{
  x <- gsub('[0-9]|[[:punct:]]',"", x)
  x <- tolower(x)
  x <- trimall(x)
}

raw2015$sp <- recode.sp(raw2015$sp)

raw2015$sp[agrep("abc", raw2015$sp)] <- "abco"
raw2015$sp[agrep("abo", raw2015$sp)] <- "abco"
raw2015$sp[agrep("pij", raw2015$sp)] <- "pije"
raw2015$sp[agrep("pil", raw2015$sp)] <- "pila"
raw2015$sp[agrep("cade", raw2015$sp)] <- "cade"
raw2015$sp[agrep("café", raw2015$sp)] <- "cade"
raw2015$sp[agrep("kd", raw2015$sp)] <- "cade"

#####recode dc
raw2015$dc.note <- raw2015$dc
recode.dc.note <- function (x) 
{
  x <- gsub('[0-9]',"", x)
  x <- trim(x)
}

recode.dc <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

raw2015$dc.note <- recode.dc.note(raw2015$dc.note)
raw2015$dc <- recode.dc(raw2015$dc)

#####recode sv
raw2015$sv.note <- tolower(raw2015$sv)

recode.sv <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

#####recode dj
recode.dj <- function (x)
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

#####recode dp
recode.dp <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

#####recode dv
recode.dv <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

raw2015$sv <- recode.sv(raw2015$sv)
raw2015$dj <- recode.dj(raw2015$dj)
raw2015$dp <- recode.dp(raw2015$dp)
raw2015$dv <- recode.dv(raw2015$dv)

#####recode sv.note into dp dj dv
unique(raw2015$sv.note)

table(raw2015$sv)
table(raw2015$dj)
table(raw2015$dp)
table(raw2015$dv)

raw2015$dj[grep('\\<dj\\>|\\<di\\>',raw2015$sv.note)] <- "1"
raw2015$dp[grep('\\<dp\\>|\\<db\\>',raw2015$sv.note)] <- "1"
raw2015$dv[grep('\\<dv\\>', raw2015$sv.note)] <- "1"
raw2015$sv[grep('\\<sv\\>|\\<bb\\>', raw2015$sv.note)] <- "1"
raw2015$dm[grep('\\<100\\>|\\<110\\>|\\<221\\>', raw2015$sv.note)] <- "1"

raw2015$sv[grep('\\<old\\>', raw2015$sv.note)] <- ""
raw2015$dj[grep('\\<old\\>', raw2015$sv.note)] <- ""
raw2015$dp[grep('\\<old\\>', raw2015$sv.note)] <- ""
raw2015$dv[grep('\\<old\\>', raw2015$sv.note)] <- ""

#####recode dm

unique(raw2015$dm)

raw2015$dm.note <- tolower(raw2015$dm)

sort(unique(raw2015$dm))

recode.dm.note <- function (x) 
{
  x <- gsub('[0-9]',"", x)
  x <- trim(x)
}

recode.dm <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

raw2015$dm <- recode.dm(raw2015$dm)
raw2015$dm.note <- recode.dm.note(raw2015$dm.note)

raw2015$dm.note[raw2015$dm=="7565  4495"] <- "7565  4495"
raw2015$dm[raw2015$dm=="7565  4495"] <- NA

unique(raw2015$dm)

raw2015$dm[raw2015$dm=="100" | raw2015$dm=="1"   | raw2015$dm=="001" | raw2015$dm=="10" | raw2015$dm=="010"]<- "1"
raw2015$dm[raw2015$dm=="110" | raw2015$dm=="200" | raw2015$dm=="011" | raw2015$dm=="101" | raw2015$dm=="20"  | raw2015$dm=="11"  | raw2015$dm=="2"  ]<- "2"
raw2015$dm[raw2015$dm=="012" | raw2015$dm=="111" | raw2015$dm=="12"  | raw2015$dm=="120" | raw2015$dm=="021" | raw2015$dm=="21" | raw2015$dm=="102" | raw2015$dm=="201" | raw2015$dm=="210"]<- "3"
raw2015$dm[raw2015$dm=="112" | raw2015$dm=="211" | raw2015$dm=="121" | raw2015$dm=="22"  | raw2015$dm=="220"]<- "4"
raw2015$dm[raw2015$dm=="221" | raw2015$dm=="122" | raw2015$dm=="212"]<- "5"
raw2015$dm[raw2015$dm=="222"]<- "6"

raw2015$dm[raw2015$armrz=="100"]<-"1"
raw2015$dm[raw2015$armrz=="211-cytosp"]<-"4"
raw2015$dm[raw2015$armrz=="110-cytosp"]<-"2"
raw2015$dm[raw2015$armrz=="211-cytoSp"]<-"4"
raw2015$dm[raw2015$armrz=="110"]<-"2"
raw2015$dm[raw2015$armrz=="200_cytosp"]<-"2"
raw2015$dm[raw2015$armrz=="210"]<-"3"
raw2015$dm[raw2015$armrz=="001-top kill"]<-"1"
raw2015$dm[raw2015$armrz=="221"]<-"5"

#####recode armrz

raw2015$armrz[raw2015$armrz=="100"]<-NA
raw2015$armrz[raw2015$armrz=="211-cytosp"]<-NA
raw2015$armrz[raw2015$armrz=="110-cytosp"]<-NA
raw2015$armrz[raw2015$armrz=="211-cytoSp"]<-NA
raw2015$armrz[raw2015$armrz=="110"]<-NA
raw2015$armrz[raw2015$armrz=="200_cytosp"]<-NA
raw2015$armrz[raw2015$armrz=="210"]<-NA
raw2015$armrz[raw2015$armrz=="001-top kill"]<-NA
raw2015$armrz[raw2015$armrz=="221"]<-NA

raw2015$armrz.note <- raw2015$armrz

recode.armrz <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}

raw2015$armrz <- recode.armrz(raw2015$armrz)

unique(raw2015$armrz)

table(raw2015$armrz)

raw2015$armrz[grep('\\<1\\>|\\<rot\\>|\\<zones\\>|\\<pseudo\\>|\\<plates\\>|\\<PsP\\>|\\<lines\\>|\\<rmal\\>|\\<rz\\>|\\<?\\>|\\<lesions\\>|\\<x\\>|\\<2nday\\>',raw2015$armrz.note)] <- "1"

raw2015$armrz[raw2015$armrz=="05   5012"] <- ""
raw2015$armrz[raw2015$armrz=="0"] <- ""
raw2015$armrz[raw2015$armrz==NA] <- ""

unique(raw2015$armrz)

#####recode armfn

raw2015$armfn.note <- raw2015$armfn
recode.armfn <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}
raw2015$armfn <- recode.armfn(raw2015$armfn)

unique(raw2015$armfn.note)
table(raw2015$arm)

raw2015$armfn[grep('\\<1\\>|\\<rot\\>|\\<fbs\\>|\\<fb\\>|\\<?\\>|\\<??\\>',raw2015$armfn.note)] <- "1"

raw2015$armfn[raw2015$armfn=="2098  2099"] <- ""
raw2015$armfn[raw2015$armfn=="0"] <- ""

raw2015$arm[raw2015$armrz=="1" | raw2015$armfn=="1"] <- "1"

unique(raw2015$notes[grep("line",raw2015$notes)])
raw2015$arm[grep('\\<arm\\>|\\<rmal\\>|\\<zone\\>',raw2015$notes)] <- "1"

#####recode ho
raw2015$ho.note <- raw2015$ho

unique(raw2015$ho)

recode.ho <- function (x) 
{
  x <- gsub('[A-z]|[[:punct:]]',"", x)
  x <- trim(x)
}
raw2015$ho <- recode.ho(raw2015$ho)
table(raw2015$ho)
str(raw2015$ho)
unique(raw2015$ho.note)
raw2015$ho.note<-tolower(raw2015$ho.note)
raw2015$ho[grep('[a-z]',raw2015$ho.note)] <- "1"
raw2015$armho<-NULL

raw2015$dm[raw2015$ho.note=="111"] <- "111"
raw2015$ho[raw2015$ho=="111"] <- NA
raw2015$ho[raw2015$ho=="15"] <- NA
raw2015$ho[raw2015$ho=="4"] <- NA
raw2015$ho[raw2015$ho=="903"] <- NA

#####recode other
unique(raw2015$other[grep("arm", raw2015$other)])
table(raw2015$arm)
raw2015$arm[grep("arm", raw2015$other)] <- "1"
raw2015$arm[grep("zone", raw2015$other)] <- "1"

raw2015$other <- tolower(raw2015$other)
unique(raw2015$other[grep("fb", raw2015$other)])
raw2015$ho[grep("ho", raw2015$other)] <- "1"

#####recode pbr
unique(raw2015$other[agrep("crri", raw2015$other)])
unique(raw2015$notes[agrep("crri", raw2015$notes)])
table(raw2015$pbr)
raw2015$pbr[agrep("crri", raw2015$other)] <- "1"
raw2015$pbr[agrep("crri", raw2015$notes)] <- "1"
raw2015$pbr[raw2015$pbr=="rot"] <- NA

#####recode trab
unique(raw2015$other[agrep("trab", raw2015$other)])
raw2015$trab[agrep("trab", raw2015$notes)] <- "1"
raw2015$trab[agrep("trab", raw2015$other)] <- "1"
table(raw2015$trab)
raw2015$trab[raw2015$trab==""] <- NA

#####recode fopi
raw2015$fopi.note <- tolower(raw2015$fopi)
unique(raw2015$other[agrep("fopi", raw2015$other)])
unique(raw2015$notes[agrep("fopi", raw2015$notes)])
raw2015$fopi[agrep("fopi", raw2015$notes)] <- "1"
raw2015$fopi[agrep("fopi", raw2015$other)] <- "1"
table(raw2015$fopi)
unique(raw2015$fopi)
raw2015$fopi[raw2015$fopi==""] <- NA
raw2015$fopi[grep("1", raw2015$fopi)] <- "1"
raw2015$fopi[grep("2", raw2015$fopi)] <- NA
raw2015$fopi[grep("0", raw2015$fopi)] <- NA
raw2015$fopi <- gsub('[A-z]|[[:punct:]]', "", raw2015$fopi)
raw2015$fopi <- trim(raw2015$fopi)

#####recode phsc
raw2015$phsc.note <- tolower(raw2015$phsc)

unique(raw2015$other[agrep("phsc", raw2015$other)])
unique(raw2015$notes[agrep("phsc", raw2015$notes)])
unique(raw2015$notes2[agrep("phsc", raw2015$notes2)])
raw2015$phsc[agrep("phsc", raw2015$notes)] <- "1"
raw2015$phsc[agrep("phsc", raw2015$other)] <- "1"
table(raw2015$phsc)
unique(raw2015$phsc)
raw2015$phsc[grep("1", raw2015$phsc)] <- "1"
raw2015$phsc[grep("4", raw2015$phsc)] <- NA
raw2015$phsc[grep("0", raw2015$phsc)] <- NA
raw2015$phsc <- gsub('[A-z]|[[:punct:]]', "", raw2015$phsc)
raw2015$phsc <- trim(raw2015$phsc)

raw2015$uniqueid <- paste(raw2015$tag, raw2015$plot)

write.csv (raw2015, "/media/UUI/Everything else/TEF data/rawTFKdata2015/allplots/formatcols2015notes.csv", row.names=FALSE)

names(raw2015)
cleanpath <- subset(raw2015, select = c("plot","tag", "tag.note", "stat","dc","sv","dj","dv","dp","dm","armrz","armfn","pbr","ho","other","fopi","trab","mech","phsc","mod","sp","notes2"))

cleanpath$uniqueid <- paste(raw2015$tag, raw2015$plot)
cleanpath$uniqueid <- trimall(cleanpath$uniqueid)
cleanpath$.id <- raw2015$.id
                    
write.csv (cleanpath, "/home/ashleyhawkins/Dropbox/Public/TFKPAP1/rawTFKdata2015/allplots/cleanpath.csv", row.names=FALSE)