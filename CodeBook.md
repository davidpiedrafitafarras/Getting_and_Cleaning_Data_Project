# Getting and Cleaning Data: Codebook

***

## Introduction

This code book describes the data source, the transformations and the variables of the tidy data set. Some of this content has been taken from the files included in the analyzed data set.

***

## Data source

The data used for this project represent data collected form the accelerometers of an smartphone ("Samsung Galaxy S") [1]. A full description is available at the site where the dat was obtained (
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
).

### Study design

This section is extracted from the files included in the data set.

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record the following data is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Source files

The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

***

## Transformations

The following steps has been performed in order to process the dataset:

1. Read the list of all features from features.txt
2. Select the variables labeled as mean or std, and replaces unwanted characters " (, ), -,".
3. The data corresponding to the subject identifier (subject_train.txt), the data set (X_text.txt) and the labels (y_test.txt) is loaded for each set and properly identified.
4. The two sets are appended (using rbind) creating unified data.fames for subjects, data set and activity labels.
5. The Data set is subsetted to include only the variables included in the selected variables data.frame.
6. Column names are labelled for the subjects, the set and the activities. and the subjects, variables and activities are appended (using cbind).
7. Activity labels are read from the file activity_labels.txt. As the labels are in correct order they will be used as levels.
8. The values in the activity column are converted to factors and given descriptive names.
9. The data se is melted in order to obtain a unique subject-variable combination (using the "reshape2" package.
10. The average for each subject-activity pair is obtained
11. The tidy dataset is written in the set file "tidyDataSet.txt" created in the working directory.  

**Note**
The additional vectors included int he angle() variables are not considered as they are already processed data (averaged data using a signal window sample).

***

## Variables

The variables included in tidy data set (which is in the wide-tidy form), are listed below. For each variable the variable_name, the statistical data type and the description is given. The features are all normalized and bounded within [-1,1]

_Variable\_name_: Subject  
_Data\_type_: 2  
_Description_: Identifies the subject who performs the activity. Ranges from 1 to 30

_Variable\_name_: Activity  
_Data\_type_: 3  
_Description_: Name of the performed activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)

_Variable\_name_:  tBodyAcc\_mean\_X   
_Data\_type_: 1  
_Description_:   Time domain body accelerometer mean value (X-axis) 

_Variable\_name_:  tBodyAcc\_mean\_Y   
_Data\_type_: 1  
_Description_:  Time domain body accelerometer mean value (Y-axis) 

_Variable\_name_:  tBodyAcc\_mean\_Z 
_Data\_type_: 1  
_Description_:  Time domain body accelerometer mean value (Z-axis) 

_Variable\_name_:  tBodyAcc\_std\_X  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer standard deviation (X-axis) 

_Variable\_name_:  tBodyAcc\_std\_Y  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer standard deviation (Y-axis) 

_Variable\_name_: tBodyAcc\_std\_Z  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer standard deviation (Z-axis) 

_Variable\_name_: tGravityAcc\_mean\_X  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer mean value (X-axis) 

_Variable\_name_: tGravityAcc\_mean\_Y  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer mean value (Y-axis) 

_Variable\_name_:  tGravityAcc\_mean\_Z  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer mean value (Z-axis) 

_Variable\_name_:  tGravityAcc\_std\_X  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer standard deviation (X-axis) 

_Variable\_name_:  tGravityAcc\_std\_Y  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer standard deviation (Y-axis) 

_Variable\_name_:  tGravityAcc\_std\_Z  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer standard deviation (Z-axis) 

_Variable\_name_:  tBodyAccJerk\_mean\_X  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk mean value (X-axis) 

_Variable\_name_: tBodyAccJerk\_mean\_Y  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk mean value (Y-axis) 

_Variable\_name_: tBodyAccJerk\_mean\_Z  
_Data\_type_: 1
_Description_:  Time domain body accelerometer jerk -mean value (Z-axis) 

_Variable\_name_: tBodyAccJerk\_std\_X  
_Data\_type_: 1
_Description_:  Time domain body accelerometer jerk standard deviation (X-axis) 

_Variable\_name_: tBodyAccJerk\_std\_Y  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk standard deviation (Y-axis) 

_Variable\_name_: tBodyAccJerk\_std\_Z  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk standard deviation (Z-axis) 

_Variable\_name_: tBodyGyro\_mean\_X  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope mean value (X-axis) 

_Variable\_name_: tBodyGyro\_mean\_Y  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope mean value (Y-axis) 

_Variable\_name_: tBodyGyro\_mean\_Z  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope mean value (Z-axis) 

_Variable\_name_: tBodyGyro\_std\_X  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope standard deviation (X-axis) 

_Variable\_name_: tBodyGyro\_std\_Y  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope standard deviation (Y-axis) 

_Variable\_name_: tBodyGyro\_std\_Z  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope standard deviation (Z-axis) 

_Variable\_name_: tBodyGyroJerk\_mean\_X  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk mean value (X-axis) 

_Variable\_name_: tBodyGyroJerk\_mean\_Y  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk mean value (Y-axis) 

_Variable\_name_: tBodyGyroJerk\_mean\_Z 
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk mean value (Z-axis) 

_Variable\_name_: tBodyGyroJerk\_std\_X  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk standard deviation (X-axis) 

_Variable\_name_: tBodyGyroJerk\_std\_Y  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk standard deviation (Y-axis) 

_Variable\_name_: tBodyGyroJerk\_std\_Z  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk standard deviation (Z-axis) 

_Variable\_name_: tBodyAccMag\_mean  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer euclidean norm mean value  

_Variable\_name_: tBodyAccMag\_std  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer euclidean norm standard deviation  

_Variable\_name_: tGravityAccMag\_mean  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer euclidean norm mean value  

_Variable\_name_: tGravityAccMag\_std  
_Data\_type_: 1  
_Description_:  Time domain gravity accelerometer euclidean norm standard deviation  

_Variable\_name_: tBodyAccJerkMag\_mean  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk euclidean norm mean value  

_Variable\_name_: tBodyAccJerkMag\_std  
_Data\_type_: 1  
_Description_:  Time domain body accelerometer jerk euclidean norm standard deviation  

_Variable\_name_: tBodyGyroMag\_mean  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope euclidean norm mean value  

_Variable\_name_: tBodyGyroMag\_std  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope euclidean norm standard deviation  

_Variable\_name_: tBodyGyroJerkMag\_mean  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk euclidean norm mean value  

_Variable\_name_: tBodyGyroJerkMag\_std  
_Data\_type_: 1  
_Description_:  Time domain body-gyroscope jerk euclidean norm standard deviation  

_Variable\_name_:  fBodyAcc\_mean\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer mean value (X-axis) 

_Variable\_name_: fBodyAcc\_mean\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer mean value (Y-axis) 

_Variable\_name_: fBodyAcc\_mean\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer mean value (Z-axis) 

_Variable\_name_: fBodyAcc\_std\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer standard deviation (X-axis) 

_Variable\_name_: fBodyAcc\_std\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer standard deviation (Y-axis) 

_Variable\_name_: fBodyAcc\_std\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer standard deviation (Z-axis) 

_Variable\_name_: fBodyAccJerk\_mean\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk mean value (X-axis) 

_Variable\_name_: fBodyAccJerk\_mean\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk mean value (Y-axis) 

_Variable\_name_: fBodyAccJerk\_mean\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk mean value (Z-axis) 

_Variable\_name_: fBodyAccJerk\_std\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk standard deviation (X-axis) 

_Variable\_name_: fBodyAccJerk\_std\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk standard deviation (Y-axis) 

_Variable\_name_: fBodyAccJerk\_std\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer jerk standard deviation (Z-axis) 

_Variable\_name_: fBodyGyro\_mean\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope mean value (X-axis) 

_Variable\_name_: fBodyGyro\_mean\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope mean value (Y-axis) 

_Variable\_name_: fBodyGyro\_mean\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope mean value (Z-axis) 

_Variable\_name_: fBodyGyro\_std\_X  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope standard deviation (X-axis) 

_Variable\_name_: fBodyGyro\_std\_Y  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope standard deviation (Y-axis) 

_Variable\_name_: fBodyGyro\_std\_Z  
_Data\_type_: 1  
_Description_:  Frequency domain body-gyroscope standard deviation (Z-axis) 

_Variable\_name_: fBodyAccMag\_mean  
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer euclidean norm mean value  

_Variable\_name_: fBodyAccMag\_std 
_Data\_type_: 1  
_Description_:  Frequency domain body accelerometer euclidean norm standard deviation  

_Variable\_name_: fBodyBodyAccJerkMag\_mean  
_Data\_type_: 1  
_Description_:  Frequency domain body-body accelerometer jerk euclidean norm mean value  

_Variable\_name_: fBodyBodyAccJerkMag\_std  
_Data\_type_: 1  
_Description_:  Frequency domain body-body accelerometer jerk euclidean norm standard deviation  

_Variable\_name_: fBodyBodyGyroMag\_mean  
_Data\_type_: 1  
_Description_:  Frequency domain body-body gyroscope euclidean norm mean value  

_Variable\_name_: fBodyBodyGyroMag\_std  
_Data\_type_: 1  
_Description_:  Frequency domain body-body gyroscope euclidean norm standard deviation  

_Variable\_name_: fBodyBodyGyroJerkMag\_mean  
_Data\_type_: 1  
_Description_:  Frequency domain body-body gyroscope jerk euclidean norm mean value  

_Variable\_name_: fBodyBodyGyroJerkMag\_std  
_Data\_type_: 1  
_Description_:  Frequency domain body-body gyroscope jerk euclidean norm standard deviation  


***

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

