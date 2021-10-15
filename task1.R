#loading the data
iris
attach(iris)
Species
head(iris) # to view first few rows of iris dataset
summary(iris) ## summarizing the data
dim(iris) # data contains 150 rows and 5 columns
names(iris) # column names

# visualizing histogram of all the levels to understand
# the distribution of each attribute
par(mfrow=c(1,4))
hist(Sepal.Length,
     col='red',
     main='Sepal length',
     xlab='Length',
     ylab='Frequency')
hist(Petal.Length,
     col='red',
     main='Petal length',
     xlab='Length',
     ylab='Frequency')
hist(Sepal.Width,
     col='red',
     main='Sepal Width',
     xlab='Length',
     ylab='Frequency')
hist(Petal.Width,
     col='red',
     main='Petal Width',
     xlab='Length',
     ylab='Frequency')

# we can also use boxplot to give a clear idea of
# distribution of input variables
par(mfrow=c(1,4))
boxplot(Sepal.Length, xlab = "sepal length")
boxplot(Sepal.Width, xlab = "sepal Width")
boxplot(Petal.Length, xlab = "Petal length")
boxplot(Petal.Width, xlab = "Petal Width")

count(iris, Species) # load dplyr package
                     # to find the number of rows belonging to 
                     # each class
                     
#scatterplot of sepal width vs. sepal length
plot(Sepal.Width, Sepal.Length,
     col='blue',
     main='Scatterplot',
     xlab='Sepal Width',
     ylab='Sepal Length',
     pch = 16)

#scatterplot of Petal width vs. Petal length
plot(Petal.Width, Petal.Length,
     col='blue',
     main='Scatterplot',
     xlab='Petal Width',
     ylab='Petal Length',
     pch = 16)

# shows scatter plot matrix of all pairs of attributes
#This can be helpful to spot structured relationships
#between input variables.
group = data.frame(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
group
pairs(group, col = "red")

par(mfrow=c(1,2))
#distribution of values for sepal length for each species.
boxplot(Sepal.Length ~ Species) 
# sepal length tends to be largest for the virginica 
#species and smallest for the setosa species.
# outliers present in virginica

#distribution of values for sepal width for each species.
boxplot(Sepal.Width ~ Species) 
# sepal Width tends to be largest for the setosa
#species and smallest for the versicolor species.
# outliers present in setosa

#distribution of values for Petal length for each species.
boxplot(Petal.Length ~ Species) 
# petal width tends to be largest for the virginica
#species and smallest for the setosa species.
# outliers present in versicolor and setosa

#distribution of values for Petal width for each species.
boxplot(Petal.Width ~ Species) 
# Petal Width tends to be largest for the virginica
#species and smallest for the setosa species.
# outliers present in setosa


## K-NN classification
data = iris
attach(data)
data$Species
count(data, Species) # load dplyr

# Encoding the target feature as factor
data$Species = factor(data$Species,
                      levels = c("setosa", "versicolor", "virginica"),
                      labels = c(1, 2, 3))
data

## we split the data into training set and test set
## install and load "caTools" package
set.seed(123)
split = sample.split(data$Species, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

# Feature Scaling 
training_set[-5] = scale(training_set[-5])
test_set[-5] = scale(test_set[-5])

# Fitting K-NN to the Training set and Predicting the Test set results
library(class)
y_pred = knn(train = training_set[, -5],
             test = test_set[, -5],
             cl = training_set[, 5],
             k = 5,
             prob = TRUE)
y_pred

# confusion matrix
# cm shows the number of correct predictions and 
# wrong predictions
cm = table(test_set[, 5], y_pred)
cm # so we have 12 + 11 + 11 = 34 correct predictions
# and 1 + 1 = 2 incorrect predictions


