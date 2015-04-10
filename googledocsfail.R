inserting your unique key inplace of 'KEY'. You can then just pull it into R with RCurl:

install.packages("XML")


library(RCurl)
  
library(XML)

https://docs.google.com/spreadsheets/d/14R-883eA8sIpwmbAI7L3MotD54ZFzX9LwtStTtmcRds/pubhtml

##this didnt work
url <- https://docs.google.com/spreadsheets/d/14R-883eA8sIpwmbAI7L3MotD54ZFzX9LwtStTtmcRds/export?format=csv&id=14R-883eA8sIpwmbAI7L3MotD54ZFzX9LwtStTtmcRds

myCsv <- getURL(url)
test2 <- read.csv(textConnection(myCsv))

##this didnt work
google_ss <- function(gid, key) 
{
  if (is.na(gid)) {stop("\nWorksheetnumber (gid) is missing\n")}
  if (is.na(key)) {stop("\nDocumentkey (key) is missing\n")}
  require(RCurl)
  url <- getURL(paste("https://docs.google.com/spreadsheet/pub?key=", key,
                      "&single=true&gid=", gid, "&output=csv", sep = ""),
                cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
  read.csv(textConnection(url), header = T, sep = ",")
}


readGoogleSheet <- function(url, na.string="", header=TRUE){
  stopifnot(require(XML))
  # Suppress warnings because Google docs seems to have incomplete final line
  suppressWarnings({
    doc <- paste(readLines(url), collapse=" ")
  })
  if(nchar(doc) == 0) stop("No content found")
  htmlTable <- gsub("^.*?(<table.*</table).*$", "\\1>", doc)
  ret <- readHTMLTable(htmlTable, header=header, stringsAsFactors=FALSE, as.data.frame=TRUE)
  lapply(ret, function(x){ x[ x == na.string] <- NA; x})
}

cleanGoogleTable <- function(dat, table=1, skip=0, ncols=NA, nrows=-1, header=TRUE, dropFirstCol=NA){
  if(!is.data.frame(dat)){
    dat <- dat[[table]]
  }
  
  if(is.na(dropFirstCol)) {
    firstCol <- na.omit(dat[[1]])
    if(all(firstCol == ".") || all(firstCol== as.character(seq_along(firstCol)))) {
      dat <- dat[, -1]
    }
  } else if(dropFirstCol) {
    dat <- dat[, -1]
  }
  
  if(skip > 0){
    dat <- dat[-seq_len(skip), ]
  }
  
  if(nrow(dat) == 1) return(dat)
  
  
  if(nrow(dat) >= 2){
    if(all(is.na(dat[2, ]))) dat <- dat[-2, ]
  }
  if(header && nrow(dat) > 1){
    header <- as.character(dat[1, ])
    names(dat) <- header
    dat <- dat[-1, ]
  }
  
  # Keep only desired columns
  if(!is.na(ncols)){
    ncols <- min(ncols, ncol(dat))
    dat <- dat[, seq_len(ncols)]
  }

u <- "https://docs.google.com/spreadsheets/d/14R-883eA8sIpwmbAI7L3MotD54ZFzX9LwtStTtmcRds/pubhtml"
g <- readGoogleSheet(u)
cleanGoogleTable(g, table=1)


readSpreadsheet <- function(url, sheet = 1){
  library(httr)
  r <- GET(url)
  html <- content(r)
  sheets <- readHTMLTable(html, header=FALSE, stringsAsFactors=FALSE)
  df <- sheets[[sheet]]
  dfClean <- function(df){
    nms <- t(df[1,])
    names(df) <- nms
    df <- df[-1,-1] 
    df <- df[df[,1] != "",]   ## only select rows with time stamps
    row.names(df) <- seq(1,nrow(df))
    df
  }
  dfClean(df)
}

install.packages("httr")
library(httr)
readSpreadsheet(u, sheet=1)

install.packages("mosaic")
library(RCurl)
library(mosaic)
mydat2 <- fetchGoogle(paste0("https://docs.google.com/spreadsheets/d/",
                             "14R-883eA8sIpwmbAI7L3MotD54ZFzX9LwtStTtmcRds/export?format=csv"))
mydat2


install.packages("dplyr")
