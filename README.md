Peer-graded Assignment: Getting and Cleaning Data Course Project

********************************************************************************************************************

The data used for the assignment:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

"The data linked to from the course website represent data collected from the accelerometers from the Samsung 
Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"


Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for 
Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational 
Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

********************************************************************************************************************

The R script called run_analysis.R does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
Creates an independent tidy data set with the average of each variable for each activity and each subject.

The script outputs tidy.txt as described in CodeBook.md
********************************************************************************************************************
