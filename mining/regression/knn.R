# install.packages("ggplot2")
library(ggplot2)

# Training dataset extracted
csv_train = read.csv(file="dataset/trainData.csv", header=FALSE, sep=",")
dt_train = data.frame(csv_train)

# Test dataset extracted
csv_test = read.csv(file="dataset/testData.csv", header=FALSE, sep=",")
dt_test = data.frame(csv_test)

# The 2nd column of training dataset because that is what we need to predict about testing dataset
# Also convert ordered factor to normal factor
dt_target <- as.factor(dt_train[,4])

# The actual values of 2nd couln of testing dataset to compaire it with values that will be predicted
# Also convert ordered factor to normal factor
test_target <- as.factor(dt_test[,4])

# Run knn function
library(class)
pr <- knn(dt_train,dt_test,cl=dt_target,k=20)

# Create the confucion matrix
tb <- table(pr,test_target)

##check the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)