## Introduce RStudio

#-----------------------------------------------------------------------------#
#### Data Input ####
#-----------------------------------------------------------------------------#

## Read in adosm1 file in your datasets folder
adosm1 <- read.csv('./datasets/adosm1.csv', stringsAsFactors = FALSE)

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

#-----------------------------------------------------------------------------#
#### Subsetting data ####
#-----------------------------------------------------------------------------#

## Subsetting Columns
# 1 column at a time
adosm1[, 'id']
# OR
adosm1$id

# 2 columns
adosm1[, c('id', 'visit')]
# Viewing 2 columns
View(adosm1[, c('id', 'visit')])

## Subsetting Rows
# rows by number
adosm1[1, ]
# rows by vector of numbers
adosm1[c(1, 2, 3, 5), ]
# rows by vector of numbers
adosm1[1:5, ]

## Subsetting by rows to answer questions in data
# through filtering a dataframe

## Filter for all visits at 36mo
visits36mo <- adosm1$visit == "36"
visits36mo
# This produces a logical vector, 
# where TRUEs are for all visits at 36 months.
# So all the TRUE values will now be subsetting the dataframe
adosm1[visits36mo, ]

# What are all the algorithms and versions at 36 months?
View(adosm1[visits36mo, c('ados_algorithm', 'ados_version')])

#-----------------------------------------------------------------------------#
#### Functions to explore datasets ####
#-----------------------------------------------------------------------------#

## table()
table(adosm1$ados_version)

## table of visit and algorithm
table(adosm1$visit, adosm1$ados_algorithm)

### Checking for duplicates --------------------------------------------------#
# Create duplicated dataset
dupDf <- data.frame(id = c(1, 1, 2, 2, 3, 3),
                    visit = c('10 months', '20 months',  '10 months',
                              '10 months', '20 months', '20 months'),
                    item1 = c(1, 2, 3, 3, 5, 6))
View(dupDf)

## duplicated()
duplicateIndices <- duplicated(dupDf)
duplicateIndices

View(dupDf[duplicateIndices ,])

## duplicate by key variables: id and visit
# to check duplicates by keys
dupIndGrouped <- duplicated(dupDf[, c("id", "visit")])
dupDf[dupIndGrouped, ]

View(dupDf[dupIndGrouped, ])  # View duplicatecases by id and visit
#-----------------------------------------------------------------------------#
#### Assignment 1: adosm2 dataset ####
#-----------------------------------------------------------------------------#

### Instructions
# 1. Read in the adosm2.csv file
# 2. What is the frequency count for every unique visit?
# 3. What are the ids that exist for the 30 month visit?
# 4. Are there duplicates by id and visit?
# 5. What is the frequency count of duplicates vs non-duplicates?
