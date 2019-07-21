## Introduce RStudio

#-----------------------------------------------------------------------------#
#### Objects ####
#-----------------------------------------------------------------------------#

## Objects are entities of information

# Objects are the fundamental foundation to storing data, and manipulating it.

## Datatypes

# You can think of these datatypes like a pyramid of information.
# 
# - The bottom of the pyramid, the foundation, are the datatypes:
#   - Numeric 
#   - Character
#   - Logical
# 
# - The middle of the pyramid consists of
# - Vectors (holding multiple values a single datatype in level 1)
# - Factors (holding multiple values of a single datatype but with additional attributes in level 1)
# 
# - The top of the pyramid consists of
# - Lists (flexible storage of both level 1 and 2 of the  pyramid)
# - Dataframes (rows and columns of vectors)
# 
### Numeric, Character, Logical, Factor

#### Numeric

# - A numeric is self-explanatory. It could be a number that is either an integer, or a decimal
# - In R we can assign a numeric to a number with the assignment operator `<-`, or with an `=` sign.
a <- 1
a






#### Character

# A character is a representation of letters and or numbers and symbols. You would wrap the letters and numbers in either `""` or `''` marks to store as a character
# Assign a character value to a variable named a
a <- 'abc'
a








#### Logical

# A logical value also called a boolean value can only be `TRUE` or `FALSE`.
# These are powerful and allows the user to filter their data based on certain conditions.
# Assign a variable named flag to TRUE
flag <- TRUE


##### Boolean operators

# - Boolean operators are
# - `<` (less than)
# - `>` (greater than)
# - `==` (equal to) notice two equal signs
# - `!` NOT operator: Turns a TRUE to FALSE or a FALSE to TRUE
# - `&` AND operator: Returns TRUE if all values TRUE, else FALSE
# - `|` OR operator: Returns FALSE if all values FALSE, else TRUE
# - A boolean operator returns a logical value or vector (will be explained) or matrix (will be explained)



# quick example of boolean operators
boolVal1 <- 1 < 5
boolVal1
boolVal2 <- 5 == 5
boolVal2
boolVal3 <- !(5 == 5)
boolVal3





### Vectors, Factors, Lists

#### Vectors

# A vector is a combination of values that have  the same datatype.
# We use a function called `c()` to **combine** the values into a vector
# We put various values within the `()` separated by  a comma

vector1 <- c(1, 2, 3)
vector1
vector2 <- c('a', 'b', 'c')
vector2
vector3 <- c(TRUE, FALSE, TRUE)
vector3

# Vectors are the fundamental datatypes that can make up a list, or a dataframe, which is how R represents a piece of data by rows and columns.
# 
# We can names vectors by using the `names()`

names(vector1) <- c('a', 'b', 'c')
vector1

#### Factor

# A factor is a special datatype that summarizes your data into a set of levels, where each level is a unique value of your  data.
# It can be used to create Statistical Models
# We can create factors with the function:  `as.factor()`

factor1 <- as.factor(c('a', 'b', 'b', 'c'))
factor1






#### Lists

# A list is similar to a vector in that it could hold  multiple values. However, it is much  more flexible.
# The difference is that it can hold multiple values of **different** datatypes.
# we can create lists with the function: `list()`
# it can also have names for each element in the list by doing:
list(nameOfElement = valuesOfElement)

list1 <- list(a = 1, 
              b = c(TRUE, FALSE),
              c = 'hi')
list1

### Dataframes

# Dataframes are useful in that it organizes your data into rows and columns, similar to how data would be represented in a database, and excel sheet, or a simple CSV or TSV file.
# 
# Every column has the same length could be thought of as a vector with one datatype.
# It holds additional attributes covered in the next section
# 
# we can create dataframes with `data.frame()`
dataframe1 <- data.frame(
  col1 = c(1, 2, 3),
  col2 = c('a', 'b', 'c')
)
dataframe1



### Viewing datatypes with `class()`
# - Using the `class()` function, we could see what datatype a variable is

class(list1)
class(vector1)
class(dataframe1)




## Functions

# Remember how objects are entities that hold information?
#   
#   A function is also an object, that holds information about how to manipulate your data if used.
# 
# A function consists of 3 pieces:
#   
#   - Input
# - Body
# - Output
# 
# In the previous section, we have already made use of functions. For example, the `class()` function is a function if you see `()` after a variable name.
# 
# - The **input** is any of the datatypes we've talked about
# - The  **body** determines which type of datatype it is- a.k.a it's class
# - The **output** returns the type of class the input is.
# 
# Other functions we  have already used:
  
#   - `c()`, 
# - takes in multiple values of one datatype as **input**, 
# - the **body** converts the values to a vector, 
# - and **outputs** a vector
# - `list()`, 
# - takes in vectors as **input**, 
# - the **body** converts the vectors to a list, 
# - and **outputs** a list
# - `data.frame()`, 
# - takes in vectors as **input**, 
# - the **body** converts the vectors to a dataframe,
# - and  **outputs** a data.frame


