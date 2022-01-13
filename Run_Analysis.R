#Getting and Cleaning Data
library(dplyr)
#Assigning and reading all data frames

#Reading the features data
features <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/features.txt", col.names = c("n","functions"))

#Reading the training data set(subject_trAIN, x_train, y_train)
subject_train <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/train/subject_train.txt", col.names = "SubjectNum")
x_train <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/train/y_train.txt", col.names = "Code")

#Reading the test data set(subject_test, X_test, y_test)
subject_test <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/test/subject_test.txt", col.names = "SubjectNum")
x_test <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/test/X_test.txt",  col.names = features$functions)
y_test <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/test/y_test.txt", col.names = "Code")


#Reading the activity labels data
different_activities <- read.table("/Users/USER/Desktop/specdata_2/UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))

# Step 1: Merging the training and the test sets into one data set 
mrg_train <- cbind(subject_train, y_train, x_train)
mrg_test  <- cbind(subject_test, y_test, x_test)
Mrg_Data <- rbind(mrg_train, mrg_test)

#Step 2: Extracting  only the measurements on the mean and standard deviation for each measurement
#Subsetting the Mrg_Data and selecting only the SubjectNum, Code, and the measurement on the mean and standard deviation (std) columns 
Extracted_Data <- Mrg_Data %>% select(SubjectNum, Code, contains("mean"), contains("std"))

# Step 3: Using descriptive activity names to name the activities in the dataset
#Replacing the entire numbers in the Extracted_Data Code column with the corresponding activity from the 2nd column of the different_activities variable
Extracted_Data$Code <- different_activities[Extracted_Data$Code, 2]

#Step 4: Appropriately labels the data set with descriptive variable names
#Renaming the Code column in the  Extracted_Data into Activity
#Replacing all "Acc" into Accelerometer
#Replacing all "Gyro" into Gyroscope
#Replacing all "BodyBody" into Body
#Replacing all "Mag" into Magnitude
#Replacing all "^t" into Time
#Replacing all "^f" into frequency and so on
names(Extracted_Data)[2] <- "Activity"
names(Extracted_Data)<-gsub("Acc", "Accelerometer", names(Extracted_Data))
names(Extracted_Data)<-gsub("Gyro", "Gyroscope", names(Extracted_Data))
names(Extracted_Data)<-gsub("BodyBody", "Body", names(Extracted_Data))
names(Extracted_Data)<-gsub("Mag", "Magnitude", names(Extracted_Data))
names(Extracted_Data)<-gsub("^t", "Time", names(Extracted_Data))
names(Extracted_Data)<-gsub("^f", "Frequency", names(Extracted_Data))
names(Extracted_Data)<-gsub("tBody", "TimeBody", names(Extracted_Data))
names(Extracted_Data)<-gsub("-mean()", "Mean", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-std()", "STD", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("-freq()", "Frequency", names(Extracted_Data), ignore.case = TRUE)
names(Extracted_Data)<-gsub("angle", "Angle", names(Extracted_Data))
names(Extracted_Data)<-gsub("gravity", "Gravity", names(Extracted_Data))

#Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable
#for each activity and each subject.
#Summarizing the Extracted_Data by taking the means of each variable for each Activity and SubjectNum 
#Exporting the Tidy_Data into Final_Data.txt             
Tidy_Data <- Extracted_Data %>%
  group_by(SubjectNum, Activity) %>%
  summarise_all(funs(mean))
  write.table(Tidy_Data, file = "Final_Data.txt", row.names=FALSE )
  
#Displaying the Tidy data  structure 
  str(Tidy_Data)
  

