#4
Least_moves<-function(k){
  i<-0
  while(k!=1){
    if(as.integer(k/2)==k/2){
      k<-k/2
      i<-i+1
    }
    else{
      k<-k-1
      i<-i+1 
    }
  }
  print(i) 
}
# good work
