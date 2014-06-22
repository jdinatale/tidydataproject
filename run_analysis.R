## R script downloads, collects, cleans and aggregates accelerometer data from the
## Samsung Galaxy S smartphone.

## Check for data in current directory and download and unzip if not present.
if (!file.exists("./UCI HAR Dataset")){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile = "HAR.zip", method = "curl")
    unzip("HAR.zip")
}

## Read in data files
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

## Combine files into single dataset (Step 1)
dataset <- rbind(cbind(trainSubject, trainY, trainX), cbind(testSubject, testY, testX))

## Add column names to dataset 
names(dataset) <- c("subject", "activity", features[,2])

## Extract measurements containing means and standard deviations and limit dataset
## to only those measurements (Step 2)
meanstdFeatures <- (grepl("mean\\(\\)|std\\(\\)", features[,2]))
dataset <- dataset[, c(TRUE, TRUE, meanstdFeatures)]

## Replace numeric activity codes with labels (Step 3) 
dataset$activity <- activityLabels[dataset$activity,2]

## Remove ( and ) characters from variable names and replace - characters with underscores (Step 4)
names(dataset) <- gsub("\\(|\\)", "", names(dataset))
names(dataset) <- gsub("\\-", "_", names(dataset))

## Create a second, tidy dataset with means of each measurement for each subject and activity (Step 5)
tidyset <- aggregate(.~subject + activity, FUN=mean, data=dataset)

## Write tidy dataset to a .txt file
write.table(tidyset,"MeanAndStdevFeatures.txt",row.names=FALSE)
