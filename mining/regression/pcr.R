# load the package
# install.packages("pls")
library(pls)

# load data
csv = read.csv(file="dataset/RegressionAnalysisPreProcessing.csv", header=FALSE, sep=",")

# generate a dummy-variable
direc = factor(csv$V1)
d1 = model.matrix(~direc)
ditri = factor(csv$V3)
d2 = model.matrix(~ditri)
dt = data.frame(d1,d2,csv$V2,csv$V4)

# fit model
fit <- pcr(csv.V4~., data=dt, validation="CV")

# summarize the fit
summary(fit)

# make predictions
predictions <- predict(fit, dt, ncomp=4)

# summarize accuracy
mse <- mean((dt$csv.V4 - predictions)^2)
print(mse)
