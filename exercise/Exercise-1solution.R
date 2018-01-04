# loading the data
bdpop <- read.csv("exercise-1.csv", as.is = T)

head(bdpop)

# check data type for each columns
str(bdpop)

# convert pop and area variable to numeric
bdpop$pop <- as.numeric(gsub(",","",bdpop$pop))
bdpop$area <- as.numeric(gsub(",","",bdpop$area))

# Create a new variable for division by 
# taking middle two character of "HASC" variable
bdpop$division <- unlist(lapply(strsplit(bdpop$HASC, "\\."), 
                                function(x) x[2]))

##############################################################################################
# How the above line works (explanation part by part)

# step-1: split HASC variable by the dots
HASC <- strsplit(bdpop$HASC, "\\.") 

# Checking the class of HASC object
class(HASC)

# check length of HASC object
length(HASC)

# print first 4 elements
HASC[1:4]

# step-2: pick only the middle element from each of the component
HASC2 <- lapply(HASC, function(x) x[2])

class(HASC2)
length(HASC)
HASC2[1:4]

# step-3: creating a vector of division names 
HASC3 <- unlist(HASC2)
class(HASC3)
HASC3[1:4]
##############################################################################################

# Creating a new variable population density (popdensity)

bdpop$popdensity <- round(bdpop$pop/bdpop$area,digits=2)

library(ggplot2)
library(scales)

# Initialize the plot
plot1 <- ggplot(data = bdpop) 
plot1

# Adding geometric point objects and size by population density, color by division
plot1 <- plot1 + geom_point(aes(x=area, y=pop, 
                                col=division, size=popdensity))
plot1

# Adding smooth curve
plot1 <- plot1 + geom_smooth(aes(x=area, y=pop))
plot1

# Customizing y axis tick values
plot1 <- plot1 + 
  scale_y_log10(breaks=trans_breaks('log10',
                                    function(x) 10^x),
                labels=trans_format('log10',math_format(10^.x)))
plot1

# Customizing x and y axis label and plot title
plot1 <- plot1 + xlab("Area in square km")+ 
  ylab("Population")+
  theme_bw()+
  ggtitle(label = "Area Vs Population (District Wise)")
plot1


