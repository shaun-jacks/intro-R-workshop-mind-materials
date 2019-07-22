## Introduce RStudio

# Explain comments

# Describe how to create/assign variables

# Class Demostration
class(1)
class("hello")
class(TRUE)
class(NA)

#-----------------------------------------------------------------------------#
#### Data Input ####
#-----------------------------------------------------------------------------#
# "read.csv" is a function that could read CSV files on your computer, 
#     and returns a dataframe for your R environment

# Use read.csv to read in adosm1 file using your own file path
# Look at where your adosm1.csv is saved AKA the file path

# Our input data will be an artificial ADOS Module 1 dataset
# with some fake columns to demonstrate how to use R 
# to perform specific data analyses.

adosm1 <- read.csv("~/Desktop/Programming/workshops/intro-R-workshop-mind-materials/datasets/adosm1.csv",
                   stringsAsFactors = FALSE)
# stringsAsFactors is an argument in the function that allows you
# to tell R not to turn characters into factors



# If dataset is within same location as R project, can use ./
adosm1 <- read.csv("./datasets/adosm1.csv", stringsAsFactors = FALSE)
#-----------------------------------------------------------------------------#
#### Observing Dataframe attributes ####
#-----------------------------------------------------------------------------#

## View your dataframe with View()
View(adosm1)

## Display columns names with names()
names(adosm1)

## Display row names with row.names()
row.names(adosm1)

## See all dataframe attributes with attributes()
attributes(adosm1)

## output first 6 rows of every column to console
head(adosm1)

#-----------------------------------------------------------------------------#
#### Problem 1:

# 1. Read in the file named adosm1_scored.csv within the datasets folder
# of your current working directory
# name is adosm1_scored

# 2. use the assignment operator "<-" to store the column names of the
#    adosm1_scored.csv file to a variable called adosm1_scored_names
#-----------------------------------------------------------------------------#










# Solution below










adosm1_scored <- read.csv("./datasets/adosm1_scored.csv", 
                          stringsAsFactors = FALSE)
adosm1_scored_names <- names(adosm1_scored)
adosm1_scored_names








#-----------------------------------------------------------------------------#
#### Subsetting data ####
#-----------------------------------------------------------------------------#
# Subsetting data is the basis of filtering datasets

# To subset our data, we can use:
# 1. The name of our column or row
# 2. The index or position number of our column or row
# 3. A logical vector where TRUEs will be in subset, FALSE will be filtered out

# We would use brackets after the name of our dataframe
# and a comma to access rows and columns

# In our case, adosm1 is within our R environment, so we would call
# "adosm1[namesOfRows, namesOfColumns]"

## Subsetting Columns
# 1 column at a time, all rows
adosm1[, "id"]
# OR
adosm1$id

# 2 columns at a time, all rows
adosm1[, c("id", "visit")]

# Viewing 2 columns
View(adosm1[, c("id", "visit")])

# Try viewing columns "id", "recruitment_group", "gender"




## Subsetting Rows
# rows by number, all columns
adosm1[1,] 
# rows by vector of numbers, all columns
adosm1[c(1, 2, 3, 5), ]

## Subsetting by rows to answer questions in data
# through filtering a dataframe with logical vectors

## Filter for all visits at 36mo
adosm1$visit # view all visit values
adosm1$visit == "36" # logical vector for all visits == 36 months

# store vector of 36 month visits in variable named visits36mo
visits36mo <- adosm1$visit == "36"
# All the TRUE values will now be subsetting the dataframe
adosm1[visits36mo, ] # all columns for rows where visit == 36
adosm1[visits36mo, "visit"]  #rows where visit == 36, and column "visit"
View(adosm1[visits36mo,])

#-----------------------------------------------------------------------------#
#### Problem 2:
# 1. Filter the adosm1 dataset for rows where visit == 18 and
#    columns == ados_algorithm, ados_version.












# Solution below





adosm1[adosm1$visit == "18", c("ados_version", "ados_algorithm")]
#-----------------------------------------------------------------------------#
#### Functions to explore datasets ####
#-----------------------------------------------------------------------------#

# To get a frequency count of  all unique values,
# we use the  table()

# table() takes in 1 or more vectors as input
# since every dataframe column could be considered a vector (or list)
# this function allows us to see all the possible values within a column
# with a frequency count for each value
table(adosm1$ados_version)

## table of visit and algorithm
table(adosm1$visit, adosm1$ados_algorithm)


### Checking for duplicates --------------------------------------------------#
# Read in dataframe with duplicates
dup_adosm1 <- read.csv("./datasets/adosm1_duplicates.csv",
                       stringsAsFactors = FALSE)

## duplicated()
# The "duplicated" function returns a logical vector 
# of the duplicates that exist in a dataframe

# The TRUE values represent the index locations 
# of where a duplicate row was found

# We could use this logical vector to see where a duplicate exists
duplicateIndices <- duplicated(dup_adosm1)
duplicateIndices
# How many duplicates?
table(duplicateIndices)

View(dup_adosm1[duplicateIndices ,])

## duplicate by key variables: id and visit
# to check duplicates by keys
dupIndGrouped <- duplicated(dup_adosm1[, c("id", "visit")])
dup_adosm1[dupIndGrouped, ]

View(dup_adosm1[dupIndGrouped, ])  # View duplicate cases by id and visit

#-----------------------------------------------------------------------------#
#### Problem 3: Duplicates within the adosm2 dataset ####
#-----------------------------------------------------------------------------#

### Instructions
# 1. Read in the adosm2.csv file in your datasets folder
# 2. What is the frequency count of duplicates by id and visit?











# Solution below






adosm2 <- read.csv("./datasets/adosm2.csv", stringsAsFactors = FALSE)
table(duplicated(adosm2[, c("id","visit") ]))

