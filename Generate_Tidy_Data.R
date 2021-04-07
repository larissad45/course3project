## Script: Generate_Tidy_Data.R
## This script does operations to clean and generate tidy data for analysis
##
## Read separated files
library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("Id","featurename"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Id", "activityname"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject_Id")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$featurename)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject_Id")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$featurename)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Id")

## Merges the training and the test sets to create one data set: Combined_Data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Combined_Data <- cbind(Subject, y, x)

## Extracts only the measurements on the mean and standard deviation for each measurement in: Tidy_Info
Tidy_Info <- Combined_Data %>% select(Subject_Id, Id, contains("mean"), contains("std"))

## Uses descriptive activity names to name the activities in the data set
Tidy_Info$Id <- activity_labels[Tidy_Info$Id, 2]

## Appropriately labels the data set with descriptive variable names
names(Tidy_Info)[2] = "Activity"
names(Tidy_Info)<-gsub("Acc", "Accelerometer", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("BodyBody", "Body", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("Gyro", "Gyroscope", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("tBody", "TimeBody", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("Mag", "Magnitude", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("-mean()", "Mean", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("-std()", "Std", names(Tidy_Info), ignore.case = TRUE)
names(Tidy_Info)<-gsub("-freq()", "Frequency", names(Tidy_Info), ignore.case = TRUE)
## Replace t and f at the beginning
names(Tidy_Info)<-gsub("^t", "Time", names(Tidy_Info))
names(Tidy_Info)<-gsub("^f", "Frequency", names(Tidy_Info))
## Eliminate the ellipsis
names(Tidy_Info)<-gsub("\\.\\.\\.", "\\.", names(Tidy_Info))
names(Tidy_Info)<-gsub("\\.\\.", "", names(Tidy_Info))
names(Tidy_Info)<-gsub("[\\.]$","",names(Tidy_Info))

## Creates and independent tidy data set with the average of each variable for each activity and each subject
Calculated_Mean <- Tidy_Info %>%
        group_by(Subject_Id, Activity) %>%
        summarise_all(funs(mean))

## Write the Tidy CSV
data.table::fwrite(x = Calculated_Mean, file = "Course3_Tidy_Data.csv", quote = FALSE)
