# load the package
# install.packages("pls")
library(pls)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")
dt = data.frame(csv)

# fit model
fit <- pcr(V4~., data=dt, validation="CV")

# summarize the fit
summary(fit)

# make predictions
predictions <- predict(fit, dt, ncomp=4)

# summarize accuracy
mse <- mean(dt$V4 == predictions)
print(mse)
