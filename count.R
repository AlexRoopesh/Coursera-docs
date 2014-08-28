count <- function(cause = NULL) {
  ## Check that "cause" is non-NULL; else throw error
  ##print(cause)
  ##print(!is.null(cause))
  if(is.null(cause)){
      stop("Cause cannot be NULL")
      }
  ##print(cause)
  ## Check that specific "cause" is allowed; else throw error
  
  l1 <- c("asphyxiation", "blunt force","other" , "shooting" , "stabbing", "unknown")
  len <- as.numeric(length(grep(cause, l1, ignore.case = TRUE)))
  ##print(len)
   if (len <= 0){
    stop("Not a valid cause")
   }
  ## Read "homicides.txt" data file
  homicides <- readLines("homicides.txt")
  ## Extract causes of death
  len1 <- as.numeric(0)
  lcause <- tolower(cause)
    if(lcause == "shooting"){
    ##  print(lcause)
     ## grep("Cause: [Ss]hooting", homicides)
      len1 <- as.numeric(length(grep("Cause: [Ss]hooting",homicides)))
 ##    print(len1)
 ##   print(length(grep("Cause: [Ss]hooting",homicides)))
 ##  return(len1)
    }

  if(lcause == "asphyxiation"){
    ##  print(lcause)
   ## grep("Cause: [Aa]sphyxiation", homicides)
    len1 <- as.numeric(length(grep("Cause: [Aa]sphyxiation",homicides)))
      }
  if(lcause == "blunt force"){
    ##  print(lcause)
    ##grep("Cause: [Ss]hooting", homicides)
    len1 <- as.numeric(length(grep("Cause: [Bb]lunt [Ff]orces",homicides)))
  }
  if(lcause == "stabbing"){
    ##  print(lcause)
   ## grep("Cause: [Ss]hooting", homicides)
    len1 <- as.numeric(length(grep("Cause: [Ss]tabbing",homicides)))
  }
  if(lcause == "other"){
    ##  print(lcause)
  ##  grep("Cause: [Ss]hooting", homicides)
    len1 <- as.numeric(length(grep("Cause: [Oo]ther",homicides)))
  }
  if(lcause == "unknown"){
    ##  print(lcause)
    ##grep("Cause: [Ss]hooting", homicides)
    len1 <- as.numeric(length(grep("Cause: [Un]known",homicides)))
  }
  ## Return integer containing count of homicides for that cause
  return(len1)
}