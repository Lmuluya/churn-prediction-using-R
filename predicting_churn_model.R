# install.packages("randomForest")
# install.packages("plyr")
# install.packages("corrplot")
# install.packages("ggplot2")
# install.packages("gridExtra")
# install.packages("ggthemes")
# install.packages("caret")
# install.packages("party")
# install.packages("randomForest")
# install.packages("sandwich")

library(plyr)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(caret)
library(MASS)
library(randomForest)
library(party)
library(sandwich)

churn_df <- read.csv('Churn_RCODE.csv')
head(churn_df)
str(churn_df)
# Going to use sapply to check the number of missing values in all coll

sapply(churn_df, function(x) sum(is.na(x)))

# Removing all the rows with missing values from total charges column
churn_df$TotalCharges[is.na(churn_df$TotalCharges)]
churn_df$TotalCharges[is.na(churn_df$TotalCharges)] <- mean(churn_df$TotalCharges, na.rm = TRUE)
churn_df$TotalCharges[is.na(churn_df$TotalCharges)]

# Removing missing values from the mobile service variables defaulting them to "Yes"
table(churn_df$Mobile_Service)
churn_df$Mobile_Service[is.na(churn_df$Mobile_Service)] <- "Yes"

churn_df <- churn_df[complete.cases(churn_df), ]

sapply(churn_df, function(x) sum(is.na(x)))
