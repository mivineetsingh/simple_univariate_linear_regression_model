
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


dataset = pd.read_csv('data_file.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)


from sklearn.linear_model import LinearRegression
instance = LinearRegression()
instance.fit(X_train, y_train)

y_pred = instance.predict(X_test)
print(y_pred) #This print the predicted result . Compare the predicted with the actual value

#Plots
plt.scatter(X_train, y_train, color = 'your_choice')
plt.plot(X_train, instance.predict(X_train), color = 'your_choice')
plt.title('Title of the graph')
plt.xlabel('x label')
plt.ylabel('y label')
plt.show()

plt.scatter(X_test, y_test, color = 'your_choice')
plt.plot(X_train, instance.predict(X_train), color = 'your_choice')
plt.title('Title of the graph')
plt.xlabel('x label')
plt.ylabel('y label')
plt.show()