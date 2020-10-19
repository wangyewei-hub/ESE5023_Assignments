#3  从CSDN获取可以用矩阵求解的信息
Pascal_triangle<-function(k){
a = matrix(0, nrow = k, ncol = k)
a[, 1] = 1

for (i in 1:k) {
  a[i,i]=1
}
if(k==1){a[k,]=1}
else if (k==2){a[k,]=1}
 else{for (i in 3:k) {
  for (j in 2:(i - 1)) {
    a[i, j] = a[i - 1, j] + a[i - 1, j - 1]
     }
   }
 }
return(a[k,])
}
# it is good to refer to some excellent works from others, through Internet or whatever approaches
# basically you should understand it instead of only use it
# if you don`t want to explain it with you code, you should write down your understandings in your report
