# install packages
install.packages(c("rpart", "rpart.plot"))

# load library
library(rpart)
library(rpart.plot)

# load dataset
diabetes <- read.csv("diabetes.csv")

# split data
set.seed(96)
n <- nrow(diabetes)
train_id <- sample(1:n, size = 0.8*n)
train_data <- diabetes[train_id, ]
test_data <- diabetes[-train_id, ]

# train model
TreeModel <- rpart(diabetes ~ . , data = train_data, method = "class")

# test model
p <- predict(TreeModel, newdata = test_data, type = "class")

# prediction == actual
mean(p == test_data$diabetes)

# matrix
table(p, test_data$diabetes, dnn = c("predicted","actual"))

# plot tree
rpart.plot(TreeModel)