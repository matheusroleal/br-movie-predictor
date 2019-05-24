# load the package
# install.packages("glmnet")
library(glmnet)

# Dataset extracted
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

x <- as.matrix(dt[,1:3])
y <- as.matrix(dt[,4])
# fit model
fit <- glmnet(x, y, family="gaussian", alpha=0, lambda=0.001)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, x, type="link")
# summarize accuracy
mse <- mean((y - predictions)^2)
print(mse)
