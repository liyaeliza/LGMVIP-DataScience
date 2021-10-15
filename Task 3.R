
# Decision Tree Regression

## Task 3 - Decision tree with iris dataset
data = iris
attach(data)

#loading required packages
library(caTools)
library(rpart)
library(ggplot2)

# splitting the dataset into training and test set
split = sample.split(data$Species, SplitRatio = 2/3)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

# buidling model using training set
library(rpart)
regressor = rpart(formula = Species ~ .,
                  data = training_set,
                  method = "class")
regressor

# install rpart.plot package to visualise the above result as a tree
library(rpart.plot)
rpart.plot(regressor)


#predicting new result with decision tree regression
y_pred = predict(regressor, test_set, type = "class")
y_pred

# making confusion matrix to find out how real are these predictions
cm = table(test_set$Species, y_pred)
cm
# we see there are 3 incorrect predictions in versicolor and virginica


# Visualising the Regression Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$Sepal.Length, y = y_pred, color = "red")) +
  geom_point(aes(x = test_set$Sepal.Width, y = y_pred, color = "blue")) +
  geom_point(aes(x = test_set$Petal.Length, y = y_pred, colour = "yellow")) +
  geom_point(aes(x = test_set$Petal.Width, y = y_pred, color = "green"))+
  ggtitle("Decision Tree Regression") +
  xlab('Levels') +
  ylab('Species')




  