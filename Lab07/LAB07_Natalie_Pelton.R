## Natalie Pelton ##
## Lab 07 ## 

# PROBLEM 1 # 
# base is the base of the triangle 
# height is the height of the triangle 
Triangle_Area <- function( base, height ) {
  Area <- 0.5 * base * height 
  return ( Area )
}

# Test to see if the function works for a triangle with base 10 and height 9 
Triangle_Area( 10, 9 ) # answer is 45

# PROBLEM 2 # 
#Part 2a

# I chose the variable name "number" for the number we are trying to get the absolute value of for this problem
myAbs_Part2a <- function (number) {
  absvalue <- if (number < 0) { number * -1} 
  else {number * 1 }
  return (absvalue )
}

#Test to see if the function works for 5 and -2.3 
myAbs_Part2a (5) # answer is 5 
myAbs_Part2a (-2.3) #answer is 2.3 

#Part 2b 
#For this part, we are working with a vector so to make things easier, I didn't want to use an if statement. 
# Again, I chose the variable name "number" for the number we are trying to get the absolute value of m

myAbs_Part2b <- function (number) {
  absvalue <- sqrt((number )^2)  
  return(absvalue)
}

#I'm going to use this vector to make sure my function works 
vector_for_prob_2 <- c(1.1, 2, 0, -4.3, 9, -12)

myAbs_Part2b (vector_for_prob_2) # answer is: 1.1  2.0  0.0  4.3  9.0 12.0


# PROBLEM 3 # 
# Fibonacci sequence 
# n is how many numbers of the Fibonacci sequence are shown 
# s is the starting point 

Fibonacci <- function ( n, s ) {
  data_for_fib <- rep( s, n )
  data_for_fib[2] <- 1
  for ( i in 3:n ) {
    data_for_fib[i]  <- (data_for_fib[i-1]) + (data_for_fib[i-2])
  }
  return (data_for_fib)
}

# Check to make sure my function worked 
Fibonacci(7, 1) #answer is 1  1  2  3  5  8 13
Fibonacci(7, 0) #answer is 0 1 1 2 3 5 8

# PROBLEM 4 # 
# Part 4a 

#For this problem, I labeled the variables that are being added together and squared as x and y 
Part_4a_Equation <- function(x, y) {
  answer_prob_4a <- (x - y) ^ 2
  return(answer_prob_4a)
}

#Check to see if my function worked 
Part_4a_Equation (3, 5) #answer is 4

Part_4a_Equation (c(2, 4, 6), 4) #answer is 4 0 4 

# Part 4b 
# for this problem, I created a "mean" function by dividing the sum of "x" by the length of "x"
Part_4b_Equation <- function(x) {
  answer_prob_4b <- ( sum ( x ) ) / (length ( x ) )
  return(answer_prob_4b)
}
#Check to see if my function worked 
Part_4b_Equation(c(5, 15, 10)) #answer is 10 

#Importing data 
Data_for_lab_07 <- read.csv ( "DataForLab07.csv" )
#Vectorizing data 
Vec_data_for_part4 <- Data_for_lab_07$x
#Checking to see if my function worked on the large data set 
Part_4b_Equation(Vec_data_for_part4) #answer is 108.9457

# Part 4c 
#Combining the two prior functions in part 4 to make a "sum of squares function"
Part_4c_Equation <- function(x) { 
  mean_prob4c <- ( sum ( x ) ) / (length ( x ) )
  answer_4c <- sum ( (x - mean_prob4c) ^ 2 )
  return(answer_4c)
}

#Check to see if my sum of squares function worked 
Part_4c_Equation(Vec_data_for_part4) #answer is 179442.4

# Source used to help understand the 'sum of squares' functional notation : 
# Eddelbuettel, Dirk. “Calculating Sum of Squared Deviations in R.” Stack Overflow, 27 Jan. 2014, stackoverflow.com/questions/21385377/calculating-sum-of-squared-deviations-in-r. 



