# load the package
# install.packages("glmnet")
library(glmnet)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")

# generate a dummy-variable
direc = factor(csv$V1)
d1 = model.matrix(~direc)
ditri = factor(csv$V3)
d2 = model.matrix(~ditri)
dt = data.frame(d1,d2,csv$V2,csv$V4)

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
