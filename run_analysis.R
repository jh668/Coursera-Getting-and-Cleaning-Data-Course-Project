# Load the packages.
library(dplyr)
library(data.table)

# Download data zipfile and named it "GCD3_data.zip".
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("GCD3_data.zip")){
        download.file(zipUrl, destfile = "GCD3_data.zip", mmethod = "curl")
}

# Unzip the zipfile.
if (!file.exists("UCI HAR Dataset")) { 
        unzip("GCD3_data.zip") 
}

# Read the data set.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "variable"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity"))
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$variable)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$variable)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")


# 1. Merge the training and the test sets to create one data set.
# Use rbind to merge test set and training set.
x_merge <- rbind(x_test, x_train)

# Use cbind to merge test label and training label.
y_merge <- rbind(y_test, y_train)

# Use rbind to merge test subject and training subject.
subject_merge <- rbind(test_subject, train_subject)

# Use cbind to merge subject, x_merge, and y_merge.
human_activity_data <- cbind(subject_merge, y_merge, x_merge)


# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# Check column names of data set.
names(human_activity_data)

# Select the columns with mean and std, plus column "subject_id" and "activity_id".
selected_columns <- grepl("subject_id|activity_id|mean|std", colnames(human_activity_data))
extract_data <- human_activity_data[, selected_columns]

# 3. Use descriptive activity names to name the activities in the data set.
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "1", "WALKING")
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "2", "WALKING_UPSTAIRS")
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "3", "WALKING_DOWNSTAIRS")
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "4", "SITTING")
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "5", "STANDING")
extract_data$activity_id <- replace(extract_data$activity_id, extract_data$activity_id == "6", "LAYING")


# 4. Appropriately label the data set with descriptive variable names.
# Use gsub() to fix column name character.
names(extract_data)
names(extract_data) <- gsub("subject_id","Subject",names(extract_data))
names(extract_data) <- gsub("activity_id","Activity",names(extract_data))
names(extract_data) <- gsub("Acc","Accelerometer",names(extract_data))
names(extract_data) <- gsub("Gyro","Gyroscope",names(extract_data))
names(extract_data) <- gsub("Mag","Magnitude",names(extract_data))
names(extract_data) <- gsub("mean","Mean",names(extract_data))
names(extract_data) <- gsub("std","StandardDeviation",names(extract_data))
names(extract_data) <- gsub("Freq","Frequency",names(extract_data))
names(extract_data) <- gsub("BodyBody","Body",names(extract_data))
names(extract_data) <- gsub("^t","Time.",names(extract_data))
names(extract_data) <- gsub("^f","Frequency.",names(extract_data))
names(extract_data) <- gsub("()","",names(extract_data))
names(extract_data)

# Create data set "tidy_data".
tidy_data <- extract_data
View(tidy_data)

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
# Use group_by and summarise_all function to create data set "tidy_data2".
tidy_data2 <- tidy_data %>% group_by(Subject, Activity) %>%
        summarise_all(funs(mean(., na.rm = TRUE)))
View(tidy_data2)

# Save tidy_data2 as a txt file named "tidy_data2.txt"
write.table(tidy_data2, "tidy_data2.txt", row.names = FALSE)