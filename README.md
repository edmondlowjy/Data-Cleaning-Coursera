## README
Coursera Data Cleaning John Hopkins University

# Data Cleaning Methodology

After reading in the respective datasets, I have combined the columns of Subject, X and y datasets such that each combined dataframe now consists of the Subject, Activity Label, and corresponding 561 measurements variables.

Once the columns have been binded for Train and Test data respectively, I have combined the rows of these datasets to form one combined dataset named combined_data. This contains 10299 observations and 563 variables - inclusive of the Subject and Activity variables on top of the 561 measurement variables.

Next, I proceed to extract the desired mean and std variables using the grep function to identify their vector location index. With the index obtained, I extract the variable names from the features.txt table and use it to name the column variables for combined_data. Note that there has been adjustment to the index to accomodate Subject and Activity Label.

In order to name the activity performed in each row observation of combined_data, there is a need to match the Activity Labels with the corresponding Activity Name. This is performed by simple vector manipulation.

Finally, the tidy data is extracted using dplyr package - grouping and summarizing.

To ensure that the functions are called correctly, I have also added a step of manual checking using Subject 1 and the 66 measurements made for 'Laying' activity.
