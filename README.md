# Getting_Cleaning_Data_Course_Project

Course Project - Getting and Cleaning Data

This is the course project for the Getting and Cleaning Data Coursera course.
The included R script, Getting_Cleaning_Data_Course_Project.R, conducts the following:

Read both the train and test datasets and merge them into x(measurements), y(activity) and subject, respectively.

Load the data(x's) feature, activity info and extract columns named 'mean'(-mean) and 'standard'(-std). Also, modify column names to descriptive. (-mean to Mean, -std to Std, and remove symbols like -, (, ))

Extract data by selected columns(from step 3), and merge x, y(activity) and subject data. Also, replace y(activity) column to it's name by refering activity label.

Generate 'Tidy Dataset' that consists of the average (mean) of each variable for each subject and each activity. The result is shown in the file tidy_dataset.txt.
