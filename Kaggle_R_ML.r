# BACK TO BASICS

# Calculate 3 + 4
3 + 4

# Calculate 6 + 12
6 + 12

# Assign the training set
train <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/train.csv"))
  
# Assign the testing set
test <- read.csv(url("http://s3.amazonaws.com/assets.datacamp.com/course/Kaggle/test.csv"))
  
# Make sure to have a look at your training and testing set
print(train)
print(test)

# Your train and test set are still loaded in
str(train)
str(test)

# absolute numbers
#table(train$Survived)
# percentages
#prop.table(table(train$Survived))

# row-wise proportions
#prop.table(table(<var_1>, <var_2>),1)
# column-wise proportions
#prop.table(table(<var_1>, <var_2>),2)



# Passengers that survived vs passengers that passed away

prop.table(table(train$Survived))
table(train$Survived)

# Males & females that survived vs males & females that passed away

# column-wise proportions: prop.table(table(<var_1>, <var_2>),2)

table(train$Sex,train$Survived)
prop.table(table(train$Sex,train$Survived),1)


# Your train and test set are still loaded in
str(train)
str(test)

# Create the column child, and indicate whether child or no child

#To add this new variable you need to do two things (i) create a new column, and (ii) provide the values for each observation (i.e., row) based on the age of the passenger

train$new <- 10
#would create a new column in the train data frame with the value 10 for each observation.

#To set the values based on the age of the passenger, you make use of a boolean test inside the square bracket operator. With the []-operator you create a subset of rows and assign a value to a certain variable of that subset of observations. For example,

train$new[train$Survived == 1] <- 0

train$Child <- NA
train$Child[train$Age < 18] <- 1 # passanger is a child
train$Child[train$Age >= 18] <- 0 # passanger is not a child

# Two-way comparison

prop.table(table(train$Child, train$Survived),1)


# Your train and test set are still loaded in
str(train)
str(test)

# prediction based on gender 
test_one <- test

test_one$Survived <- NA

str(test_one)

# prediction based on gender
# male[2] = 0 and female[1] = 1

test_one$Survived[test_one$Sex == 'male'] <- 0

test_one$Survived[test_one$Sex == 'female'] <- 1

str(test_one)

#Intro to decision trees

#In the previous chapter you did all the slicing and dicing yourself to find subsets that have a higher chance of surviving. A decision tree automates will automate this process for you, and outputs a flowchart-like structure that is easy to interpret (you'll make one yourself in the next exercise).
#Conceptually, the decision tree algorithm starts with all the data at the root node and scans all the variables for the best one to split on. Once a variable is chosen, you do the split and go down one level (or one node) and repeat. The final nodes at the bottom of the decision tree are known as terminal nodes, and the majority vote of the observations in that bucket determine how to predict for new observations that end up in that terminal node.
#To create your first decision tree, you make use of R's rpart package. R packages are a collection of functions, data and compiled code that make your life easier. Namely, instead of needing to write the algo yourself you just use the rpart R package and its included decision tree algorithm.
library(rpart)

# You will use the the rpart() function inside of the rpart package to build your first decision tree. The rpart() function takes multiple arguments (type in ?rpart and discover it yourself):

# formula: The variable of interest, and the variables used for prediction. You write this down as formula = Survived ~ Sex + Age.
#data: The data set used to build the decision tree (here train).
#method: Type of prediction you want. Here you predict a categorical variable (dead or alive) and therefore stipulates method = "class".
#So to summarize, your code would look something like this:

my_tree <- rpart(Survived ~ Sex + Age, data=train, method="class")
				 

# Your train and test set are still loaded in
str(train)
str(test)

# Build the decision tree
my_tree_two <- rpart(Survived ~ Sex + Age,data=train, method="class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Load in the packages to create a fancified version of your tree
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Time to plot your fancified tree
fancyRpartPlot(my_tree_two)

 Your train and test set are still loaded in
str(train)
str(test)

# Build the decision tree
#variable of intrest:Survived
#variable of prediction:  Passenger Class, Sex, Age, Number of Siblings/Spouses Aboard, Number of Parents/Children Aboard, Passenger Fare and Port of Embarkation

my_tree_two <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,data=train, method="class")

# Visualize the decision tree using plot() and text()
plot(my_tree_two)
text(my_tree_two)

# Load in the packages to create a fancified version of your tree
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# Time to plot your fancified tree
fancyRpartPlot(my_tree_two)


# Make your prediction using the test set
my_prediction <- predict(my_tree_two, test, type="class")
str(my_prediction)

# Create a data frame with two columns: PassengerId & Survived. Survived contains your predictions
my_solution <-  data.frame(my_prediction)

# Check that your data frame has 418 entries

# Write your solution to a csv file with the name my_solution.csv
#write.csv(___, ___ , ___)


# Make your prediction using the test set
my_prediction <- predict(my_tree_two, test, type = "class")

# Create a data frame with two columns: PassengerId & Survived. Survived contains your predictions
my_solution <- data.frame(PassengerId = test$PassengerId, Survived = my_prediction)

# Check that your data frame has 418 entries
nrow(my_solution)

# Write your solution to a csv file with the name my_solution.csv
write.csv(my_solution, file = "my_solution.csv", row.names = FALSE)
