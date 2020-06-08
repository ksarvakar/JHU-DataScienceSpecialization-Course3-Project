# run_analysis.R script for the final project course of JHU Coursera Getting and Cleaning Data
# SCOPE:
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load Libraries
library(dplyr)
library(utils)

#Download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile=temp,method="libcurl")


## READING DATASET PARTS
   #Read Training and test dataset
   X_test_dataset<- read.table(unzip(temp, files ="UCI HAR Dataset/test/X_test.txt", list = FALSE))
   X_train_dataset<- read.table(unzip(temp, files ="UCI HAR Dataset/train/X_train.txt", list = FALSE))
   
   #Names for dataset Variables
   features_names<- read.table(unzip(temp, files ="UCI HAR Dataset/features.txt", list = FALSE))
   colnames(features_names) <- c("feat_num", "feat_name")
   
   
   #y dataset are the activities the measurement refers to
   y_test_dataset<- read.table(unzip(temp, files ="UCI HAR Dataset/test/y_test.txt", list = FALSE))
   y_train_dataset<- read.table(unzip(temp, files ="UCI HAR Dataset/train/y_train.txt", list = FALSE))
   
   # from the file subject* get the user for any dataset row;
   subject_train<- read.table(unzip(temp, files ="UCI HAR Dataset/train/subject_train.txt", list = FALSE))
   subject_test<- read.table(unzip(temp, files ="UCI HAR Dataset/test/subject_test.txt", list = FALSE))
   
   
   # get descriptive activities from activity_labels.txt
   activity_labels <- read.table(unzip(temp, files ="UCI HAR Dataset/activity_labels.txt", list = FALSE))
   colnames(activity_labels) <-  c("activity", "activity_label")
   
### END READING DATASET PARTS   

#1. Merges the training and the test sets to create one data set
   
   # merge Training and test ds
   full_data_set <- rbind(X_test_dataset, X_train_dataset)
   # naming variables
   colnames(full_data_set) <- features_names$feat_name
   
   #Add the activity column (y_* dataset)
   y_full_data_set <- rbind(y_test_dataset, y_train_dataset)
   colnames(y_full_data_set) <-c("activity")
   full_data_set <- cbind(y_full_data_set,full_data_set)
   
   # Add the subject to the dataset
   subject_full_data_set <- rbind(subject_test, subject_train)
   colnames(subject_full_data_set) <- c("subject")
   full_data_set <- cbind(subject_full_data_set,full_data_set)




#2. Extracts only the measurements on the mean and standard deviation for each measurement
# We keep also the subject and activity columns
    mean_sd_dataset <- full_data_set[,grepl("subject|activity|mean|std", colnames(full_data_set))]

# 3.Uses descriptive activity names to name the activities in the data set
    #add the descriptive label using left join considering possible missing labels
    mean_sd_dataset <- left_join(mean_sd_dataset,activity_labels, by=c("activity"="activity"))
    mean_sd_dataset <- mean_sd_dataset %>% select(subject, activity, activity_label, everything()) #metadata column at the beginning of the data set

# 4.Appropriately labels the data set with descriptive variable names
  #already done building the dataset with colnames assignement
      
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
activity_subject_means_dataset <- mean_sd_dataset %>% group_by(subject, activity, activity_label) %>% summarise_all(list(~mean(.,na.rm=TRUE)))

#save the file to temp dataset
write.table(activity_subject_means_dataset, file=paste0(tempdir(), "/tidy_dataset.txt"), row.name=FALSE)
write.table(activity_subject_means_dataset, file=paste0("./tidy_dataset.txt"), row.name=FALSE) #local copy to directly syncronyze with github

unlink(temp)