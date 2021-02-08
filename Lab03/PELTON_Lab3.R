### Natalie Pelton ###
# Ebio 4420 

# Lab step 3- since there are 5 bags of chips I set the variable "chips" to the numerical value, 5. And since there are 8 people coming, I set the variable "guests" to the numerical value 8.#  #
chips <- 5 
guests <- 8 

# Lab step 5 - I kind of have a long name for this variable, but since the instructions say that each guest will eat 0.4 bags of chips, I set this variable to the numerical value 0.4.
bags_of_chips_eaten_per_guest <- 0.4

# Lab step 7 - To write this code, took the amount of people at the party (doing guests + 1 to include myself), multiplied that by "bags_of_chips_eaten_per_guest", and then subtracted that value from the initial number of chips. 
leftover_chips <- chips - ((guests + 1 ) * bags_of_chips_eaten_per_guest)

### PART 2 ###

#Step 8
Self <- c(7, 9, 8, 1, 2, 3, 4, 6, 5)
Penny <- c(5, 9, 8, 3, 1, 2, 4, 7, 6)
Lenny <- c(6, 5, 4, 9, 8, 7, 3, 2, 1)
Stewie <- c(1, 9, 5, 6, 8, 7, 2, 3, 4)

#Step 9 
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#Step 10- To write this section of code, I concatenated the data using the "cbind()" command and then viewd the data using the view command to make sure it worked 
All_The_Rankings_via_cbind <- cbind(Self, Penny, Lenny, Stewie)
All_The_Rankings_via_cbind
View (All_The_Rankings_via_cbind)

#Step 11- For the result of str(PennyIV), I only got one number, 3. As for the result of str(Penny), I received a numerical list that included integers 1-9. Finally, for the result of str(All_The_Rankings), this one was a little harder to understand using the str() command than the other 2. It did also say that it includes lists of integers between 1-9 and had columns labeled "Self", "Penny", "Lenny", and "Stewie". 
str(PennyIV)
str(Penny)
str(All_The_Rankings_via_cbind)

#Step 12
All_The_Rankings_via_data.frame <- data.frame(Self, Penny, Lenny, Stewie)
All_The_Rankings_via_data.frame
as.data.frame(Self, Penny, Lenny, Stewie)

#Step 13
dim(All_The_Rankings_via_cbind)
dim(All_The_Rankings_via_data.frame)

str(All_The_Rankings_via_cbind)
str(All_The_Rankings_via_data.frame)
# There are a few notable similarities and differences between the cbind() function used in step 10 and the data.frame() function used in step 12. First of all, using the dim function on both the cbind() results and the data.frame() results, gives me the same information- it shows there are 4 columns and 9 rows of data. When I used the str() function on the datasets though, they looked very different. The data.frame function listed out all the rankings in order by the name of the person (either Self, Penny, Lenny, or Stewie) right in the console. The cbind function did not list the data in the console and instead listed more of the layout of the data and the column names without giving the person's individual movie ranking.

#Step 14- I labeled this vector "Episode_names_as_romans" so I don't get it mixed up:) 
Episode_names_as_romans <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX")

#Step 15
.rowNamesDF(All_The_Rankings_via_data.frame, make.names=FALSE) <- Episode_names_as_romans
All_The_Rankings_via_data.frame

row.names(All_The_Rankings_via_cbind) <- Episode_names_as_romans
All_The_Rankings_via_cbind

#Step 16 
All_The_Rankings_via_cbind [3,]

#Step 17
All_The_Rankings_via_data.frame [,4]

#Step 18
All_The_Rankings_via_data.frame [5,1]

#Step 19 
All_The_Rankings_via_data.frame [2,2]

#Step 20 
All_The_Rankings_via_data.frame [c(4:6),]

#Step 21 
All_The_Rankings_via_data.frame [c(2, 5, 7),]

#Step 22
All_The_Rankings_via_data.frame[c(4, 6), c(2,4)]

#Step 23
Lenny_Rankings <- All_The_Rankings_via_data.frame[,3]
Lenny_Rankings <- replace(Lenny_Rankings, c(2,5), c(8,5))
Lenny_Rankings

All_The_Rankings_via_data.frame[,3] <- Lenny_Rankings
All_The_Rankings_via_data.frame

#Step 24 
All_The_Rankings_via_cbind["III", "Penny"]
All_The_Rankings_via_data.frame ["III", "Penny"]

#Step 25 
Bring_Back_Lenny <- All_The_Rankings_via_data.frame [, "Lenny"]
Bring_Back_Lenny <- replace(Bring_Back_Lenny, c(2,5), c(5,8))
Bring_Back_Lenny

All_The_Rankings_via_data.frame[, "Lenny"] <-Bring_Back_Lenny
All_The_Rankings_via_data.frame



