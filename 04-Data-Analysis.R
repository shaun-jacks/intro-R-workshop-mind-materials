## Load required libraries
library("lme4")  # For creating mixed effects models
# install.packages("lme4")
library("effects")  # For plotting models
# install.packages("effects")

#-----------------------------------------------------------------------------#
#### Read in data ####
#-----------------------------------------------------------------------------#
adosm2 <- read.csv("./datasets/adosm2_scored.csv", 
                   stringsAsFactors = FALSE)

## Our dataset
head(adosm2)

#-----------------------------------------------------------------------------#
#### Basic Stats functions ####
#-----------------------------------------------------------------------------#

## Mean, Median, Standard Deviation, Summary
mean(adosm2$ados_sarb_total, na.rm = TRUE)
median(adosm2$ados_sarb_total, na.rm = TRUE)
sd(adosm2$ados_sarb_total, na.rm = TRUE)
summary(adosm2$ados_sarb_total)


## Chi-Squared Test
chisq.test(table(adosm2$clinical_outcome, adosm2$recruitment_group))

### Correlation

# Find correlation between two vars
cor.test(adosm2$ados_fake_score1, adosm2$ados_fake_lin_outcome)

#-----------------------------------------------------------------------------#
#### Linear Regression ####
#-----------------------------------------------------------------------------#


### Creating a Linear Regression Model

# We use the lm() function to create a Linear Regression Model
# The first parameter takes in an equation of the form: 
# "dependentVar ~ predictor1 + predictor2 + ..."
# So the dependentVar is a function of the predictor variables
# In order to use column names as variables in this eq., the `data` parameter takes in a dataframe as input.


# To demonstrate a linear model, we use fake ados columns within the ados
# dataframe
linearMod <- 
  lm(ados_fake_lin_outcome ~ ados_fake_score1 + ados_fake_score2,
     data=adosm2)

linearMod
### Residuals, P-Values, Coefficients, with summary()
View(linearMod)
summary(linearMod)


### Plotting the Linear Model
# create effects object
eff_fake_score1 <- Effect(c("ados_fake_score1"), linearMod)
plot(eff_fake_score1)
# Plot with residuals
eff_fake_score2 <- Effect(c("ados_fake_score2"), linearMod, residuals = TRUE)
plot(eff_fake_score2)
eff_fake_score_1_2<- Effect(c("ados_fake_score1", "ados_fake_score2"), linearMod)
plot(eff_fake_score_1_2)
# If R version 3.4 or older
# Plot model with abline instead of Effect()
plot(x = adosm2$ados_fake_score1, y = adosm2$ados_fake_lin_outcome, col = "blue")
abline(linearMod)



#-----------------------------------------------------------------------------#
#### Logistic Regression ####
#-----------------------------------------------------------------------------#
adosm2$clinical_asd <- ifelse(adosm2$clinical_outcome %in% c("Autism", "ASD"), "ASD", "Non-ASD")

adosm2$clinical_asd <- as.factor(adosm2$clinical_asd)

adosm2$clinical_asd <- relevel(adosm2$clinical_asd, ref = "Non-ASD")

mod <- glm(clinical_asd ~ 1 + ados_sarb_total,
           data = adosm2,
           family = "binomial")

eff <- Effect(c("ados_sarb_total"), mod)
plot(eff,
     axes = list(
       y = list(
         lab = "Outcome of ASD",
         ticks = list(at = c(.01, .1, .2, .4, .6, .8,  .99))))
)

# If R version 3.4 or older
# Turn the dependent variable to 0s and 1s
adosm2$clinical_asd_2 <- ifelse(as.character(adosm2$clinical_asd) == "ASD", 1, 0)
plot(x = adosm2$ados_sarb_total,
     y = adosm2$clinical_asd_2,
     xlab = "ados_sarb",
     ylab="Probability of cbe_asd")
# Create logistic regression model, same as before
g <- glm(clinical_asd_2 ~ 1 + ados_sarb_total,
         family="binomial",
         data=adosm2)
# Plot a curve with model
curve(
  predict(g, data.frame(ados_sarb_total=x), type="resp"), 
  add=TRUE
)

#-----------------------------------------------------------------------------#
#### Mixed Effects Models ####
#-----------------------------------------------------------------------------#
### Mixed Effects Logistic Regression

# analyze- logistic regression mixed effects
adosm2$clinical_asd <- ifelse(adosm2$clinical_asd %in% c("Autism", "ASD"), "ASD", "Non-ASD")
adosm2$clinical_asd <- as.factor(adosm2$clinical_asd)
adosm2$clinical_asd <- relevel(adosm2$clinical_asd, ref = "Non-ASD")
mod <- glmer(clinical_asd ~ 1 + (1|visit) + ados_sarb_total,
                   data = adosm2,
                   family = "binomial")
eff <- Effect(c("ados_sarb_total"), mod)
plot(eff,
     axes = list(
       y = list(
         lab = "CBE of ASD",
         ticks = list(at = c(.01, .1, .2, .4, .6, .8,  .99))))
)


