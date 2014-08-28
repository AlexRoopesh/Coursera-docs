best <- function(state, outcome) {
  ## Read outcome data
  readFile = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  State = readFile[, "State"]
  Hospital.Name = readFile[, "Hospital.Name"]
  Heart.Attack = readFile[, 11]
  Heart.Failure = readFile[, 17]
  Pneumonia = readFile[, 23]
   mm <- c()  
  my.data = data.frame(Heart.Attack, Heart.Failure, Pneumonia, State, Hospital.Name)
  ##print(state)
  
  bool.state = my.data[, "State"] == state
  ##print(summary(bool.state))
  state.data = my.data[bool.state, ]
  ##print(summary(state.data))
  ##state.data = na.omit(state.data)
  state.data = subset(state.data, Heart.Attack != "Not Available")
  state.data = subset(state.data, Heart.Failure != "Not Available")
  state.data = subset(state.data, Pneumonia != "Not Available")
  ##print(summary(state.data))
  ##sorted.best.data = state.data[order(Heart.Attack, Heart.Failure, Pneumonia, State, Hospital.Name), ]
  
  ## Check that state and outcome are valid
  if(nrow(state.data) == 0){
    stop("Invalid state")
  }
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  minRate = as.numeric(0)
  if(outcome == "heart attack"){
    minRate = min(as.numeric(state.data[,1]))
    #print(minRate)
    minHospital = state.data[which(as.numeric(state.data[,1]) == minRate), "Hospital.Name"]
    ##x <- table(state.data[,1] == minRate)
    ##y <-  x[names(x)==TRUE]
    ##print(y)
    ##if (y[1] >= 1){ 
    ##  state.data = subset(state.data, as.numeric(state.data[,1]) == minRate) 
    ##  ordered.data = state.data[order(Hospital.Name)]
    ##  print(ordered.data$Hospital.Name[1])
  ##  }
       
  }else if(outcome == "heart failure"){
    minRate = min(as.numeric(state.data[,2]))
    minHospital = state.data[which(as.numeric(state.data[,2]) == minRate), "Hospital.Name"]
    
  }else if(outcome == "pneumonia"){
    c <- as.character((state.data[,3]))
    minRate = min(as.numeric(c))
    minHospital = state.data[which(as.numeric(as.character((state.data[,3]))) == minRate), "Hospital.Name"]
   ## print(minHospital)
   return(as.character(minHospital))
   ## print(mm[1])
    ##return(mm[1])
    
  } else {
    stop("Invalid outcome")
  }
  #print("outside")
#print(minRate)
 # x <- table(state.data[,1] == minRate)
#  print(x)
 # print("alex")
#  y <-  x[names(x)==TRUE]
 # print(y)
#  if (y[1] >= 1){ 
 #   state.data = subset(state.data, as.numeric(state.data[,1]) == minRate) 
  #  ordered.data = state.data[order(Hospital.Name)]
  #}
 
  ##print("ha")
  ##  print(ordered.data$Hospital.Name[1])
 ##mm[] <- as.character(minHospital)
  ##return(mm[1])
  
}