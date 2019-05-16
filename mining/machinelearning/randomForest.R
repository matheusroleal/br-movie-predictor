# install.packages("randomForest")
library(randomForest)

# Training dataset extracted
csv_train = read.csv(file="dataset/trainData.csv", header=FALSE, sep=",")
dt_train = data.frame(csv_train)

# Test dataset extracted
csv_test = read.csv(file="dataset/testData.csv", header=FALSE, sep=",")
dt_test = data.frame(csv_test)


summary(dt_test)
summary(dt_train)

# Create a Random Forest model with default parameters
model1 <- randomForest(V4 ~ ., data = csv_train, importance = TRUE)

# Predicting on train set
predTrain <- predict(model1, csv_train, type = "class")
# Checking classification accuracy
mean(predTrain == csv_train$Condition)
table(predTrain, csv_train$Condition)
