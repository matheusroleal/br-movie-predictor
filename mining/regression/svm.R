# load the package
# install.packages("kernlab")
library(kernlab)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

y <- as.matrix(dt[,4])

# fit model
fit <- ksvm(V4~., dt)

# summarize the fit
summary(fit)

# make predictions
y_predicted <- predict(fit, dt)

# Sum of Squares Total and Error
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)

# R squared
rsq <- 1 - sse / sst
rsq
