pollutantmean <- function(directory, pollutant, id = 1:332){
  
  # Initialize vector to collect data from all monitors
  mean_vector = c()
  
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
    
    # Read specified pollutant, existing data of a given monitor
    data = read.csv(file_rel_loc)
    data = data[,pollutant]
    data = data[!is.na(data)]
    
    # Append data to vector
    mean_vector = c(mean_vector, data)
  }
  
  # Calculate mean
  mean(mean_vector)
}