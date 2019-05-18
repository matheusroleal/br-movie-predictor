# install.packages("randomForest")
library(randomForest)

# Training dataset extracted
csv = read.csv(file="dataset/machineLearningPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

summary(dt)

# Create a Random Forest model with default parameters
model1 <- randomForest(V4 ~ ., data = dt, importance = TRUE)

# Predicting on train set
predTrain <- predict(model1, dt, type = "class")

# Checking classification accuracy
mean(predTrain == dt$V4)
table(predTrain, dt$V4)
