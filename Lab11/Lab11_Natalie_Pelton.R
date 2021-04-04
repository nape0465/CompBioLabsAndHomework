### Lab 11 ### 
### Natalie Pelton ### 
### 04/02/2020 ### 

## Part I: Getting set up to work with the data ##

install.packages("tidyverse")
Global_Wood_Data <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
View(Global_Wood_Data)

## Part II: Working with density data

Wood_density <- Global_Wood_Data$Wood.density..g.cm.3...oven.dry.mass.fresh.volume
The_NA_row <-is.na(Wood_density)
which(The_NA_row)

# 4a - Row 12150 is where the NA is. 

# 4b - here is the code to remove the NA row 
bad_row <-which(The_NA_row)
Edited_Global_Data <- Global_Wood_Data[ -bad_row, ]

# 5 - Dealing with one kind of pseudo-replication

#### Ok, I finally got this to work! This took me a while to figure out how using "dplyr" works, but in the end, its pretty doable. I think I got tripped up because in the pre recorded lectures, there were a bunch of examples where underneath the "group_by" there was the n() function, so I thought that we could only use a frequency (n()) function. But after playing around with it, rewatching the lectures, and looking at example scripts, I finally got it!!   
Unique_Binomals <- unique(Edited_Global_Data$Binomial)
Unique_Binomals

require("dplyr")
Binomal_Counts <- summarise ( group_by( Edited_Global_Data, Binomial, Family ), 
                              Mean_Wood_Density = mean ( Wood.density..g.cm.3...oven.dry.mass.fresh.volume ), 
                              .groups = "drop")

Binomal_Counts

### Lines 36 - 48 show some of my thinking when I was trying to figure out how to solve problem 5 
########################################################
Group_by_Bionomal<- summarise (group_by ( Edited_Global_Data, Binomial, Family, Wood.density..g.cm.3...oven.dry.mass.fresh.volume ) , 
                          TotalCount = n() ,
                          .groups = "drop") 
     
Group_by_Bionomal 

Mean_Density <- summarise( group_by (Group_by_species, Family, Wood.density..g.cm.3...oven.dry.mass.fresh.volume), 
                         meanCount = mean ( Wood.density..g.cm.3...oven.dry.mass.fresh.volume),
                         .groups = "drop" )

Mean_Density
########################################################

# 6 - Contrasting most and least dense families
#6a 
require("dplyr")
Family_Counts <- summarise ( group_by( Edited_Global_Data, Family ), 
                              Mean_Wood_Density = mean ( Wood.density..g.cm.3...oven.dry.mass.fresh.volume ), 
                              .groups = "drop")
Family_Counts

#6b
Family_Counts_Arranged <- arrange( Family_Counts, desc (Mean_Wood_Density) )
Family_Counts_Arranged

#6c 

# The 8 families with the highest average densities are: Hypericaceae, Zygophyllaceae, Irvingiaceae, Sarcolaenaceae, Surianaceae, Linaceae, Bonnetiaceae, and Quiinaceae.  
# The 8 families with the lowest average densities are: Tetramelaceae, Datiscaceae, Muntingiaceae, Bixaceae, Hernandiaceae, Moringaceae, Paulowniaceae, and Caricaceae 

## Part III: Plotting

library("ggplot2")
require("ggplot2")



