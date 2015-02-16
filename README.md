# Getting and Cleaning Data: Course Project

## Introduction

This repository contains the files generated for the project proposed in the course "Getting and Cleaning Data". 

***

## The raw data

The data used for this project represent data collected form the accelerometers of an smartphone ("Samsung Galaxy S") [1]. At the moment this project was done the data could be donwloaded from this [link](https:\\d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and thus it's not included in this repository.

The data is partitioned in two sets: the training data and the test data. See the README file included in the Dataset to get details about the included files and how they are related to each other.

***

## The script

The script used to process the dataset is called run_analysis.R. It basically does the following steps:

1. Merges the two sets of data.
2. Extracts the data corresponding to the mean and standard deviation for each measurement.
3. Uses descriptive data names for the activities. The names are extracted from the "activity_label.txt" file included with the dataset.
4. Labels the data set with descriptive variable names. The names are extracted from the "features.txt" file included with the dataset.
5. Creates an independent tidy data set with the average of each variable for each activity.

The script has the following prerequisites:

* The zipped Dataset (Dataset.zip) should be in the working directory

The script unzips the data and checks whether the required packages ("reshape2") are installed and/or loaded. Once the data has been processed the script clean up the environment in order to return to the previous status (ex: if "reshape2" was not loaded, the script unload the namespace). The unzipped directory is also deleted.

The script unique output it's a tidy data set file "tidyDataSet.txt" created in the working directory.  

***

## The tidy dataset

The created tidy dataset is in the wide-tidy form (each variable is in one column and each independent observation per subject and activity is in a different row).

In order to read the file in R use the function read.table using header=TRUE.

***

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012