

# How 4 Different Abiotic Factors Influence Bulinus spp. Snail Numbers in Senegalese Freshwater Ecosystems 

### Biological question

Does pH value, phosphate content, nitrite content, and nitrate content affect the number of Bulinus spp. snails in freshwater ecosystems in Senegal?

### Context (introduction)

This assignment will use an R script to explore the dataset from the study conducted in 2019 titled "Precision mapping of snail habitat provides a powerful indicator of human schistosomiasis transmission". It will explore the relationships between pH value, phosphate content, nitrite content,  nitrate content, and the corresponding Bulinus snails. Bulinus snails are extremely important to study because act as intermediate hosts to the parasite Schistosoma spp. If scientists can use abiotic factors to find Bulinus snails, this could potentially help future public health specialists control the spread of the neglected tropical disease, schistosomiasis. 

### Methods

##### The source of the data:

To address my question stated above, I used a dataset, found on Dryad Digital Repository, from a study titled "Precision mapping of snail habitat provides a powerful indicator of human schistosomiasis transmission". This study was published to the Dryad Digital Repository in 2019. The study explores freshwater ecosystems in the Lower Senegal River Basin. Specifically, the study looked at different features of Bulinus spp. snail habitat (vegetation, mud, etc.) and how those factors correlated with rates of rates of schistosomiasis in surrounding villages. The dataset also provided abiotic data, such as pH value, phosphate content, nitrite content, and nitrate (what my original question looks to explore). The dataset the study produced is an excel spreadsheet that includes both qualitative/ descriptive data (for example: types of microhabitat present in a specific testing quadrant), and quantitative data (for example: the number of snails present in a specific quadrant, pH measurements, etc). 

To produce this dataset, the team of scientists used a number of descriptors to indicate snail habitat (for example "mud" to indicate the presence of mud at a testing site and "emerg" to indicate the presence of emergent vegetation at a testing site). They then looked at images from google earth for each testing site and recorded what aspects of snail habitat they found. They also visited the sites to see if there were any visual indicators of snail habitat and record other important aspects of the freshwater ecosystem that could affect snail number. Finally, they sampled the testing site to see if there were in fact snails located there. 

The original data frame is quite large. There are 2797 rows of data and 70 columns of data in the excel spreadsheet. The data was slightly challenging to work with because after I imported the excel spreadsheet into R-Studio, it did not recognize the data as numerical values, but rather character values. This made it challenging to take out "NA" values. 

The link to the Dryad Digital Repository link can be found [here](https://datadryad.org/stash/dataset/doi:10.5061/dryad.djh9w0vvt) '

The link to the study published in *Proceedings of the National Academy of Sciences of the United States of America* can be found [here](https://www.pnas.org/content/116/46/23182)

##### What the original authors did with the data:

The original team of scientists that produced this data set were mainly concerned with how physical aspects of snail habitat, that could be seen from satellite or drone footage (emergent vegetation, mud, etc), could predict snail presence in Senegalese freshwater ecosystems. To explore this, the original team of scientists compared vegetation that is common in Bulinus spp. snail habitat to the actual number of snails present in that quadrant. They then also compared the vegetation patterns to the number of schistosomiasis infections in nearby villages (Wood et al. 2019)

They also compared the data collected from looking at drone/ satellite footage to the data collected when they visited in the quadrants in person to see how accurate drone/ satellite footage is at capturing vegetation data. 

From graphing snail habitat trends, the original scientists were able to produce figures such as [this](https://www.pnas.org/content/pnas/116/46/23182/F2.large.jpg)

##### What  _I_  did with the data and how I did it:

What I did with this data was create graphs that exhibit the relationship between Bulinus snails and 4 abiotic features: pH value, phosphate content, nitrite content, and nitrate content. I wanted to explore if snail prevalence was directly positivity related to any of these aspects because the original study does not expand on these factors in their exploration of the data. Also, I wanted to see if there was a strong positive relationship between snails and these abiotic factors because then altering their abundance could help to control snail populations. 

In creating graphs to observe correlations between the four abiotic features and snail prevalence, I used the coding platform R Studio. My code worked to compare how the average number of snails changed based on the prevalence of a specific abiotic feature (pH, phosphate, nitrite, and nitrate). 

### Results and conclusions

I found that there didn't seem to be any strong relationship between snail number and nitrate, pH, or phosphorus. However, there does seem to be a weak negative relationship between nitrite mg/L and average number of snails in the quadrant. 

This relates to my original question because it does not seem that abiotic factors influence snail population as much as the vegetation aspects that the original study focused on. 

Below are the graphs that I created in R Studio by using ggplot. They display the relationships between the listed abiotic features that I studied as well as the correlating snail numbers. 

![Phosphate Graph](https://github.com/nape0465/CompBioLabsAndHomework/blob/main/Independent_Project/Graphs/Phosphate_Graph.pdf)

![Nitrate Graph](https://github.com/nape0465/CompBioLabsAndHomework/blob/main/Independent_Project/Graphs/Nitrate_Graph.pdf)

![Nitrite Graph](https://github.com/nape0465/CompBioLabsAndHomework/blob/main/Independent_Project/Graphs/Nitrite_Graph.pdf)

![pH Graph](https://github.com/nape0465/CompBioLabsAndHomework/blob/main/Independent_Project/Graphs/pH_Graph.pdf)

### References Cited

Wood, Chelsea L., Susanne H. Sokolow, Isabel J. Jones, Andrew J. Chamberlin, Kevin D. Lafferty, Armand M. Kuris, Merlijn Jocque, et al. 2019. “Precision Mapping of Snail Habitat Provides a Powerful Indicator of Human Schistosomiasis Transmission.” Proceedings of the National Academy of Sciences 116 (46): 23182–91. [https://www.pnas.org/content/116/46/23182](https://www.pnas.org/content/116/46/23182)

Wood, Chelsea L., Susanne H. Sokolow, Isabel J. Jones, Andrew J. Chamberlin, Kevin D. Lafferty, Armand M. Kuris, Merlijn Jocque, et al. (2019) Data from: Precision mapping of snail habitat provides a powerful indicator of human schistosomiasis transmission. Dryad Digital Repository. [https://datadryad.org/stash/dataset/doi:10.5061/dryad.djh9w0vvt](https://datadryad.org/stash/dataset/doi:10.5061/dryad.djh9w0vvt)

> Written with [StackEdit](https://stackedit.io/).
