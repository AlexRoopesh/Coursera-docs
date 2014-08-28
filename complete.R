complete <- function(directory, id = 1:332) {
  
  cId <- length(id)
  ncId <- numeric(cId)
  
  cNobs <- length(id)
  ncNobs <- numeric(cNobs)
  
  for(i in seq_along(id)){
    if(id[i]<10){
      file1 <- paste("./data/", directory,"/", "00",id[i],".csv",sep="") 
    } 
    if(id[i]>=10 & id[i]<100){
      file1 <- paste("./data/",directory,"/","0",id[i],".csv",sep="")  
    }
    if(id[i]>=100){
      file1 <- paste("./data/", directory,"/", id[i],".csv",sep="")  
    }
    data1<- read.csv(file1)
    
    ncId[i] <- id[i] 
    cleanData1 <- data1[complete.cases(data1),]
    ncNobs[i] <- nrow(cleanData1)
##    print(ncId[i])
##    print(ncNobs[i])
  }
  id <- ncId
  nobs <- ncNobs
  
  complete.data <- data.frame(id, nobs)
  return(complete.data)
  
}