#recode
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

#####find unique rows between two dataframes
uniquerows <- function(x, y, x2, y2)
  #x=df1, y=df1$key column, x2=df2, y2=df2$key column, 
{ 
  x <- x
  x2 <- x2[y2 %in% setdiff(y2, y),]
  smartbind(x, x2)
}
