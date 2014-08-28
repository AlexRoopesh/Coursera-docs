  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
  ##local({
  ##  checkSanity <- function() {
  ##    if(is.na(id))
  ##      stop("id is not numeric, character or integer")
  ##    if(!is.character(directory)
  ##      stop("directory is not valid")
  ##        }     
  ##  )
    getmonitor <- function(id, directory, summarize = FALSE) {
      
  ##   setwd(directory)
  ##    if(is.numeric(id))
  ##    { ##    }
  ##     data <- getmonitor(1, "specdata")
       id1 <- as.numeric(id)

        if(id1<10){
        file1 <- paste("./data/", directory,"/", "00",id1,".csv",sep="") 
        } 
        if(id1>=10 & id1<100){
          file1 <- paste("./data/",directory,"/","0",id1,".csv",sep="")  
          }
        if(id1>=100){
          file1 <- paste("./data/", directory,"/", id1,".csv",sep="")  
        }
      data1<- read.csv(file1)
    
##      print(idin)
##      print(file1)
##      print(head(data1))
##      print(summarize)  
    
      if (summarize) {
        summary(data1)
        return(data1)
      } else {
        head(data1)
        return(data1)
      }
       
}