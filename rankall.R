rankall <- function(outcome, num = "best") {
  ## Read outcome data
  readFile = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  State = readFile[, "State"]
  Hospital.Name = readFile[, "Hospital.Name"]
  
  readFile[, 11] = as.numeric(readFile[, 11])
  Heart.Attack = readFile[, 11]
  
  readFile[, 17] = as.numeric(readFile[, 17])
  Heart.Failure = readFile[, 17]
  
  readFile[, 23] = as.numeric(readFile[, 23])
  Pneumonia = readFile[, 23]
  
  my.data = data.frame(State, Heart.Attack, Heart.Failure, Pneumonia, Hospital.Name)
  
  ## Check that state and outcome are valid
  
  ## For each state, find the hospital of the given rank
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  if(outcome == "heart attack"){
    sorted.my.data = my.data[order(State, Heart.Attack, Hospital.Name), ]
    ## sorted.my.data = sorted.my.data[order(sorted.my.data$Heart.Attack, na.last = NA), ]
    
  }else if(outcome == "heart failure"){
    my.data$Heart.Attack <- NULL
    sorted.my.data = my.data[order(State, Heart.Failure, Hospital.Name), ]
    
  }else if(outcome == "pneumonia"){
    my.data$Heart.Attack <- NULL
    my.data$Heart.Failure <- NULL
    sorted.my.data = my.data[order(State, Pneumonia, Hospital.Name), ]
  } else {
    stop("invalid outcome")
  }
  
  sorted.my.data = sorted.my.data[complete.cases(sorted.my.data), ]
  
  split.data = split(sorted.my.data, sorted.my.data$State)
  
  hospital = rep(NA, 54)
  state = rep(NA, 54)
  
  for(i in 1:54){
    state[i] = as.character(split.data[[i]][1, 1])
  }
  
  if(num == "best"){
    for(i in 1:54){
      hospital[i] = as.character(split.data[[i]][1, "Hospital.Name"])
    }        
  } else if(num == "worst"){
    for(i in 1:54){                
      worstRow = max(split.data[[i]][ , 2])
      worstHospital = as.character(split.data[[i]][which(split.data[[i]][ , 2] == worstRow), "Hospital.Name"])
      hospital[i] = worstHospital
    }
  } else {
    num = as.integer(num)
    for(i in 1:54){
      if(typeof(num) == "integer" && nrow(split.data[[i]]) >= num){
        hospital[i] = as.character(split.data[[i]][num, "Hospital.Name"])
      } else {
        NA
      }
    }
  }
  rankall.data = data.frame(hospital, state)
  return(rankall.data)
  
}