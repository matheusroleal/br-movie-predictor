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
model1 <- randomForest(V4 ~ ., data = dt_train, importance = TRUE)

# Predicting on train set
predTrain <- predict(model1, dt_train, type = "class")

# Checking classification accuracy
mean(predTrain == dt_train$V4)
table(predTrain, dt_train$V4)
