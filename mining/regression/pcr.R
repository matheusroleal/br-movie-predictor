# load the package
# install.packages("pls")
library(pls)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

y <- as.matrix(dt[,4])

# fit model
fit <- pcr(V4~., data=dt, validation="CV")

# summarize the fit
summary(fit)

# make predictions
y_predicted <- predict(fit, dt)

# Sum of Squares Total and Error
sst <- sum((y - mean(y))^2)
sse <- sum((y_predicted[,,1] - y)^2)

# R squared
rsq <- 1 - sse / sst
rsq
