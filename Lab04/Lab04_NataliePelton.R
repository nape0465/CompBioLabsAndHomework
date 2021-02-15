##Natalie Pelton Lab 04##

#### Question 1 ####
for ( hi in 1:10 ){
  print ("hi")}
# For this one I named the variable "hi" and then told R to print it 10 times.

#### Question 2 ####
piggybank <- 10 # dollars 
allowance <- 5 # dollars per week 
gumCost <- 2 * 1.34 # cost of 2 packs of gum per week 
weeks <- 8 

for ( i in 1:weeks ) {
  piggybank <- piggybank + allowance - gumCost
  print (piggybank)
}
# This one we named a couple of variables: piggybank, allowance, gumCost, and weeks, and then plugged these variables into our equation and ran then loop.

#### Question 3 ####
population <- 2000
popdecrease <- 0.05
years <- 7 

for ( i in 1:years ) {
  population <- population - ( population * popdecrease )
  print (population)
}
# This one was similar to question number 2 

#### Question 4 ####
n <- 2500 # population at time t 
K <- 10000 # environmental carrying capacity
r <- 0.8 # intrinsic growth rate
t <- 12 #time

for (i in 1:t) {
  n <- n + ( r * n * (K - n)/K )
  print (n)
}

#### Question 5 ####
#5a
data_for_Q5a <- rep( 0, 18 )
#vector using a rep command

#5b
for ( i in seq(1,18) ) { data_for_Q5a[i] <- i * 3
}

print (data_for_Q5a) 
#For this problem, I used a for loop and saved the results in the vector I created in problem 5a

#5c
data_for_Q5c <- rep ( 0, 18 )
data_for_Q5c[1] <- 1
data_for_Q5c

#For this problem, I made another vector using a rep command but edited the first number in the sequence

#5d 
for ( i in seq( 2,18 ) ) { 
  data_for_Q5c[i]  <- 1 + (2 * (data_for_Q5c[i-1]))
  }

print (data_for_Q5c)

#For this one, I had to start in the second number in my sequence which is why the for loop says seq (2,18) and then made a for loop based and saved it as the vector made in question 5c


#### Question 6 ####
data_for_Q6 <- rep( 0, 18 )
data_for_Q6[2] <- 1
data_for_Q6

for ( i in seq( 3,20 ) ){
  data_for_Q6[i]  <- (data_for_Q6[i-1]) + (data_for_Q6[i-2])
}

print (data_for_Q6)

#This problem was interesting because I had to start the for loop on the third number in the sequence since it uses data from (i-1) and (i-2). So I started my for loop by saying seq ( 3,20 ). Then I saved the results from my loop as the vector "data_for_Q6" 

#### Question 7 ####

n <- 2500 # population at time t 
K <- 10000 # environmental carrying capacity
r <- 0.8 
t <- 12 

abundance <- rep(n,t)
abundance

for (i in 2:t) {
  abundance[i] <- abundance[i-1] + ( r * abundance[i-1] * (K - abundance[i-1])/K )
  print (abundance)
}

time <- c(1:12)

plot (time, abundance)

#Ok, last one! For this one I started with the second term in the sequence, using the function (i in 2:t) because the loop data is dependant on the number that comes BEFORE it. So in order for this loop to run correctly I made my first value n (2500) because it is the original population size. Then I saved the vector values as "abundance" so I can plot time x abundance on the scatter plot


