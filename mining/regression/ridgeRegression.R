# load the package
# install.packages("glmnet")
library(glmnet)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

x <- as.matrix(dt[,1:3])
y <- as.matrix(dt[,4])

# fit model
fit <- glmnet(x, y, family="gaussian", alpha=0, lambda=0.001)
plot(fit)

# summarize the fit
summary(fit)

# make predictions
y_predicted <- predict(fit, x, type="link")

# Sum of Squares Total and Error
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted - y)^2)

# R squared
rsq <- 1 - sse / sst
rsq
