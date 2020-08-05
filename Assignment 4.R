best <- function(state, outcome) {
 ## Read outcome data, looking at state and outcome
  
  outcomestats <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  ## Key Variables
  ## Hospital.NAme
  ## State

   ## Check that state and outcome are valid
  
      statefound<- grep(state, outcomestats$State)
      if (length(statefound) == 0) {
      stop("invalid state")
      }
  
      
      validoutcomes <- c("heart attack", "heart failure", "pneumonia")
      outcomefound <- grep(outcome, validoutcomes)
      if (length(outcomefound) == 0){
      stop("invalid outcome")
            }
  
        ## Return hospital name in that state with lowest 30-day death rate
  
      StateHospitals <- subset(outcomestats, State == state)
      print(StateHospitals$Hospital.Name)      
 
      
      if (outcome == "heart attack") {
        print("we looking at heart attacks")
        
        ## clean out Not Available
        NA <- (StateHospitals[,11] = "Not Available")        
        HospitalswithStats <- StateHospitals[!NA,]
        print(HospitalswithStats[,11])
        
        
##        filtered <- filter(StateHospitals$Hospital 30-Day Death (Mortality) Rates from Heart Attack <>"Not Available"
        
        
        #### StatewithAttack <- StateHospitals[order(StateHospitals[,11], decreasing = TRUE),]
        
##        print(StatewithAttack$Hospital.Name)
  ##      print(StateHospitals[,11])
        
      } else if (outcome == "heart failure") {
        print("we looking at heart failures")
        
      } else {
        print("pneumonia")
        
        
      }
           
      
      ## Create a matrix with state and outcome equal to inputs, with the hospital 
      ## name and 30 - day death rate
  
      ## Field 11 is for heart attack, 17 is Heart Failure, 23 for pneumonia
      ## sort on death rate and print top row
  
  
}