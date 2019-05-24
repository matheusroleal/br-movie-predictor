# load the package
# install.packages("kernlab")
library(kernlab)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

# fit model
fit <- ksvm(V4~., dt)

# summarize the fit
summary(fit)

# make predictions
predictions <- predict(fit, dt)

# summarize accuracy
mse <- mean((dt$V4 - predictions)^2)
print(mse)
