tidydataproject
===============

## Project for Coursera Cleaning Data Course

This project demonstrates collecting, cleaning and aggregating data from the accelerometers on Samsung Galaxy S smartphones.

## The Source Data

A full description of the complete dataset is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset itself is available at: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In brief, the data consist of 561 measurements performed on 30 subjects while engaged in 6 different activities. The data were divided into testing and training groups. The measurements and labels are contained in the following files:

* X_train.txt - measurements for training group
* X_test.txt - measurements for testing group
* Y_train.txt - activity codes for training measurements
* Y_test.txt - activity codes for testing measurements
* subject_train.txt - subject IDs for training measurements
* subject_test.txt - subjectIDs for testing measurements
* features.txt - labels for measurements
* activity_labels.txt - labels for activity codes

There is also a subfolder containing inertial data which is not used in this project.

## Creating the Tidy Dataset

The run_analysis.R script reads the source data and creates a tidy dataset for analysis.

The above files are read and combined to form a data frame containing 563 variables and 10299 observations. Next, the data frame is reduced so that it contains only the 66 variables containing mean or standard deviation values in addition to the subject and activity variables. There are several other variables labelled as …meanFreq… but because they only apply to a subset of the features and the discussion group consensus was to exclude them, these variables were not included. The activity codes were then replaced with the corresponding labels.

In an effort to keep the variable names short but still descriptive, it was decided to retain the naming convention used in the source data (features.txt). The names were “cleaned up” by removing () characters and replacing - characters with underscores, since these characters can be problematic in R.

Finally, for each subject and activity, the mean of each of the 66 feature variables is calculated. The resulting tidy dataset is written to MeanAndStddevFeatures.txt. The file uses the same format as the original data files (space separated text) and can thus be read into R using read.table.  

