Codebook for Coursera-Getting-and-Cleaning-Data-Course-Project
================

## Introduction

This codebook describes the variables, the data, and transformations
performed to clean up the data and creating the ‘tidy\_data2.txt’ by
running the R script ‘run\_analysis.R’.

## Description of the data

The data set is obtained from the Human Activity Recognition Using
Smartphones Data Set at The UCI Machine Learning Repository.

The following link to for downloading the data set zipfile:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

For each record it is provided: 1. Triaxial acceleration from the
accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope. 3. A 561-feature vector
with time and frequency domain variables. 4. Its activity label. 5. An
identifier of the subject who carried out the experiment.

The dataset includes the following files: 1. ‘README.txt’ 2.
‘features\_info.txt’: Shows information about the variables used on
the feature vector. 3. ‘features.txt’: List of all features. 4.
‘activity\_labels.txt’: Links the class labels with their activity
name. 5. ‘train/X\_train.txt’: Training set. 6. ‘train/y\_train.txt’:
Training labels. 7. ‘test/X\_test.txt’: Test set. 8. ‘test/y\_test.txt’:
Test labels.

Notes: 1. Features are normalized and bounded within \[-1,1\]. 2. Each
feature vector is a row on the text
file.

## Steps for Data Cleaning

### 1\. Read and Merge the training and the test sets to create one data set.

The following data files were used: - ‘features\_info.txt’ -
‘features.txt’ - ‘activity\_labels.txt’ - ‘train/X\_train.txt’ -
‘train/y\_train.txt’ - ‘test/X\_test.txt’ - ‘test/y\_test.txt’

Functions rbind() and cbind() are used to merge the data sets.

The merged data set named ‘human\_activity\_data’ has 10299 observations
of 563
variables.

### 2\. Extracts only the measurements on the mean and standard deviation for each measurement.

Select the columns with mean and std, plus columns of subject identifier
and activity identifier. Function grepl() is used to select the columns.

The extracted data set named ‘extract\_data’ has 10299 observations of
81
variables.

### 3\. Use descriptive activity names to name the activities in the data set.

Function replace() is used to apply names to the activities.

The activity lable and codes are: 1-WALKING 2-WALKING\_UPSTAIRS
3-WALKING\_DOWNSTAIRS 4-SITTING 5-STANDING
6-LAYING

### 4\. Appropriately label the data set with descriptive variable names.

Function gsub() is used to fix column name character in the following
items:

1.  replace “subject\_id” with “Subject”
2.  replace “activity\_id” with “Activity”
3.  replace “Acc” with “Accelerometer”
4.  replace “Gyro” with “Gyroscope”
5.  replace “Mag” with “Magnitude”
6.  replace “mean” with “Mean”
7.  replace “std” with “StandardDeviation”
8.  replace “Freq” with “Frequency”
9.  replace “BodyBody” with “Body”
10. replace “^t” with “Time.”
11. replace “^f” with “Frequency.”
12. remove “()”

The data set with fixed column names is named ‘tidy\_data’ and has 10299
observations of 81
variables.

### 5\. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use use function group\_by() for grouping each variable and each
activity Use function summarise\_all() to get the mean values The data
set is named ‘tidy\_data2’ and has 180 observations and 81 variables.
‘tidy\_data2’ is exported to a txt file named “tidy\_data2.txt”
