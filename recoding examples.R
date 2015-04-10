tmp

#copy and past values from one column to another and delete original
tmp <- raw2015

tmp$dm[grep("100", tmp$dc)] <- "100"
tmp$dm[grep("110", tmp$dc)] <- "110"
tmp$dc <- gsub("100", "", tmp$dc)
tmp$dc <- gsub("110", "", tmp$dc)

#gives position of match
match("100", tmp$dc)


#easy recode full example
v1 <- c("0", "0", "0", "0")
v2 <- c("dv", "djdv", "dj", "dp")
tmp <- as.data.frame(cbind(v1, v2))

tmp[] <- lapply(tmp, as.character)

tmp$c1[tmp$c2=="dj"] <- "1"

tmp$v1[grep('[p]|[v]',tmp$v2)] <- "1"

tmp$v1 <- gsub('\\<dv\\>|\\<dp\\>',"",tmp$v2)

copy.paste <- function(targetcolumn, matchcolumn, pattern, replacementvalue, blank) 
{
  targetcolumn[grep(pattern, matchcolumn)] <- replacementvalue
  return(targetcolumn)
}
targetcolumn <- recode.bb(targetcolumn, matchcolumn, pattern, replacementvalue)
raw2015$dj <- recode.bb(raw2015$dj, raw2015$sv.note, '\\<dj\\>|\\<di\\>', "1")


#approximate pattern match and recoding
raw2015$sp[agrep("abc", raw2015$sp)] <- "abco"
##columns can be different
