#-----------------------------------------------------------------------------#
#### Removing Duplicates ####
#-----------------------------------------------------------------------------#
# Read in dataframe with duplicates
dup_adosm1 <- read.csv('./datasets/adosm1_duplicates.csv',
                       stringsAsFactors = FALSE)

# save logical vector of duplicate indices
dupIndGrouped <- duplicated(dup_adosm1[, c("id", "visit")])
# Remove duplicates
notDuplicateCases <- !dupIndGrouped
fixedDf <- dup_adosm1[notDuplicateCases, ]
View(fixedDf)  # View fixed dataframe

#-----------------------------------------------------------------------------#
#### Finding NAs, and relpacing Coded Values ####
#-----------------------------------------------------------------------------#
# Read in messy dataset that we will clean
parentQs <- read.csv('./datasets/messyDataset.csv', stringsAsFactors = FALSE)

# Our dataset
head(parentQs)

# Finding NAs with is.na()
is.na(parentQs$item2)

## Using ifelse()

# for all NAs replace with 0, otherwise replace with original value
ifelse(is.na(parentQs$item2), 0, parentQs$item2)

# We use this vector and assign it to the original column to clean it
parentQs$item2 <- ifelse(is.na(parentQs$item2), 0, parentQs$item2)

## Nesting ifelse() statements
# ifelse(condition 1, if condition 1 true then do this, else:
#   ifelse(condition 2, if condition2 is true then do this, else: 
#     replace with last value))

# Look at item5Codes
parentQs$item5Codes

# Replace coded values with it's numeric form
parentQs$item5Codes <- 
  ifelse(parentQs$item5Codes == "0 (Never)", "0",
       ifelse(parentQs$item5Codes == "5 (Always)", "5",
              parentQs$item5Codes))
# Convert a character vector to a numeric
parentQs$item5Codes <- as.numeric(parentQs$item5Codes)

#-----------------------------------------------------------------------------#
#### Assignment ####
#-----------------------------------------------------------------------------#
# Using the parentQs created in your R environment, clean up item 4
# Replace the item 4 values that represent a "father" to "father"
# and that represent a "mother" to "mother"
table(parentQs$item4Text)










# Solution Below

parentQs$item4Text <- ifelse(parentQs$item4Text == "Father", "father",
                            ifelse(parentQs$item4Text == "fth", "father",
                                    ifelse(parentQs$item4Text == "Mother", "mother",
                                           parentQs$item4Text)))


#-----------------------------------------------------------------------------#
#### Writing Data ####
#-----------------------------------------------------------------------------#
# write.csv() is a function you can use to write a dataframe to a CSV file.

# Write your cleaner dataset to the datasets folder and name it
# cleanedDf.csv
write.csv(parentQs, "./datasets/cleanedDf.csv", row.names = FALSE)
