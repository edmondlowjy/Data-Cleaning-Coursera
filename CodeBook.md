# CodeBook
Coursera Data Cleaning John Hopkins University

## Data Sets

The following datasets and its corresponding description are required for this assignment:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Explanation on use of Data Sets

- features.txt contains acceleration signals measured in XYZ-coordinates. There are 561 observations representing the different types of measurements made.
- X_train.txt and correspondingly X_test.txt contains the 561 measurement variables for different subjects performing different activities. Each row observation represents the 561 measurements made for one subject performing one particular activity.
- y_train.txt and correspondingly y_test.txt represents the activity labels matching each row in X_train.txt and X_test.txt. Using this and the activity_labels.txt dataset, we are able to name the activities performed on each row observation for X_train.txt and X_test.txt.
- subject_train.txt and subject.txt contains the identifier for each subject, and each row observation identifies the subject that has performed a particular activity and the corresponding 561 measurement variables made.

