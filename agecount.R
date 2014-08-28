agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if(is.null(age)){
    stop("Age cannot be NULL")
  }
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  
  ## Extract ages of victims; ignore records where no age is
  ## given
  ##len1 <- as.numeric(length(grep("Age: ",homicides)))
  ##i <- grep(paste("Age: ",age,"year",sep=""), homicides)
  i <- grep(paste("Age: ",age," year",sep=""), homicides)
  j<-  grep(paste("male, ",age," year",sep=""), homicides)

  ##print(length(i))
  r1 <- regexpr("Age: (.*?)year", homicides[i])
   rm1 <- regmatches(homicides[i],r1)
  c1<-length(rm1)
  
  r2 <- regexpr("male, (.*?)year", homicides[j])
  rm2 <- regmatches(homicides[j],r2)
  c2<-length(rm2)
  c3 <- c1 + c2
  ##print(c1)
  ##print(c2)
  ##print(c3)
    ## Return integer containing count of homicides for that age
  return(c3)
}