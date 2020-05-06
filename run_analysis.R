library(dplyr)

##downloading and unzipping the file
filename <- "Week3_DS.zip"
if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, filename, method="curl")
}

##unzipping
if (!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

##loading all data frames into variables
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

##Part 1 : Merge the training and test sets to create one data set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

##Part 2 : Extracts only the measurements on the mean and standard deviation for each measurement.
Tidy <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

##Part 3 :  Uses descriptive activity names to name the activities in the data set.
Tidy$code <- activities[Tidy$code, 2]
