# practical_machine_learning
coursera project

Practical machine learning 
The Weight Lifting Exercise Dataset provides information that it is not considered to be time series. In order to build the prediction model, I will use two most common methods, appropriate for this type of data and discussed during coursera modules. Decision tree and random forest models require the following packages: caret, randomForest, rpart and e1071 for correct work. I will also use GGally, ggplot2 and rpart.plot in the purposes of data visualization. 
After downloading data using attached links, I divided it into subsets. The ratio of 0.6 was decided to be used in partition the data. 
Ggpairs() function introduced the plot of correlation between factors, providing the preliminary analysis. 
Decision tree and random forest models were executed in a strict accordance with coursera “Practical machine learning” modules. Summary in the form of confusion matrix was presented after each model. 
Comparing two summaries, random forest model was considered to be the best. That’s why, it was used in the final analysis. 


Final prediction:
1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 
B  A  B  A  A  E  D  B  A  A  B  C  B  A  E  E  A  B  B  B 
Levels: A B C D E
