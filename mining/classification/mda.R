# install.packages("mda")
library(mda)

# Training dataset extracted
csv = read.csv(file="dataset/machineLearningPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

# fit model
fit <- mda(V4~., data=dt)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, dt)
# summarize accuracy
table(predictions, dt$V4)
mean(predictions == dt$V4)
