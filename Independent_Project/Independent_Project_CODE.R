### Natalie Pelton 
### Independent Project step 2 

#### Step 1 - Import the dataset ####
library(readxl)
snail_data <- read_excel("Desktop/Spring_2021/Ebio4420/CompBioLabsAndHomework/Independent_Project/Data/snail_data.xls")

#### Step 2 - Clean the Dataset ####

# First, I'll do the pH 

require("dplyr")
require("tidyr")

Group_By_pH <- summarise ( group_by ( snail_data, pH, field_count_bulinus ), 
                              .groups = "drop")

View (Group_By_pH)

# The is.na() function did not work because R studio did not recognize NA as a term. Luckily, the rows of pH data are organized from lowest to highest values with the NAs coming at the bottom so I'm just going to trim off rows 263- 284. 

Row_where_Na_starts_pH <- 263
Row_where_Na_ends_pH <- 284
Group_By_pH_no_more_NA <- Group_By_pH [ -c (Row_where_Na_starts_pH:Row_where_Na_ends_pH) , ]
View (Group_By_pH_no_more_NA)

# That worked to get rid of the NAs at the bottom of the pH column! but now there are a couple of NA's in the bulinus snail colum. Time to get those out. 

Bye_Nas_pH <- arrange ( Group_By_pH_no_more_NA, desc (field_count_bulinus) ) #Im going arrange the data so the NAs are all together 
View (Bye_Nas_pH)

where_field_count_NA_starts_pH <- 1
where_field_count_NA_ends_pH <- 21

Finally_Clean_pH_data <- Bye_Nas_pH [ -c (where_field_count_NA_starts_pH:where_field_count_NA_ends_pH), ] # Took out the NA columns. 
View (Finally_Clean_pH_data) #The data for the pH is now beautiful and free from NAs.

# My next challenge is to round some of the numbers in the pH column. Some of the numbers have over 7 decimal places. I want to get them all to 2 so I can group them together. 
# Time to make the values numeric so we can round them. 

Finally_Clean_pH_data_as_numeric <- lapply( Finally_Clean_pH_data , as.numeric)
Finally_Clean_pH_data_as_numeric 

# Citation that helped me do this : 
# “Convert Character to Numeric in R (Example for String Variable &amp; Data Frame).” Statistics Globe, 30 Sept. 2020, statisticsglobe.com/convert-character-to-numeric-in-r/. 
# Ok so now they are numeric values so they should work in the rounding function 

number_of_digits_we_want <- 2 
Rounded_pH <- round ( Finally_Clean_pH_data_as_numeric$pH, digits = number_of_digits_we_want )
Rounded_pH

# YES IT WORKED!!!!!!!! 

# Now I to convert all those values data back into a dataframe so I can use dplyr on it 
Back_to_data_frame_pH <- data.frame ( Rounded_pH, Finally_Clean_pH_data_as_numeric$field_count_bulinus)
View (Back_to_data_frame_pH)

#### Step 3: use the data #### 

# Now I'm going to group the data together again using dplyr

require("dplyr") 

Avg_Snails_per_pH <- Back_to_data_frame_pH %>% 
      group_by ( Rounded_pH ) %>% 
      summarise(
      Average_snails_pH = mean(Finally_Clean_pH_data_as_numeric.field_count_bulinus),
      .groups = "drop")

Avg_Snails_per_pH

# So I have my dataset looking how I wanted it to look !!! (YAY)
# This is the citation to a source that helped me do that:
# Jackson, Simon. “Compute Average of Grouped Data.frame Using Dplyr and Tidyr.” Stack Overflow, 1 Feb. 1966, stackoverflow.com/questions/44168756/compute-average-of-grouped-data-frame-using-dplyr-and-tidyr. 

# Time to graph the data 

library("ggplot2")
require("ggplot2")

pH_graph <- ggplot( Avg_Snails_per_pH, aes( x = Rounded_pH, y = Average_snails_pH )) +
  geom_point(color="lightsalmon4") +
  geom_smooth (method = lm, color="lightpink3") 
  
Pretty_pH_graph <- pH_graph + theme(
  panel.background = element_rect(fill = "mistyrose1", colour = "mistyrose1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
) 

# Website where I got this code to make my graph pretty (lines 85-92)
# Alboukadel. “How to Improve GGPlot Theme Background Color and Grids.” Datanovia, 25 Dec. 2019, www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/#:~:text=The%20default%20theme%20of%20a,(See%20ggplot2%20themes%20gallery). 

print(Pretty_pH_graph + ggtitle("Average number of snails per pH value") + xlab( "pH Value") +
        ylab ("Average number of snails"))

# Ok! so that worked and provided a graph like I wanted it to. I think pH data is done for now! 

####################################################################################################################
## Time to do the phosphate data 

require("dplyr")

Group_By_phosphate <- summarise ( group_by ( snail_data, phosphate_mg.L_PO4, field_count_bulinus ), 
                           .groups = "drop")
View (Group_By_phosphate)

phosphorus_na_threshold_1 <- 409
phosphorus_na_threshold_2 <- 422

Group_By_phosphate_no_more_NA <- Group_By_phosphate [ -c (phosphorus_na_threshold_1:phosphorus_na_threshold_2) , ]
Group_By_phosphate_no_more_NA

Bye_Nas_phosphate <- arrange ( Group_By_phosphate_no_more_NA, desc (field_count_bulinus) ) #Im going arrange the data so the NAs are all together 
Bye_Nas_phosphate

fieldcount_Na_threshold_1_phosphate <- 1
fieldcount_Na_threshold_2_phosphate <- 31

Finally_Clean_phosphate_data <- Bye_Nas_phosphate [ -c (fieldcount_Na_threshold_1_phosphate:fieldcount_Na_threshold_2_phosphate), ] # Took out the NA columns. 
Finally_Clean_phosphate_data

phosphate_numeric <- lapply( Finally_Clean_phosphate_data , as.numeric)
phosphate_numeric 

Rounded_phosphate <- round ( phosphate_numeric$phosphate_mg.L_PO4, digits = number_of_digits_we_want ) # "number_of_digits_we_want" wwas defined earlier as 2. 
Rounded_phosphate

phosphate_dataframe <- data.frame ( Rounded_phosphate, phosphate_numeric$field_count_bulinus)
phosphate_dataframe

require("dplyr") 

Avg_Snails_per_phosphate_level <- phosphate_dataframe %>% 
  group_by ( Rounded_phosphate ) %>% 
  summarise(
    Average_snails_phosphate = mean(phosphate_numeric.field_count_bulinus),
    .groups = "drop")

Avg_Snails_per_phosphate_level

library("ggplot2")
require("ggplot2")

phosphate_graph <- ggplot( Avg_Snails_per_phosphate_level, aes( x = Rounded_phosphate, y = Average_snails_phosphate )) +
  geom_point(color="lightsalmon4")+
  geom_smooth (method = lm, color="lightpink3")

Pretty_phosphate_graph <- phosphate_graph + theme(
  panel.background = element_rect(fill = "mistyrose1", colour = "mistyrose1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
) 

# Citation for making the graph pretty: 
# Alboukadel. “How to Improve GGPlot Theme Background Color and Grids.” Datanovia, 25 Dec. 2019, www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/#:~:text=The%20default%20theme%20of%20a,(See%20ggplot2%20themes%20gallery). 


print( Pretty_phosphate_graph + ggtitle("Average number of snails per mg/L of phosphate") + xlab( "Phosphate (mg/L)") +
                                       ylab ("Average number of snails"))

####################################################################################################################
# Time to do nitrite data

require("dplyr")

Group_By_nitrite<- summarise ( group_by ( snail_data, nitrite_mg.L_NO2, field_count_bulinus ), 
                                  .groups = "drop")
View (Group_By_nitrite)

nitrite_na_threshold_1 <- 145
nitrite_na_threshold_2 <- 152

Group_By_nitrite_no_more_NA <- Group_By_nitrite [ -c (nitrite_na_threshold_1:nitrite_na_threshold_2) , ]
Group_By_nitrite_no_more_NA

Bye_Nas_nitrite <- arrange ( Group_By_nitrite_no_more_NA, desc (field_count_bulinus) ) #Im going arrange the data so the NAs are all together 
View (Bye_Nas_nitrite)

field_count_nitrite_Na_threshold_1 <- 1
field_count_nitrite_Na_threshold_2 <- 8

Finally_Clean_nitrite_data <- Bye_Nas_nitrite [ -c (field_count_nitrite_Na_threshold_1:field_count_nitrite_Na_threshold_2), ] # Took out the NA columns. 
Finally_Clean_nitrite_data

nitrite_numeric <- lapply( Finally_Clean_nitrite_data , as.numeric)
nitrite_numeric 

Rounded_nitrite <- round ( nitrite_numeric$nitrite_mg.L_NO2, digits = number_of_digits_we_want ) # "number_of_digits_we_want" was defined earlier as 2. 
Rounded_nitrite

nitrite_dataframe <- data.frame ( Rounded_nitrite, nitrite_numeric$field_count_bulinus)
nitrite_dataframe

require("dplyr") 

Avg_Snails_per_nitrite_level <- nitrite_dataframe %>% 
  group_by ( Rounded_nitrite ) %>% 
  summarise(
    Average_snails_nitrite = mean(nitrite_numeric.field_count_bulinus),
    .groups = "drop")

Avg_Snails_per_nitrite_level

library("ggplot2")
require("ggplot2")

nitrite_graph <- ggplot( Avg_Snails_per_nitrite_level, aes( x = Rounded_nitrite, y = Average_snails_nitrite )) +
  geom_point(color="lightsalmon4")+
  geom_smooth (method = lm, color="lightpink3")

Pretty_nitrite_graph <- nitrite_graph + theme(
  panel.background = element_rect(fill = "mistyrose1", colour = "mistyrose1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
) 

# Citation for making the graph pretty: 
# Alboukadel. “How to Improve GGPlot Theme Background Color and Grids.” Datanovia, 25 Dec. 2019, www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/#:~:text=The%20default%20theme%20of%20a,(See%20ggplot2%20themes%20gallery). 

print( Pretty_nitrite_graph + ggtitle("Average number of snails per mg/L of nitrite") + xlab( "Nitrite (mg/L)") +
                                     ylab ("Average number of snails") )

####################################################################################################################
# Time to do nitrate data

require("dplyr")

Group_By_nitrate<- summarise ( group_by ( snail_data, nitrate_mg.L_NO3, field_count_bulinus ), 
                               .groups = "drop")
View (Group_By_nitrate)

nitrate_na_threshold_1 <- 419
nitrate_na_threshold_2 <- 436

Group_By_nitrate_no_more_NA <- Group_By_nitrate [ -c (nitrate_na_threshold_1:nitrate_na_threshold_2) , ]
Group_By_nitrate_no_more_NA

Bye_Nas_nitrate <- arrange ( Group_By_nitrate_no_more_NA, desc (field_count_bulinus) ) #Im going arrange the data so the NAs are all together 
View (Bye_Nas_nitrate)

field_count_nitrate_Na_threshold_1 <- 1
field_count_nitrate_Na_threshold_2 <- 35

Finally_Clean_nitrate_data <- Bye_Nas_nitrate [ -c (field_count_nitrate_Na_threshold_1:field_count_nitrate_Na_threshold_2), ] # Took out the NA columns. 
Finally_Clean_nitrate_data

nitrate_numeric <- lapply( Finally_Clean_nitrate_data , as.numeric)
nitrate_numeric 

Rounded_nitrate <- round ( nitrate_numeric$nitrate_mg.L_NO3, digits = number_of_digits_we_want ) # "number_of_digits_we_want" wwas defined earlier as 2. 
Rounded_nitrate

nitrate_dataframe <- data.frame ( Rounded_nitrate, nitrate_numeric$field_count_bulinus)
View (nitrate_dataframe)

require("dplyr") 

Avg_Snails_per_nitrate_level <- nitrate_dataframe %>% 
  group_by ( Rounded_nitrate ) %>% 
  summarise(
    Average_snails_nitrate = mean(nitrate_numeric.field_count_bulinus),
    .groups = "drop")

Avg_Snails_per_nitrate_level

library("ggplot2")
require("ggplot2")

nitrate_graph <- ggplot( Avg_Snails_per_nitrate_level, aes( x = Rounded_nitrate, y = Average_snails_nitrate )) +
  geom_point(color="lightsalmon4")+
  geom_smooth (method = lm, color="lightpink3")

Pretty_nitrate_graph <- nitrate_graph + theme(
  panel.background = element_rect(fill = "mistyrose1", colour = "mistyrose1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
) 

# Citation for making the graph pretty: 
# Alboukadel. “How to Improve GGPlot Theme Background Color and Grids.” Datanovia, 25 Dec. 2019, www.datanovia.com/en/blog/ggplot-theme-background-color-and-grids/#:~:text=The%20default%20theme%20of%20a,(See%20ggplot2%20themes%20gallery). 

print( Pretty_nitrate_graph + ggtitle("Average number of snails per mg/L of nitrate") + xlab( "Nitrate (mg/L)") +
                                   ylab ("Average number of snails") )

####################################################################################################################

