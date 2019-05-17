# install.packages("mda")
library(mda)

# Training dataset extracted
csv_train = read.csv(file="dataset/trainData.csv", header=FALSE, sep=",")
dt_train = data.frame(csv_train)

# Test dataset extracted
csv_test = read.csv(file="dataset/testData.csv", header=FALSE, sep=",")
dt_test = data.frame(csv_test)

# fit model
fit <- mda(V4~., data=dt_train)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, dt_train)
# summarize accuracy
table(predictions, dt_train$V4)
mean(predictions == dt_train$V4)
