#Peer-graded Assignment: Getting and Cleaning Data Course Project
#Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#"The data linked to from the course website represent data collected from the accelerometers from the Samsung 
#Galaxy S smartphone. A full description is available at the site where the data was obtained:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

#Read Files
features <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
subject_train <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/03 - Getting and Cleaning Data/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")

#Merges the training and the test sets to create one data set.
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data<-rbind(subject_test, subject_train)

#Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(x_data) <- features[,2]
x_data_mean_std <- x_data[, grep("mean()|std()", names(x_data))]

#Uses descriptive activity names to name the activities in the data set.
colnames(y_data) <- "activity"
y_data[, 1] <- activity_labels[y_data[, 1], 2]
colnames(subject_data) <- "subject"

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
all_data <- cbind(x_data_mean_std, y_data, subject_data)
library(plyr)
tidy<-ddply(all_data, .(subject, activity), numcolwise(mean))

