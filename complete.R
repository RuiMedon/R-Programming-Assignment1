complete <- function(directory, id = 1:332){
  
  df = data.frame(ids = id, nobs = NA)
  
  # Initialize loop to cycle through each monitor file
  for (i in id){
    
    # Create string variable with file name of a given monitor
    if (i < 10){
      file = paste("00",i,".csv",sep = "")
    }else if(i < 100){
      file = paste("0",i,".csv",sep = "")
    }else{
      file = paste(i,".csv",sep = "")
    }
    
    # Create string variable with location of a given monitor data file
    file_rel_loc <- paste("./",directory,"/",file,sep="")
    
    # Read data
    data = read.csv(file_rel_loc)
    
    # Remove rows with at least one pollutant NA
    data = data[!is.na(data$sulfate),]
    data = data[!is.na(data$nitrate),]
    
    # Calculate number of complete observations and add to data frame in respective monitor's row
    df$nobs[df$ids == i] = nrow(data)
  }
  
  # Print data frame
  df
}