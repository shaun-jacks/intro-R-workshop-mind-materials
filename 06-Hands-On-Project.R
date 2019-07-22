## Before scoring the ADOS dataset, a note on functions...

## But first.. Functions

# We can create functions by the following syntax:
  
plusOneFunction <- function(input1) {
  # This is the function body
  # do something
  result <- input1 + 1
  return(result)  # output
}

# The inputs of our function are within the `()`
# The body of the function is where we perform operations on the input
# Calling return() will specify what output we want from our function
# The ` <- ` assigns the function to a variable we can later on use
# In this case, plusOneFunction now can be used later on to  perform an operation

a <- 1
b <- plusOneFunction(a)   # a will represent input1
b  # b is the result after the return()


## Score ADOS Module 1- Assignment 2
# We will provide solutions with the ADOS Module 1
# That use the following concepts we've covered in these lessons.

# Note: There are ways to improve upon this scoring script
# by using custom functions and lapply(), that are covered in the book:
# https://shaun-jacks.github.io/intro-R-workshop-mind
# Chapter: data manipulation part 2

## Using what we've learned:













#### Problem 1 ####
# 1. Read in the adosm1.csv file in datasets folder,
#    name the dataframe adosm1
#    1.a: assign a backup with ados_backup <- adosm1







#### Solution Problem 1 ####
adosm1 <- read.csv('./datasets/adosm1.csv', stringsAsFactors = FALSE)
ados_backup <- adosm1





#### Problem 2 ####
# 2.  If item ados_b1, create a function that using ifelse()... 
# - replace NAs or Missings with 0, 
# - replace value 1 or 3, with 2,
# - replace items 0 or 2, with 0,
# - otherwise keep original value
# - Returns this output of the ifelse()
# - Use function to replace item ados_b1












#### Solution Problem 2 ####
item_b1_replace <- function(item) {
  # items may be  characters because of missings codes, so first replace with
  # chars, then turn to numerics
  item <- as.character(item)
  newVal <- ifelse(is.na(item), "0", # replace NAs with 0
                   ifelse(item %in% c("-999", "9", "Missing (-9)"),"0",  # replace missings with 0
                          ifelse(item %in% c("1", "3"), "2",  # replace 1 or 3 with 2
                                 ifelse(item %in% c("0", "2"),  "0", item))))  # replace 0 or 2 with 0, else item
  newVal <- as.numeric(newVal)
  return(newVal)
}
adosm1$ados_b1 <- item_b1_replace(adosm1$ados_b1)


#### Problem 3 ####
# 3. For all other items, create a function that using ifelse()... 
# - replace NAs or Missing codes with 0,
# - replace value 3, with 2,
# - keep values between  0, 1, 2 the same as itself,
# - replace all others with 0
# - Returns this output of the ifelse()
# - Use function to replace all other ados items:
# ados_a[1 to 8]
# ados_b[2 to 16]
# ados_c[1, 2]
# ados_d[1 to 4]
# ados_e[1 to 3]
# see all items with names(adosm1)
# Optional: use a FOR loop or lapply() to make this less verbose









#### Solution Problem 3 ####
item_replace <- function(item) {
  # items may be  characters because of missings codes, so first replace with
  # chars, then turn to numerics
  item <- as.character(item)
  newVal <- ifelse(is.na(item), '0', # replace NAs with 0
                   ifelse(item %in% c('-999', '9', 'Missing (-9)', '999'), '0',  # replace missings with 0
                          ifelse(item == '3', '2',  # replace 3 with 2
                                 ifelse(item %in% c('0', '1', '2'),  item, 
                                        '0'))))  
  newVal <- as.numeric(newVal)
  return(newVal)
  
}
adosm1$ados_a1 <- item_replace(adosm1$ados_a1)
adosm1$ados_a2 <- item_replace(adosm1$ados_a2)
adosm1$ados_a3 <- item_replace(adosm1$ados_a3)
adosm1$ados_a4 <- item_replace(adosm1$ados_a4)
adosm1$ados_a5 <- item_replace(adosm1$ados_a5)
adosm1$ados_a6 <- item_replace(adosm1$ados_a6)
adosm1$ados_b2 <- item_replace(adosm1$ados_b2)
adosm1$ados_b3 <- item_replace(adosm1$ados_b3)
adosm1$ados_b4 <- item_replace(adosm1$ados_b4)
adosm1$ados_b5 <- item_replace(adosm1$ados_b5)
adosm1$ados_b6 <- item_replace(adosm1$ados_b6)
adosm1$ados_b7 <- item_replace(adosm1$ados_b7)
adosm1$ados_b8 <- item_replace(adosm1$ados_b8)
adosm1$ados_b9 <- item_replace(adosm1$ados_b9)
adosm1$ados_b10 <- item_replace(adosm1$ados_b10)
adosm1$ados_b11 <- item_replace(adosm1$ados_b11)
adosm1$ados_b12 <- item_replace(adosm1$ados_b12)
adosm1$ados_b13a <- item_replace(adosm1$ados_b13a)
adosm1$ados_b13b <- item_replace(adosm1$ados_b13b)
adosm1$ados_b14 <- item_replace(adosm1$ados_b14)
adosm1$ados_b15 <- item_replace(adosm1$ados_b15)
adosm1$ados_b16 <- item_replace(adosm1$ados_b16)
adosm1$ados_c1 <- item_replace(adosm1$ados_c1)
adosm1$ados_c2 <- item_replace(adosm1$ados_c2)
adosm1$ados_d1 <- item_replace(adosm1$ados_d1)
adosm1$ados_d2 <- item_replace(adosm1$ados_d2)
adosm1$ados_d3 <- item_replace(adosm1$ados_d3)
adosm1$ados_d4 <- item_replace(adosm1$ados_d4)
adosm1$ados_e1 <- item_replace(adosm1$ados_e1)
adosm1$ados_e2 <- item_replace(adosm1$ados_e2)
adosm1$ados_e3 <- item_replace(adosm1$ados_e3)

# 4. Score SA total
# - 4.1 Compute the 'no words', or 'few to no words' sa total:
#   - no_words_sa_total <- 
#     sums of ados_a2, ados_a8, ados_b1, ados_b3,  ados_b4, ados_b5, ados_b9,
#     ados_b10, ados_b11
# - 4.2 Compute the 'some words' sa total:
#   - some_words_sa_total <-  
#   - sums of ados_a2, ados_a7, ados_a8, ados_b1, ados_b3, ados_b4, 
#     ados_b5, ados_b9, ados_b10
# - 4.3 If ados_algorithm is 'no words', or 'few to no words', the sa_total = 
#   - answer to 4.1
# - If ados_aglorithm is  some words, the sa_total = 
#   - answer to 4.2






#### Solutions Problem 4 ####
# 4.1
no_words_sa_total <-
  adosm1$ados_a2 + adosm1$ados_a8 + adosm1$ados_b3 + adosm1$ados_b4 +
  adosm1$ados_b5 + adosm1$ados_b9 + adosm1$ados_b10 + adosm1$ados_b11
# 4.2
some_words_sa_total <-
  adosm1$ados_a2 + adosm1$ados_a7 + adosm1$ados_a8 + adosm1$ados_b1 +
  adosm1$ados_b3 + adosm1$ados_b4 + adosm1$ados_b5 + adosm1$ados_b9 + 
  adosm1$ados_b10
# 4.3
adosm1$ados_sa_total <- 
  ifelse(adosm1$ados_algorithm == "no words", no_words_sa_total,
         ifelse(adosm1$ados_algorithm == "few to no words", no_words_sa_total,
                ifelse(adosm1$ados_algorithm == "some words", some_words_sa_total,
                       NA)))


# 5. Score RRB total
# - 5.1 Compute the 'no words', or 'few to no words' sa total:
#   - no_words_rrb_total <- 
#     sums of ados_a3, ados_d1, ados_d2, ados_d4
# - 5.2 Compute the 'some words' sa total:
#   - some_words_rrb_total <-  
#   - sums of ados_a5, ados_d1, ados_d2, ados_d4
# - If ados_algorithm is 'no words', or 'few to no words', the rrb_total = 
#   - answer to 5.1
# - If ados_aglorithm is  some words, the rrb_total = 
#   - answer to 5.2









#### Solutions Problem 4 ####
# 4.1
no_words_rrb_total <-
  adosm1$ados_a3 + adosm1$ados_d1 + adosm1$ados_d2 + adosm1$ados_d4 
# 4.2
some_words_rrb_total <-
  adosm1$ados_a5 + adosm1$ados_d1 + adosm1$ados_d2 + adosm1$ados_d4
# 4.3
adosm1$ados_rrb_total <- 
  ifelse(adosm1$ados_algorithm == "no words", no_words_rrb_total,
         ifelse(adosm1$ados_algorithm == "few to no words", no_words_rrb_total,
                ifelse(adosm1$ados_algorithm == "some words", some_words_rrb_total,
                       NA)))




# 6. Score SARB total
# - SARB total = 
#   - sa_total + rrb_total











#### Solutions Problem 5
adosm1$ados_sarb_total <- adosm1$ados_sa_total + adosm1$ados_rrb_total



## subset the scored version
adosm1_scored <- adosm1[, c("id", "visit", "ados_sa_total", 
                     "ados_rrb_total", "ados_sarb_total")]


## write output 
# write.csv(adosm1_scored, "path_to_output")




