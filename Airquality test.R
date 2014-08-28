## Airquality
## pm0 <- read.table("./data/RD_501_88101_1999-0.txt", comment.char="#",header=FALSE, sep="|", na.strings="")
## cnames <- readLines("./data/RD_501_88101_1999-0.txt", 1)
## cnames <- strsplit(cnames, "|", fixed=TRUE)
## names(pm0) <- cnames[[1]]
## names(pm0) <- make.names(cnames[[1]])
## pm1 <- read.table("./data/RD_501_88101_2012-0.txt", comment.char="#",header=FALSE, sep="|", na.strings="")
## cnames <- strsplit(cnames, "|", fixed=TRUE)
##  names(pm1) <- cnames[[1]]
## names(pm1) <- make.names(cnames[[1]])
