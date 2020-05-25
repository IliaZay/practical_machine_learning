#download packages
library(caret)
library(forecast)
library(GGally)
library(ggplot2) 
library(randomForest)
library(rpart)
library(rpart.plot)
library(e1071)

set.seed(1234)

#download data
training_load_url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv'
testing_load_url <- 'https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv'

training <- read.csv(url(training_load_url), na.strings=c("NA","#DIV/0!",""))
original_testing <- read.csv(url(testing_load_url), na.strings=c("NA","#DIV/0!",""))

#preprocessing data&create data & data partitioning
training <- training[,colSums(is.na(training)) == 0]
original_testing <- original_testing[,colSums(is.na(original_testing)) == 0]

training <- training[,-c(1:7)]
original_testing <- original_testing[,-c(1:7)]

traintrainset <- createDataPartition(y=training$classe, p=0.6, list=FALSE)
TrainTrainingSet <- training[traintrainset, ] 
TestTrainingSet <- training[-traintrainset, ]

#check correlation of factors 
ggpairs(as.data.frame(training[,1:8]))

#####
#Decision Tree model
model_1 <- rpart(classe ~ ., data=TrainTrainingSet, method="class")
prediction_1 <- predict(model_1, TestTrainingSet, type = "class")

# Plot
rpart.plot(model_1, main="Classification Tree", extra=102, under=TRUE, faclen=0)

#Summary of the model
confusionMatrix(prediction_1, TestTrainingSet$classe)

#####
#Random Forest
model_2 <- randomForest(classe ~. , data=TrainTrainingSet, method="class")
prediction_2 <- predict(model_2, TestTrainingSet, type = "class")


#Summary
confusionMatrix(prediction_2, TestTrainingSet$classe)

#####
#Cocnlusion 
final_prediction <- predict(model_2, original_testing, type="class")
final_prediction

