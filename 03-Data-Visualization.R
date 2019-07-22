#-----------------------------------------------------------------------------#
#### Read in Data to Start ####
#-----------------------------------------------------------------------------#


# Our input data will be a scored version of the artificial ADOS Module 2 dataset
# with some fake columns to demonstrate how to use R 
# to perform specific data analyses.

### Resources

# This lesson largely borrowed and used the material in this book:
# [R for Data Science](https://r4ds.had.co.nz/)


adosm2 <- read.csv('./datasets/adosm2_scored.csv', 
                   stringsAsFactors = FALSE)

#-----------------------------------------------------------------------------#
#### Data Visualization with ggplot ####
#-----------------------------------------------------------------------------#
# if library not already installed,
# install.packages("ggplot2")
library("ggplot2")

### Plotting points
ggplot(data = adosm2) + 
  geom_point(mapping = aes(x = ados_fake_lin_outcome, 
                           y = ados_sarb_total, 
                           color = recruitment_group))

# Explain ?function() for help

# ggplot() will create a coordinate system you can add layers on top of
# it takes in the dataset to use in the graph with the `data` parameter

# geom_point() is the extra layer we are adding on the coordinate system, 
# so we are adding points to it

# the mapping argument will define how variables in your data will be **mapped**
# to a visual property

# The aes() argument within marks what piece of your dataset will map to
# the x or y axes, or even colors or fills.


#-----------------------------------------------------------------------------#
### Plotting with Points and Smooth
#-----------------------------------------------------------------------------#
ggplot(data = adosm2, 
       mapping = aes(x = ados_sarb_total, y = ados_fake_lin_outcome)) + 
  geom_point(mapping = aes(color = recruitment_group)) + 
  geom_smooth()

# We can plot points with smooth line: adding another layer with + geom_smooth()
# The first layer takes in our adosm2 dataset,
#    and maps the ados_sarb_total to the x axes
#    and the ados_fake_lin_outcome to the y axes

# The second layer plots points using the mapping of the first layer, but in addition adds color to the points by recruitment group
# The third layer uses the mapping of the first layer, so does not need any additional arguments

# We can similarly create bar plots and box plots using the same syntax, but with `geom_bar()` and `geom_boxplot()`

#-----------------------------------------------------------------------------#
#### Bar Plots
#-----------------------------------------------------------------------------#

### Bar plot with Colors
ggplot(data = adosm2) + 
  geom_bar(mapping = aes(x = recruitment_group, fill = gender))


### Bar plot with separated colors and positions
ggplot(data = adosm2) + 
  geom_bar(mapping = aes(x = recruitment_group, fill = gender), 
           position = "dodge")

### Box Plots with labels
ggplot(data = adosm2, mapping = aes(x = recruitment_group, y = ados_sarb_total)) +
  geom_boxplot() + labs(x = "Recruitment Group",
                        y = "ADOS SARB Total",
                        title = "Recruitment vs. SARB Total")

## Template for graphing

# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))



#### Problem 1: 
# Create a ggplot of the adosm2's 
# 1. ados_fake_score1 as the x axis
# 2. ados_fake_lin_outcome as the y axis
# 3. colored by recruitment group
# 4. and with the visual property of points with geom_point()













# Solution Below






ggplot(data = adosm2) +
  geom_point(mapping = aes(
    x = ados_fake_score1,
    y = ados_fake_lin_outcome,
    color = recruitment_group
  ))
