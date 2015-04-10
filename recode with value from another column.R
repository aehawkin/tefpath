c1 <- c("1", "2", "3", "4")
c2 <- c("", "", "5", "6")
tmp <- data.frame(c1, c2)

tmp$c1 <- as.character(tmp$c1)

tmp$c2 <- as.character(tmp$c2)

str(tmp)

tmp$c2[tmp$c2==""] <- NA

tmp$c2 <- ifelse(tmp$c2=="NA", tmp$c1, tmp$c2)

# OR without assigning NAs to missing values just run:

tmp$c2 <- ifelse(tmp$c2=="", tmp$c1, tmp$c2)
