#-----------------------------------------------------------------------------#
#### Read in Data to Start ####
#-----------------------------------------------------------------------------#
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

### Plotting with Points and Smooth
ggplot(data = adosm2, 
       mapping = aes(x = ados_sarb_total, y = ados_fake_lin_outcome)) + 
  geom_point(mapping = aes(color = recruitment_group)) + 
  geom_smooth()

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

### Box Plots
ggplot(data = adosm2, mapping = aes(x = recruitment_group, y = ados_sarb_total)) +
  geom_boxplot()
