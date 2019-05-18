# install.packages("nnet")
library(nnet)

# Training dataset extracted
csv = read.csv(file="dataset/machineLearningPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

# Fitting model
fit <- nnet(V4~., data=dt, size=10, decay=0.0001, maxit=500)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, dt, type="class")
# summarize accuracy
table(predictions, dt$V4)
mean(predictions == dt$V4)
