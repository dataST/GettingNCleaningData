

## to read raw data:

subjectTest <- read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTrain <- read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
activityLabels <- read.table("./activity_labels.txt")
features <- read.table("features.txt")

## to name columnes

rawN <- features$V2
colnames(xTest) <- rawN
colnames(xTrain) <- rawN

## extracting mean() and std()

grepN <- grepl("-(mean|std)\\(\\)", rawN)
xTest <- xTest[, grepN]
xTrain <- xTrain[, grepN]

## to merge data:

trainTbl <- data.frame(cbind(subjectTrain, yTrain, xTrain))
testTbl <- data.frame(cbind(subjectTest, yTest, xTest))
mergedData <- merge(testTbl, trainTbl, all=TRUE)

## to use descriptive activity names:

mergedData[, 2] <- activityLabels[mergedData[, 2], 2]

## Descriptive variable names:

colnames(mergedData)[1] <- "subject"
colnames(mergedData)[2] <- "activity"

## Second tidy data set with the average of each variable for each activity and each subject:

library(plyr)
finalData <- ddply(mergedData, .(subject, activity), function(x){colMeans(mergedData[, 3:68])})

## to export the final sata from Step 5:
write.table(finalData, "step5data.txt", row.name=FALSE)
