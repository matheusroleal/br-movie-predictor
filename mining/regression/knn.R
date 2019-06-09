# install.packages("caret")
library(caret)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

ran <- sample(1:nrow(dt),0.9 * nrow(dt))

# Test dataset extracted
dt_train <- dt[ran,]
dt_test <- dt[-ran,]

# The 2nd column of training dataset because that is what we need to predict about testing dataset
# Also convert ordered factor to normal factor
dt_target <- as.factor(dt_train[,4])

# The actual values of 2nd couln of testing dataset to compaire it with values that will be predicted
# Also convert ordered factor to normal factor
test_target <- as.factor(dt_test[,4])

# Run knn function
library(class)
pr <- knn3Train(dt_train[,-4], dt_test[,-4], dt_target, k = 5, prob = TRUE)

# Create the confucion matrix
tb <- as.matrix(table(test_target,pr))

# check the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)
