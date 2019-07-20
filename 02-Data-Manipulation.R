#-----------------------------------------------------------------------------#
#### Removing Duplicates ####
#-----------------------------------------------------------------------------#
# Create duplicated dataframe for demonstration
dupDf <- data.frame(id = c(1, 1, 2, 2, 3, 3),
                    visit = c('10 months', '20 months',  '10 months', 
                              '10 months', '20 months', '20 months'),
                    item1 = c(1, 2, 3, 3, 5, 6))
# save logical vector of duplicate indices
dupIndGrouped <- duplicated(dupDf[, c("id", "visit")])
# Remove duplicates
notDuplicateCases <- !dupIndGrouped
fixedDf <- dupDf[notDuplicateCases, ]
View(fixedDf)  # View fixed dataframe

#-----------------------------------------------------------------------------#
#### Cleaning Messy Data ####
#-----------------------------------------------------------------------------#
messyDf <- data.frame(
  id = c(1, 1, 2, 2, 3, 3),
  visit = c('10 months', '20 months',  '10 months', 
            '20 months', '10 months', '20 months'),
  item1 = c(1, 2, 3, 3, 5, 6),
  # item2 is a column with NAs
  item2 = c(NA, NA, 3, 4, 5, 6),
  # item3 is  a column with multiple missing codes and NAs
  item3 = c(NA, 'Missing', '-999', '4', '5', '6'),
  # item 4 is a character column with different codes for  same value
  item4Text = c('father', 'Father', 'fth', 'mother', 'Mother', 'Mother'),
  # item 5 is a coded variable with text embedded within
  item5Codes = c('0 (Never)', '1', '2', '3', '4', '5 (Always)'),
  item6 = c(1, 2, NA, NA, NA, NA),
  item7 = c(1, 2, 3, NA, NA, 6)
)


# Finding NAs with is.na()
is.na(messyDf$item2)

## Using ifelse()

# for all NAs replace with 0, otherwise replace with original value
ifelse(is.na(messyDf$item2), 0, messyDf$item2)

# We use this vector and assign it to the original column to clean it
messyDf$item2 <- ifelse(is.na(messyDf$item2), 0, messyDf$item2)

## Nesting ifelse() statements
# ifelse(condition 1, if condition 1 true then do this, else:
#   ifelse(condition2, if condition2 is true then do this, else: 
#     do this))
# See  logical vector of NAs
is.na(messyDf$item3)
# See  logical vector of -999s
messyDf$item3 == '-999'
# See  logical vector of 'Missing'
messyDf$item3 == 'Missing'

# for all NAs or missing codes, replace with -9, otherwise replace with original value
ifelse(is.na(messyDf$item3), '-9', 
       ifelse(messyDf$item3 == '-999', '-9',
              ifelse(messyDf$item3 == 'Missing', '-9', messyDf$item3)))

# We use this vector and assign it to the original column to clean it
messyDf$item3 <- 
  ifelse(is.na(messyDf$item3), '-9', 
         ifelse(messyDf$item3 == '-999', '-9',
                ifelse(messyDf$item3 == 'Missing', '-9', messyDf$item3)))



#-----------------------------------------------------------------------------#
#### Writing Data ####
#-----------------------------------------------------------------------------#

write.csv(adosm1, './datasets/ADOS Module 1 Scored', row.names = FALSE)

#-----------------------------------------------------------------------------#
#### Assignment ####
#-----------------------------------------------------------------------------#

# 
# - Using the `messyDf` created in your R environment, clean up items 4 and 5
# - Replace the item 4 values to a consistent value to represent father and mother
# - Replace the item 5 value: `0 (Never)` and `5 (Always)` to `0` and `5`
