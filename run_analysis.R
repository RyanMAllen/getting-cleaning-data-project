##      run_analysis.R does the following to the UCI HAR Dataset:

##      1.Merges the training and the test sets to create one data set.
##      2.Extracts only the measurements on the mean and standard deviation for each measurement.
##      3.Uses descriptive activity names to name the activities in the data set
##      4.Appropriately labels the data set with descriptive variable names.
##      5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## Loading labels and functions
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])  
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Mean and Standard Deviation Data only
desiredFeatures <- grep(".*mean.*|.*std.*",features[,2])
desiredFeatures.names <- features[desiredFeatures,2]
desiredFeatures.names = gsub('-mean','Mean',desiredFeatures.names)
desiredFeatures.names = gsub('-std','STD',desiredFeatures.names)
desiredFeatures.names = gsub('[-()]','', desiredFeatures.names)


## Loading the datasets
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subjectTrain,yTrain, xTrain)

xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subjectTest,yTest,xTest)


##Merging Data into one useful dataset complete with labels
combinedData <- rbind(train,test)
colnames(combinedData) <- c("subject","activity",desiredFeatures.names)

combinedData$activity <- factor(combinedData$activity,levels = activityLabels[,1],labels = activityLabels[,2])
combinedData$subject <- as.factor(combinedData$subject)

combinedDataMelted <- melt(combinedData, id= c("subject","activity"))
combinedDataMean <- dcast(combinedDataMelted, subject+activity~ variable,mean)

write.table(combinedDataMean, "tidy.txt", row.names = FALSE,quote = FALSE)
