
dataset = read.csv('Salary_Data.csv')

install.packages('caTools')
library(caTools)
split = sample.split(dataset$Salary, SplitRatio = 0.75) #Give the ratio for test to train
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)




regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)


y_pred = predict(regressor, newdata = test_set)
y_pred
#Plots
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')