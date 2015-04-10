#trim leading and trailing white space
trim <- function (x) 
{
  x <- gsub("^\\s+|\\s+$", "", x)
}

##trim leading, trailing, and internal whitespace
trimall <- function (x)
{
  x <- gsub("\\s+", "", x)
}
