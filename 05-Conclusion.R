#### Combining all lessons ####
## Overview
# 1. Read in qchat dataset
# 2. Get the unique frequency count of values from the column: 
#    "Who_completed_the_test" with table()
# 3. Recode the "Health care professional" values to "Health Care Professional"
#    in the "Who_completed_the_test" column with ifelse() to clean values
# 4. ggplot2 - plot geom_points with
#    x = qchat_fake_score1
#    y = qchat_fake_lin_outcome
#    color = Who_completed_the_test
# 5. Create a linear model, with equation:
#    qchat_fake_lin_outcome ~ 1 + qchat_fake_score1
#    Summarize this linear model
#    Create an Effects object with effects package and predictor var
#        qchat_fake_score1
#    Plot this object


# Part 1
# 1. Read in qchat dataset from the datasets folder
#    assign the dataset to "qchat"












#### Solution Part 1 ####
qchat <- read.csv("./datasets/qchat-10.csv", stringsAsFactors = FALSE)



# Part 2
# 2. Get the unique frequency count of values from the column: 
#    "Who_completed_the_test" using table()












#### Solution Part 2 ####
table(qchat$Who_completed_the_test)



# Part 3
# 3. Recode the "Health care professional" values to "Health Care Professional"
#    in the "Who_completed_the_test" column with ifelse() to clean values












#### Solution Part 3 ####
qchat$Who_completed_the_test <- 
  ifelse(qchat$Who_completed_the_test == "Health care professional", 
         "Health Care Professional", qchat$Who_completed_the_test)


# Part 4
# 4. ggplot2 - plot geom_points with
#    x = qchat_fake_score1
#    y = qchat_fake_lin_outcome
#    color = Who_completed_the_test













#### Solution Part 4 ####
# Load in ggplot2
library("ggplot2")
ggplot(data = qchat) +
  geom_point(mapping = aes(
    x = qchat_fake_score1,
    y = qchat_fake_lin_outcome,
    color = Who_completed_the_test
    )
  )
# Attend to the correct number of closing parenthesis



# Part 5
# 5. Create a linear model, with equation:
#    qchat_fake_lin_outcome ~ 1 + qchat_fake_score1
#    summarize this linear model
#    Create an Effects object with effects package and predictor var
#        qchat_fake_score1
#    Plot this object











#### Solution Part 5 ####
# Create Linear Model
mod <- lm(qchat_fake_lin_outcome ~ 1 + qchat_fake_score1,
   data = qchat)
# Summarize
summary(mod)

# If R version 3.5 or greater
# Create Effects Object with Effect()
library("effects")
eff <- Effect(c("qchat_fake_score1"), mod)
# Plot model with Effects object
plot(eff)

# If R version 3.4 or older
# Plot model with abline instead of Effect()
plot(qchat$qchat_fake_score1, qchat$qchat_fake_lin_outcome, col = "blue")
abline(mod)
