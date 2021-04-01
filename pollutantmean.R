pollutantmean <- function(directory, pollutant, id = 1:332){
  
  mean_vector = c()
  
  for (i in id){
    
    if (i < 10){
      file = paste("00",i,".csv",sep = "")
    }else if(i < 100){
      file = paste("0",i,".csv",sep = "")
    }else{
      file = paste(i,".csv",sep = "")
    }
    
    file_rel_loc <- paste("./",directory,"/",file,sep="")
    data = read.csv(file_rel_loc)
    data = data[,pollutant]
    data = data[!is.na(data)]
    
    mean_vector = c(mean_vector, data)
  }
  
  mean(mean_vector)
}