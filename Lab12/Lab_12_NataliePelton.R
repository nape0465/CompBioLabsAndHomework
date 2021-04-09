### Lab 12 
### Natalie Pelton 
### 04.09.2021

#### PART 1 #### 
stateStatsData <- read.csv ( "CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                             stringsAsFactors = F)

names(stateStatsData) 
str(stateStatsData)
summary(stateStatsData)
unique(stateStatsData$Name)
unique(stateStatsData$Desc_)
table(stateStatsData$Name)

# Steps 1, 2, 3, 4, 5 

# in one pipeline with pipes
require("dplyr") 

ColoradoData <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = strptime( Date, format = "%m/%d/%Y", tz = "") ) %>%
  arrange( Date ) %>%
  filter( Date < as.POSIXlt("2020-05-15") ) # dt defined above

#### PART 2 #### 

require ("ggplot2")

graph_take_1 <- ggplot(ColoradoData, aes(as.Date( Date ), Cases)) +
  geom_line()+
  scale_x_date(date_labels = "%b-%d-\n%Y")+
  theme(axis.text.y = element_text(angle = 90))

## ^^ Citation for where I got this code format from: 
## mpalanco . “R time_trans Works with Objects of Class POSIXct.” Stack Overflow, 1 Nov. 1966, stackoverflow.com/questions/48508907/r-time-trans-works-with-objects-of-class-posixct. 

graph_take_1 + scale_y_continuous (trans = 'log2')

## Ok for this one I tried to look online for some answers and it took me here: 
## Alboukadel. “3 Easy Ways to Create a GGPlot with Log Scale.” Datanovia, 25 Dec. 2019, www.datanovia.com/en/blog/ggplot-log-scale-transformation/#:~:text=This%20can%20be%20done%20easily,a%20log%20scale%3A%20base%2010. 

graph_number_2 <- ggplot(ColoradoData, aes ( Deaths, Cases)) +
  geom_line()+
  theme(axis.text.y = element_text(angle = 90))

graph_number_2 + scale_y_continuous (trans = 'log2')


