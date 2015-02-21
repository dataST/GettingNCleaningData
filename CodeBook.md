##Code Book
==============================================
###Data source: 

  * Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * Full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
###Cleaned data: step5data.txt
  
###Variables:

  * subject : The subjects who performed the activities for each window sample. Its range is from 1 to 30. 
  * activity :  Activity names. Each subject performed six activities 
              (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
  
  * The rest set of variables that were estimated from these signals are: 
    mean(): Mean value
    std(): Standard deviation

###Transformation:

  1. Read raw data.
  2. Named columnes before extracting the columns of mean() and std(), in order to make the test and train data sets have the same column names.
  3. Extracted the columns of mean() and std() from the train and test data sets.
  4. Merged subject data sets, y-data sets , and the extracted mean() and std() data sets.
  5. Assigned descriptive activity names to y-columns (activities).
  6. Assigned descriptive variable names to the columns for subjects and activities.
  7. Made the second tidy data set with the average of each variable for each activity and each subject.
