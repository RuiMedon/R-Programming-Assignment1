corr <- function(directory, threshold = 0){
  
  # Source function that reads a directory full of files and reports the number of completely observed cases in each data file.
  source("complete.R")
  
  # Create data frame with number of complete observations across all monitors
  df = complete(directory)
  
  # Ceate vecotr variable with ids of monitors with a number fo cokplete observations above the threshold
  id = df$ids[df$nobs > threshold]
  
  # Initialize correlations vector
  corr_vec = c()
  
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
    
    # Calculate correlation between sulfate and nitrate for each monitor
    corr = cor(data$sulfate, data$nitrate)
    
    # Add correlation between sulfate and nitrate for each monitor to correlations vector
    corr_vec = c(corr_vec, corr)
  }
  
  # Print correlation vector (as empty numeric vector if null)
  if (is.null(corr_vec)){
    corr_vec = numeric()
  }else{
    corr_vec
  }
}