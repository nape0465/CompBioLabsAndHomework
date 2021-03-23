## Natalie Pelton ## 
## Lab 09 ## 

# Preliminary Step: import the camera trap data file

camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# Problem 1

# Lets start out by using a smaller vector to explore changing the dates. 

smallVec <- camData$DateTime[1:5]
smallVec
mydate_smallvec <- strptime ( '19/09/2013:16:29',format='%d/%m/%Y:%H:%M')
mydate_smallvec

length<- length (smallVec) 
 
for ( i in 1:length ) {
  smallVec [i] <-  strptime ( smallVec ,format='%d/%m/%Y:%H:%M')
  print (smallVec)
}

### I kind of came to a stand still here after trying to make a for loop to rewrite the dates in "smallVec". I didn't know what to plug into the "x" column of the "strptime" function in the for loop though and got really stuck.

### Then I found a page online and realized maybe I dont need to make a for loop. So I tried this: 
smallVec2.0 <- camData$DateTime[1:5]
smallVec2.0

my_clean_small_vec <- strptime ( my_clean_small_vec ,format='%d/%m/%Y:%H:%M')
my_clean_small_vec

# And I have no idea why this just spit out NAs. :(
# This was the page I used to get information on date formats:
# Gorman, Ben. “Dates and Times in R Without Losing Your Sanity.” GormAnalysis, 27 Apr. 2018, www.gormanalysis.com/blog/dates-and-times-in-r-without-losing-your-sanity/. 

### I think the problem I am having is that there is a space in the dates? For example one of the dates in my "smallVec" is "19/09/2013 16:29" so there is a space between the day and the time. 
### This could be why the for-loop is giving back the error message "number of items to replace is not a multiple of replacement length"
### Ok I am going to try to get rid of the space between the day and time. 

smallVec3.0 <- camData$DateTime[1:5]
smallVec3.0

Trimmed_Small_Vec <- c( "19/09/2013:16:29", "19/09/2013:20:36", "20/09/2013:01:26" , "20/09/2013:08:48","20/09/2013:09:54" )
Trimmed_Small_Vec

Please_Work <- strptime( Trimmed_Small_Vec ,format='%d/%m/%Y:%H:%M')
Please_Work

# OK!! SO THAT FINALLY WORKED. The only problem is, I went in and manually deleted the spaces. So I need to find a piece of code that does that for me when I go tackle the big data set. 


