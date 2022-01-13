## **Getting and Cleaning Data Course Project**

It includes step by step procedures on how to clean up data until having tidy data.

Data Set\
Human Activity Recognition Using Smartphones 

List of files
features.txt :561 observations and 2 variable\
subject_train.txt : 7352 observations and 1 variable\
X_train.txt : 7352 observations and 561 variables\
y_train.txt : 7352 observations and 1 variable\
subject_test.txt :2947 observations and  1 variable\
X_test.txt : 2947 observations and 561 variables\
y_test.txt : 2947 observations and 1 variable\
activity_labels.txt :6 observations and 2 variables\

Filename in R\
RUn_Analysis.R

### **Steps to follow on this course project**

Prior to the five main steps. YOu should first download and extract the data sets and assign each data to a variable.

Step 1: Merging the training and the test sets into one data set\
mrg_train is created by merging subject_train, y_train, x_train using the cbind function\
mrg_test is created by merging subject_test, y_test, x_test using tthe cbind function\
Mrg_Data is created by merging mrg_train and mrg_test using the rbind function 

Step 2: Extracting  only the measurements on the mean and standard deviation for each measurement\
Extracted_Data is created by subsetting the Mrg_Data and selecting only the SubjectNum, Code, and the measurement on the mean and standard deviation (std) columns 

Step 3:  Using descriptive activity names to name the activities in the dataset\
Replacing the entire numbers in the Extracted_Data Code column with the corresponding activity from the 2nd column of the different_activities variable

Step 4: Appropriately labels the data set with descriptive variable names\
Renaming the Code column in the  Extracted_Data into Activity\
Replacing all "Acc" into Accelerometer"\
Replacing all "Gyro" into "Gyroscope"\
Replacing all "BodyBody" into "Body"\
Replacing all "Mag" into "Magnitude"\
Replacing all "^t" into "Time"\
Replacing all "^f" into "frequency"\
Replacing all "tBody" to "TimeBody"\
Replacing all "-mean()" to "Mean"\
Replacing all "-std()" to "STD"\
Replacing all "-freq()" to "Frequency"\
Replacing all "angle" to "Angle"\
Replacing all "gravity" to "Gravity"

Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidy_Data is created by summarizing the Extracted_Data by taking the means of each variable for each Activity and SubjectNum 

Exporting the Tidy_Data into Final_Data.txt   





