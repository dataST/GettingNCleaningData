## Project description:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## to read raw data:

subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## to name columnes before extracting the columns of mean() and std()

rawN <- features$V2
colnames(xTest) <- rawN
colnames(xTrain) <- rawN

## to extract the columns of mean() and std()

grepN <- grepl("-(mean|std)\\(\\)", rawN)
xTest <- xTest[, grepN]
xTrain <- xTrain[, grepN]

## to merge the subject column, the activity column, and extracted mean() and std() columns

trainTbl <- data.frame(cbind(subjectTrain, yTrain, xTrain))
testTbl <- data.frame(cbind(subjectTest, yTest, xTest))
mergedData <- merge(testTbl, trainTbl, all=TRUE)

## to assign descriptive activity names to the column of activities

mergedData[, 2] <- activityLabels[mergedData[, 2], 2]

## To assign descriptive variable names to the columns for subjects and activities

colnames(mergedData)[1] <- "subject"
colnames(mergedData)[2] <- "activity"

## To make the second tidy data set with the average of each variable for each activity and each subject:

library(plyr)
finalData <- ddply(mergedData, .(subject, activity), function(x){colMeans(mergedData[, 3:68])})

## to export the final data set:

write.table(finalData, "step5data.txt", row.name=FALSE)
