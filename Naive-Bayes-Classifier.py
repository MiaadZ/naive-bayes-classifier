import pandas as pd
import numpy as np
from scipy.stats import norm
import matplotlib.pyplot as plt

# Read Excel File from the input
data = pd.read_excel('dataset.xlsx')

# Making a For Loop Based on the number of columns and rows
length = np.shape(data)
for_length_columns = length[1]

# Creating Empty DataFrame for later use
w0_column = pd.DataFrame()
w1_column = pd.DataFrame()

# Calculating P(w0) and P(w1)
pw0 = len(data.query('W == 0')) / len(data)
pw1 = len(data.query('W == 1')) / len(data)

w0_normal_pdf = 1
w1_normal_pdf = 1

# For Loop considering length of columns without the
# last column which contains the class labels
for i in range(for_length_columns - 1):

    # Choosing a column in each rotation with the labels column
    column = data.iloc[:, [i, for_length_columns-1]]

    # Seperating the column records based on class labels
    w0_column = column.query('W == 0')
    w1_column = column.query('W == 1')

    # Fetching Firt Column
    w0_column = w0_column.iloc[:, [0]]
    w1_column = w1_column.iloc[:, [0]]
    
    # Calculating the Average of the Feature records
    # axis=0 for columns and axis=1 for rows
    w0_column_average = w0_column.mean(axis=0)
    w1_column_average = w1_column.mean(axis=0)
    
    # Calculating the Sigma of the Feature records
    w0_column_sigma = w0_column.std(axis=0)
    w1_column_sigma = w1_column.std(axis=0)

    test = [80, 11]
    #Calculating the normal probabilistic density function
    w0_normal_pdf *= norm.pdf(test[i], w0_column_average, w0_column_sigma)
    w1_normal_pdf *= norm.pdf(test[i], w1_column_average, w1_column_sigma)

# Multiplying the answer with P(w0) and P(w1)
w0_normal_pdf = np.multiply(pw0, w0_normal_pdf)
w1_normal_pdf = np.multiply(pw1, w1_normal_pdf)

# Output
if w1_normal_pdf > w0_normal_pdf:
    print("Naive Bayes Prediction Passed")
else:
    print("Naive Bayes Prediction Failed")