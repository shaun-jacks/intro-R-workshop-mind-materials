##### Combining all lessons ####
## Overview
# 1. Read in qchat dataset
# 2. Get the unique frequency count of values from the column: 
#    "Who.completed.the.test" with table()
# 3. Recode the "Health care professional" values to "Health Care Professional"
#    in the "Who.completed.the.test" column with ifelse() to clean values
# 4. ggplot2 - plot geom_points with
#    x = qchat_fake_score1
#    y = qchat_fake_lin_outcome
#    color = Who_completed_the_test
# 5. Create a linear model, with equation:
#    qchat_fake_lin_outcome ~ 1 + qchat_fake_score1


# Part 1
# 1. Read in qchat dataset







#### Solution Part 1 ####
qchat <- read.csv("./datasets/qchat-10.csv", stringsAsFactors = FALSE)




# Part 2
# 2. Get the unique frequency count of values from the column: 
#    "Who.completed.the.test" with table()







#### Solution Part 2 ####
table(qchat$Who_completed_the_test)





# Part 3
# 3. Recode the "Health care professional" values to "Health Care Professional"
#    in the "Who.completed.the.test" column with ifelse() to clean values







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



# Part 5
# 5. Create a linear model, with equation:
#    qchat_fake_lin_outcome ~ 1 + qchat_fake_score1













#### Solution Part 5 ####
library("effects")
# Create Linear Model
mod <- lm(qchat_fake_lin_outcome ~ 1 + qchat_fake_score1,
   data = qchat)
# Summarize
summary(mod)
# Create Effects Object with Effect()
eff <- Effect(c("qchat_fake_score1"), mod)
# Plot model with Effects object
plot(eff)

