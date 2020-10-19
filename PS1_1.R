Print_values<-function(a ,b, c){
     if (a > b) { 
           if(b>c){
                print(c(a,b,c) )
           } else {if(a>c){
                  print(c(a,c,b))
                   } else {
                    print(c(c,a,b))
                   }
           }
     } else {if(b>c){
              print("False")
    # some thing wrong here
    # if you put in a vector of (3,4,1), the output result must be (4,3,1), instead of "FALSE"  
    #   ！！！！which of you copied the other between you and Liu Yiwen?
             } else {
                print(c(c,b,a) )
              }
             }
     }
    
    
   
