#### Lab 08  ####
### Natalie Pelton ### 
### 03/15/2020 ### 

# Question 3, part a- c


Logistic_Growth_Model_Plot <- function ( r, K, t, n ) {
# r is the intrinsic growth rate 
# K is the carrying capacity 
# t is the total number of generations
# n is the initial population size

abundance <- rep ( n , t )

for (i in 2:t) {
  abundance[i] <- abundance[i-1] + ( r * abundance[i-1] * (K - abundance[i-1])/K )
}

time <- c (1:t)

plot (time, abundance)


return(plot) 
}

# Question 3, part d 
Logistic_Growth_Model_Plot (0.5, 1000, 12, 100 )

# Question 3, part e 
Logistic_Growth_Model_Matrix<- function ( r, K, t, n ) {
  # r is the intrinsic growth rate 
  # K is the carrying capacity 
  # t is the total number of generations
  # n is the initial population size
  
  abundance <- rep ( n , t )
  
  for (i in 2:t) {
    abundance[i] <- abundance[i-1] + ( r * abundance[i-1] * (K - abundance[i-1])/K )
  }
  
  time <- c (1:t)

  matrix_of_results <- cbind ( time, abundance )
  
  return(matrix_of_results)
}

results <- Logistic_Growth_Model_Matrix (0.5, 1000, 12, 10 )
colnames(results) <- c("time", "abundance")
write.csv(x = results, file = "IntrinsicGrowth.csv", row.names = FALSE)

## For problem 3e I used the class GitHub page for help, as cited below
## Flaxmans.“Flaxmans/CompBio_on_git.” GitHub, 12 Mar. 2019, github.com/flaxmans/CompBio_on_git/blob/main/Labs/Lab08/ExampleScript.R. 




