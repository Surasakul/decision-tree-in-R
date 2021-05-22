# decision-tree-in-R

**install packages**  
install.packages(c("rpart", "rpart.plot"))  
library(rpart)  
library(rpart.plot)  

**train decision tree**  
treeModel <- rpart(y ~ x1 + x2 + x3, data = data, method = "class")  

**plot decision tree (image shown below)**  
rpart.plot(treeModel)
