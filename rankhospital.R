rankhospital <- function(state, outcome, num = "best") {
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
  
  my.data = data.frame(Heart.Attack, Heart.Failure, Pneumonia, State, Hospital.Name)
  
  
  bool.state = my.data[, "State"] == state
  state.data = my.data[bool.state, ]
  state.data = na.omit(state.data)
  
  ## Check that state and outcome are valid
  if(nrow(state.data) == 0){
    stop("Invalid state")
  }
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if(outcome == "heart attack"){
    ranked.state.data = state.data[ do.call(order, state.data), ]
    
    
  }else if(outcome == "heart failure"){
    state.data$Heart.Attack <- NULL
    ranked.state.data = state.data[ do.call(order, state.data), ]
    
  }else if(outcome == "pneumonia"){
    state.data$Heart.Attack <- NULL
    state.data$Heart.Failure <- NULL
    ranked.state.data = state.data[ do.call(order, state.data), ]
    
  } else {
    stop("Invalid outcome")
  }
  ##print(num)
  ##print("hmm")
  if(num == "best"){
  ##  print(num)
    rankedHospital = ranked.state.data[1, "Hospital.Name"]
  } else if(num == "worst"){
    worstRow = max(ranked.state.data[, 1])
    rankedHospital = ranked.state.data[which(ranked.state.data[,1] == worstRow), "Hospital.Name"]
  } else {
    num = as.integer(num)
    if(typeof(num) == "integer" && nrow(ranked.state.data) >= num){
      rankedHospital = ranked.state.data[num, "Hospital.Name"]
    } else {
      return(NA)
    }
  }
  
  rankedHospital = as.character(rankedHospital)
  return(rankedHospital[1])
}