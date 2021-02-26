## Lab 5 ##
## Natalie Pelton ## 

### Part ONE ### 
# Question 1 
x <- 10 
threshold <- 5 #This is the threshold that we're testing 

if ( x > threshold) { print( "x is bigger than threshold") 
} else { 
  print ("x is not bigger than threshold")}

#10 is bigger than 5 so our if/ else statement worked! The terminal printed out "x is bigger than threshold". 

# Question 2 
datalab05 <- read.csv("ExampleData.csv")
str(datalab05)

DataLab05_Vec <- datalab05$x # Vectorizing the data
length_vec <- 2024 # No magic numbers !

# Question 2a 
threshold_for_question_2 <- 0 
for ( i in (1:length_vec) ) {
  if (DataLab05_Vec [i] < 0) {DataLab05_Vec[i] <- NA}
}

# Question 2b 
Vec_LogicTest_Result <- is.na (DataLab05_Vec)
DataLab05_Vec [Vec_LogicTest_Result] <- NaN
DataLab05_Vec

# Question 2c 
Vec_LogicTest_Result2.0 <-which(is.nan (DataLab05_Vec)) 
DataLab05_Vec [Vec_LogicTest_Result2.0] <- 0
DataLab05_Vec

# Question 2d 
lower_threshold <- 50 #No magic numbers! 
upper_threshold <- 100 #No magic numbers! 

Question2d_Results <- DataLab05_Vec >lower_threshold & DataLab05_Vec < upper_threshold
Question2d_Results
sum(Question2d_Results)

# Question 2e 
FiftyToOneHundred <- DataLab05_Vec [Question2d_Results]
FiftyToOneHundred

# Question 2f 
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# Question 3 
CO2_Data <- read.csv("CO2_data_cut_paste.csv")
str(CO2_Data)

#3a 
Gas_Emissions_Vec <- CO2_Data$Gas

Years_Vec <- CO2_Data$Year

threshold_for_question_3a <- 0 #No magic numbers! 

Gas_above_0 <- Gas_Emissions_Vec > threshold_for_question_3a

Years_Vec [Gas_above_0]

# THE ANSWER TO QUESTION 3A IS 1885

#3b 
Total_Vec <-  CO2_Data$Total

lower_threshold_question_3b <- 200 #No magic numbers! 
upper_threshold_question_3b <- 300 #No magic numbers! 

Total_Between_200_and_300 <- Total_Vec > lower_threshold_question_3b & Total_Vec < upper_threshold_question_3b

Years_Vec [Total_Between_200_and_300]

# THE ANSWER TO QUESTION 3B: The years that the total "Total" emissions were between 200 and 300 million metric tons of carbon were the years: 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, and 1887. 

### Part TWO ### 

totalGenerations <- 1000 #total number of generations we are cacluating data for
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

time <- (1:totalGenerations) #I started with setting t equal to one and then made a vector counting up to the total number of generations (1000).
values_of_prey_over_time <- rep (initPrey, totalGenerations ) #This vector will hold the results of the loop for prey data over the generations. But for now it just repeats the initial number of prey 1000 times (the total number of generations).
values_of_pred_over_time <- rep (initPred, totalGenerations ) #This vector will hold the results of the loop for the predator data over the generations. But for now it just repeats the initial number of predators 1000 times (the total number of generations).

for ( i in (2:totalGenerations) ) {
  values_of_prey_over_time[i] <- values_of_prey_over_time[i-1] + (r * values_of_prey_over_time[i-1]) - (a * values_of_prey_over_time[i-1] * values_of_pred_over_time[i-1])
  values_of_pred_over_time[i] <- values_of_pred_over_time[i-1] + (k * a * values_of_prey_over_time[i-1] * values_of_pred_over_time[i-1]) - (m * values_of_pred_over_time[i-1])
  print(values_of_prey_over_time)
  print(values_of_pred_over_time)
  if ( values_of_prey_over_time[i] < 0 ) {values_of_prey_over_time[i] <- 0}
  if ( values_of_pred_over_time[i] < 0 ) {values_of_pred_over_time[i] <- 0}
}

plot (time,values_of_prey_over_time )
plot (time,values_of_pred_over_time )

#Making a Matrix 
colnames <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
row.names <- time
my_Results <- matrix (nrow = 1000, ncol = 3, dimnames = list(row.names, colnames))
my_Results[,1] <- time 
my_Results[,2] <- values_of_prey_over_time
my_Results[,3] <- values_of_pred_over_time
my_Results
write.csv(x = my_Results, file = "PredPreyResults.csv")
# I used this source to help me make this matrix:
# “R - Matrices.” Tutorials Point , www.tutorialspoint.com/r/r_matrices.htm. 
