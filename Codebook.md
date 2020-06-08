# Codebook for JHU Coursera Data Science Specialization
# Getting and Cleaning Data : Course Final Project


## Introduction
This codebook describe the modification of the orignial data set to produce the ***tidy_dataset.txt*** available in this repository; the codebook describe also the variable of the new tidy dataset.

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
 
 
## ETL on data
The source data are processed by the `run_analysis.R` script that produce the final tidy dataset.
The script bind the training and test dataset, bind the metadata (subject and Activity) the summarize the mean and standard deviation measures grouping on subject and activity appliyng a mean summary function.


## Output dataset variables
The final output dataset will cointain 82 feutures:

### Metadata
3 columns represents the categorical data for any measurement:

1. subject (numeric): the user associated to the measures
2. activity (numeric): the type of activty (from 1 to 6) associated to the measures
3. activity_label (character):  the description of the activity associated to the measures (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### Measures
79 columns for the measure of the associated variables; the variable name has the following ***naming convention***:

***prefix / type of measure / variable estimation / Axis***

* 1 letter prefix (t/f) time vs frequency domain

* type of mesasure: 
  * ***BodyAcc:*** body Accelleration
  * ***GravityAcc:*** graity Accelleration
  * ***BodyAccJerk:***  linear acceleration Jerk signals
  * ***BodyGyro:*** angular velocity
  * ***BodyGyroJerk:*** angular velocity Jerk signals
  * ***BodyAccMag:*** body Accelleration magnitude of these three-dimensional signals
  * ***GravityAccMag:*** graity Accelleration magnitude of these three-dimensional signals
  * ***BodyAccJerkMag:*** linear acceleration Jerk signals magnitude
  * ***BodyGyroMag:*** angular velocity magnitude
  * ***BodyGyroJerkMag:*** angular velocity Jerk signals Magnityde


* variable estimation: type of measurement applied:
  * ***mean():*** Mean value
  * ***std():*** Standard deviation
  * ***meanFreq():*** Weighted average of the frequency components to obtain a mean frequency
                
* Axis: if applicable X / Y / Z Axis of the measure


### List of measure
	* tBodyAcc-mean()-X
	* tBodyAcc-mean()-Y
	* tBodyAcc-mean()-Z
	* tBodyAcc-std()-X
	* tBodyAcc-std()-Y
	* tBodyAcc-std()-Z
	* tGravityAcc-mean()-X
	* tGravityAcc-mean()-Y
	* tGravityAcc-mean()-Z
	* tGravityAcc-std()-X
	* tGravityAcc-std()-Y
	* tGravityAcc-std()-Z
	* tBodyAccJerk-mean()-X
	* tBodyAccJerk-mean()-Y
	* tBodyAccJerk-mean()-Z
	* tBodyAccJerk-std()-X
	* tBodyAccJerk-std()-Y
	* tBodyAccJerk-std()-Z
	* tBodyGyro-mean()-X
	* tBodyGyro-mean()-Y
	* tBodyGyro-mean()-Z
	* tBodyGyro-std()-X
	* tBodyGyro-std()-Y
	* tBodyGyro-std()-Z
	* tBodyGyroJerk-mean()-X
	* tBodyGyroJerk-mean()-Y
	* tBodyGyroJerk-mean()-Z
	* tBodyGyroJerk-std()-X
	* tBodyGyroJerk-std()-Y
	* tBodyGyroJerk-std()-Z
	* tBodyAccMag-mean()
	* tBodyAccMag-std()
	* tGravityAccMag-mean()
	* tGravityAccMag-std()
	* tBodyAccJerkMag-mean()
	* tBodyAccJerkMag-std()
	* tBodyGyroMag-mean()
	* tBodyGyroMag-std()
	* tBodyGyroJerkMag-mean()
	* tBodyGyroJerkMag-std()
	* fBodyAcc-mean()-X
	* fBodyAcc-mean()-Y
	* fBodyAcc-mean()-Z
	* fBodyAcc-std()-X
	* fBodyAcc-std()-Y
	* fBodyAcc-std()-Z
	* fBodyAcc-meanFreq()-X
	* fBodyAcc-meanFreq()-Y
	* fBodyAcc-meanFreq()-Z
	* fBodyAccJerk-mean()-X
	* fBodyAccJerk-mean()-Y
	* fBodyAccJerk-mean()-Z
	* fBodyAccJerk-std()-X
	* fBodyAccJerk-std()-Y
	* fBodyAccJerk-std()-Z
	* fBodyAccJerk-meanFreq()-X
	* fBodyAccJerk-meanFreq()-Y
	* fBodyAccJerk-meanFreq()-Z
	* fBodyGyro-mean()-X
	* fBodyGyro-mean()-Y
	* fBodyGyro-mean()-Z
	* fBodyGyro-std()-X
	* fBodyGyro-std()-Y
	* fBodyGyro-std()-Z
	* fBodyGyro-meanFreq()-X
	* fBodyGyro-meanFreq()-Y
	* fBodyGyro-meanFreq()-Z
	* fBodyAccMag-mean()
	* fBodyAccMag-std()
	* fBodyAccMag-meanFreq()
	* fBodyBodyAccJerkMag-mean()
	* fBodyBodyAccJerkMag-std()
	* fBodyBodyAccJerkMag-meanFreq()
	* fBodyBodyGyroMag-mean()
	* fBodyBodyGyroMag-std()
	* fBodyBodyGyroMag-meanFreq()
	* fBodyBodyGyroJerkMag-mean()
	* fBodyBodyGyroJerkMag-std()
	* fBodyBodyGyroJerkMag-meanFreq()

