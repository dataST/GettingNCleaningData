### Getting and Cleaning Data - Course project

This is a part of the course project of Getting and Cleaning Data: The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

The project instructions is:
 "You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set 
        with the average of each variable for each activity and each subject."

The provided raw data for the project is a compressed files and folders:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The unzipped folder 'UCI HAR Dataset' includes 2 folders, 'test' and 'train,' and 4 text files, 'activity_labels', 'features', 'features_info', and 'README.'

####[run-analysis.R]

The R script includes the codes for the following processes to make an independent tidy data set as instructed:

1. Reads raw files:

  * 'subjectTest'/'subjectTrain' from subject_test.txt/subject_train.txt - for subjects' IDs (participants)
  * 'xTest'/'xTrain' from X_test.txt/X_train.txt - for measured data
  * 'yTest'/'yTrain' from y_test.txt/y_train.txt - for activity types
  * 'features' from features.txt - for column names of the new data set
  * 'activityLabels' from activit_labels.txt - for descriptive activity names to name te activities in the new data set

2. Names each column of xTest and xTrain and extract the columns of mean() and std().

3. Merges columns:
  * the subject column from subjectTest/subjectTrain
  * the activity column from yTest/yTrain
  * the extracted columsn from xTest/xTrain

4. Assigns descriptive activity names from 'activityLabels' to the column of activity names (2nd column).

5. Assigns the names, 'subject' and 'activity,' to the 1st and 2nd columns.

6. Opens the package 'plyr' and runs 'ddply' to split the merged data frame to the subsets of subjects and activities and calculate the column means for each subset.

7. Exports the resulting data set to a text file, 'step5data.txt.'
