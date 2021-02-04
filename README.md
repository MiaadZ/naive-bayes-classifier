# Naive Bayes Classifier

Naive Bayes Classifier using python and matlab designed based on Excel file input

## installation

Use the command below to install required packages refering to requirements.txt:

```bash
pip install -r requirements.txt
```

### Discription

Excel file contains rows and columns which are features and labels which can be modified.

Example:

Consider we want to predict which students will be qualified and pass the course, we have 2 labels, first (column) is the IQ and second (column) is the Student Mark for the course, every row includes IQ and Mark for each student, the last column is the label whether the student passes the course (1) or fails (0).

Naive Bayes will be trained based on the information and after that we pass a test case to it (e.g: [120, 13]) and it will predict if the student with specified info passes or fails the test.
