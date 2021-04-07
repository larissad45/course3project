DATA ORIGIN: 
Human Activity Recognition Using Smartphones Data Set.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 30% of the volunteers was selected for generating the test data and 70% the training data.

VARIABLES:

features <- Contains the "UCI HAR Dataset/features.txt" data set. The features selected for this variable come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
        Columns:        "Id": Identifies the function observed.
                        "featurename": Describes the function name.
        Example:
        Id       featurename
        1 tBodyAcc-mean()-X
        2 tBodyAcc-mean()-Y
        3 tBodyAcc-mean()-Z
        4  tBodyAcc-std()-X
        5  tBodyAcc-std()-Y
        6  tBodyAcc-std()-Z
        
        Total: 561 obs. of  2 columns
                        
activity_labels <- Contains the "UCI HAR Dataset/activity_labels.txt" data set.
        Columns:        "Id": Identifies the activity of the subject.
                        "activityname": Describes the activity name.
        Example:
        1            WALKING
        2   WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4            SITTING
        5           STANDING
        6             LAYING
        
        Total: 6 obs. of  2 columns
        
subject_test <- Contains the "UCI HAR Dataset/test/subject_test.txt" data set.
        Columns:        "Subject_Id": Identifies the volunteers observed in test data.
        Example: Shows 9/30 subjects
        2  4  9 10 12 13 18 20 24
        
        Total: 2947 obs. of  1 column

x_test <- Contains the "UCI HAR Dataset/test/X_test.txt" data set.
        Columns: Contains test data recorded for 561 columns corresponding to the features$featurename.
        Example:
        tBodyAcc.mean...X                   : num  0.257 0.286 0.275 0.27 0.275 ...
        tBodyAcc.mean...Y                   : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
        tBodyAcc.mean...Z                   : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
        tBodyAcc.std...X                    : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
        tBodyAcc.std...Y                    : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
        tBodyAcc.std...Z                    : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...
        tBodyAcc.mad...X                    : num  -0.953 -0.987 -0.994 -0.995 -0.994 ...
        tBodyAcc.mad...Y                    : num  -0.925 -0.968 -0.971 -0.974 -0.966 ...
        tBodyAcc.mad...Z                    : num  -0.674 -0.946 -0.963 -0.969 -0.977 ...
        tBodyAcc.max...X                    : num  -0.894 -0.894 -0.939 -0.939 -0.939 ...   
        ...
        
        Total: 2947 obs. of  561 columns
        
y_test <- Contains the "UCI HAR Dataset/test/y_test.txt" data set.
        Columns:        Id": Represents the activity of the subject observed in test data.
        Example: Id: int  5 5 5 5 5 5 5 5 5 5 ...
        
        Total: 2947 obs. of  1 column
        
subject_train <- Contains the "UCI HAR Dataset/train/subject_train.txt" data set.
        Columns:        "Subject_Id": Identifies the volunteers observed in train data.
        Example: Shows 21/30 subjects
        1  3  5  6  7  8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30
        
        Total: 2947 obs. of  1 column

x_train <- Contains the "UCI HAR Dataset/train/X_train.txt" data set.
        Columns: Contains train data recorded for 561 columns corresponding to the features$featurename.
        Example:
        tBodyAcc.mean...X                   : num  0.289 0.278 0.28 0.279 0.277 ...
        tBodyAcc.mean...Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
        tBodyAcc.mean...Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
        tBodyAcc.std...X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
        tBodyAcc.std...Y                    : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
        tBodyAcc.std...Z                    : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
        tBodyAcc.mad...X                    : num  -0.995 -0.999 -0.997 -0.997 -0.998 ...
        tBodyAcc.mad...Y                    : num  -0.983 -0.975 -0.964 -0.983 -0.98 ...
        tBodyAcc.mad...Z                    : num  -0.924 -0.958 -0.977 -0.989 -0.99 ...
        tBodyAcc.max...X                    : num  -0.935 -0.943 -0.939 -0.939 -0.942 ...
        ...
 
        Total: 7352 obs. of  561 columns
        
y_train <- Contains the "UCI HAR Dataset/train/y_train.txt" data set.
        Columns:        Id": Represents the activity of the subject observed in train data.
        Example: Id: int  5 5 5 5 5 5 5 5 5 5 ...

        Total: 7352 obs. of  1 column
        
TRANSFORMATIONS:

We need to combine the data in one data set, using rbind().

x <- Combines training (x_train) and test (x_test) data for the 561 feature columns.
        Total: 10299 obs. of  561 columns
        
y <- Combines training (y_train) and test (y_test) data for the activities observed.
        Total: 10299 obs. of  1 column 

Subject <- Combines the subjects observed for train (subject_train) and test (subject_test) data.
        Total: 10299 obs. of  1 column 

Next, We combined the data for the subjects (Subjects), activities (y) and features (x), using cbind(), in the variable Combined_Data.
        Total: 10299 obs. of  563 columns
        
Then, We extract only the measurements on the mean and standard deviation for each subject and activity, selecting the Subject_Id, Id, and featurename that contains("mean") or contains("std") and their values; subsetting Combined_Data. We stored the result in Tidy_Info. 
        Total: 10299 obs. of  88 columns
        
Later, We uses descriptive activity names to name the activities in the data set Tidy_Info and change de column name from Id to Activity.

Finally, We made the Tidy_Info column names more readable, changing strings with gsub() and regular expresions:
"Acc""          = "Accelerometer"
"BodyBody"      = "Body"
"Gyro"          = "Gyroscope"
"tBody"         = "TimeBody"
"Mag"           = "Magnitude"
"-mean()"       = "Mean"
"-std()"        = "Std"
"-freq()"       = "Frequency"

Replace t and f at the beginning:
"^t"            = "Time"
"^f"            ="Frequency"

Eliminate the ellipsis (... or .. or . at the end):
"\\.\\.\\."     = "\\."
"\\.\\."        = ""
"[\\.]$"        = ""


FINAL RESULT:

We create a new data frame called Calculated_Mean calculating the mean by volunteer (subject) and activity and export the result to the Course3_Tidy_Data.txt or Course3_Tidy_data.csv file. Total: 180 rows x 88 columns.
