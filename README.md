# Jonh Hopkins University (Coursera online Training)
# Data Science Specialization - Course 3
# Getting and Cleaning Data : Course Final Project


## Introduction
This repository contains my code and the output dataset for the final project of the JHU coursera Getting and cleaning Data Course.
The data represents data collected from Smartphones througth accelerometes and gyroscope to tracking human activity.

## Project Scope
The goal is to prepare tidy data that can be used for later analysis starting from a public data repository producing a tidy dataset.

The project requirements are:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Source Data
The source data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: [Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Here are the data for the project: [Project zip source Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The following files from the initial dataset is used:

 1. ***train/X_train.txt:*** includes the measurements of the features in train set 
 2. ***test/X_test.txt:*** includes the measurements of the features in test set
 3. ***features.txt:*** includes the descriptions for features measured for the X_* dataset
 4. ***train/subject_train.txt:*** subject for each measurement from the train set
 5. ***test/subject_test.txt:*** subject for each measurement from the test set
 6. ***train/y_train.txt:*** activity (from 1 to 6) for each measurement from the train set
 7. ***test/y_test.txt:*** activity (from 1 to 6) for each measurement from the test set
 8. ***activity_labels.txt:*** descriptions for activities

# Script Steps.
The script `run_analysis.R` will work on temp directory and will execute the following steps

1. download source zip dataset to a ***temp*** file
2. read all the dataset to local objects
3. bind training and test dataset, retreive measures columns names from features.txt and assign to the dataset
4. adding subject variable and y (activity) variables to the dataset then joining the descriptive description for the activities
5. selecting only metadata (subject and activities), mean and standard deviation measure 
6. create a new dataset grouping subject and activity and summarising as mean
7. spool to temp file ***the new tidy dataset***

