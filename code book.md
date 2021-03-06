#Getting and Cleaning Data Coursera Project

## About the data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## Source Data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data file used 
features.txt: List of all features.
activity_labels.txt: Links the class labels with their activity name
x_train.txt: Training set
y_train.txt: Training labels
x_test.txt: Test set
y_test.txt: Test labels

##For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Data Transformation
1. Merges the training and the test sets to create one data set.
   Load the source data, combine data and assign column names. 


2. Extracts only the measurements on the mean and standard deviation for each measurement.
   Use grep function to identify columns with mean and SD values.  Subset those columns.

3. Uses descriptive activity names to name the activities in the data set
   Load the activity description from activity_labels. Use factor to replace the activity value with description. 
   
4. Appropriately labels the data set with descriptive variable names.
  Use gsub function to replace the abbreviation at column name to more descriptive variable names. 
  
  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    Tidy dataset is created for each measurements by different combination of subject and activity. 
