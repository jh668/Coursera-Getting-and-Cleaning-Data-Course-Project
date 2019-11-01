# Coursera-Getting-and-Cleaning-Data-Course-Project

## Introduction
The purpose of this project is to collect, work with, and clean a data set. The data set is obtained from the Human Activity Recognition Using Smartphones Data Set at The UCI Machine Learning Repository. The goal is to prepare tidy data that can be used for later analysis. 

This repo contains the following files:
1. 'README.md': provides info on the data set and the data cleaning process.
2. 'run_analysis.R': is the R script for performing the analysis.
3. 'CodeBook.Rmd': describes the variables, the data, and transformations or work that were performed to clean up the data.
4. 'tidy_data2.txt': a tidy data set created by running run_analysis.R.

## Data Information
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Here are more info on the data:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details

## run_analysis.R Information
The R script that called 'run_analysis.R' does the following:
1. Downloads and unzip the data.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.