corr <- function(directory, threshold = 0) {
  
 # id <-332
#  datac <- vector()
  cr <- c()
  for(i in 1:332){
    #print(i)
    if(i<10){
      file1 <- paste("./data/", directory,"/", "00",i,".csv",sep="") 
    } 
    if(i>=10 & i<100){
      file1 <- paste("./data/",directory,"/","0",i,".csv",sep="")  
    }
    if(i>=100){
      file1 <- paste("./data/", directory,"/", i,".csv",sep="")  
    }
    ##print(file1)
   # print(i)
    datac <- read.csv(file1)
    ##s1<-summary(datac)
    ##print(s1)
    ##lsum <- length(s1)
    ##print(lsum)
    cleanData <- datac[complete.cases(datac),]
  ##  print(cleanData) 
      nrows <-nrow(cleanData)
    ##  print(nrows)
    if(nrows>threshold)
    cr[i] <- cor(cleanData$sulfate, cleanData$nitrate)
 ##   print(cr[i])
  ##  print(i)
  }
 ## crl<- length(cr)
##  aa <- paste(crl,"hm")
##  print(aa)
##  print(cr[2])
 return(cr)
  
}