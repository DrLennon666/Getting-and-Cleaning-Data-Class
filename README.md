<<<<<<< HEAD
# Data set background


The raw data used was provided by the University of California at Irvine's Machine Learning Repository and obtained by
Reyes-Ortiz et al. (Smartlab -Non Linear Complex Systems Laboratory, Universita degli studi di Genova).  The experiments
for which the data were obtained were carried out with a group of 30 volunteers aged 19-48.  Each subject performed six 
activities.

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Data for the activities were recorded using the embedded accelerometer and gyrocscope in a Samsung Galaxy S II smartphone
worn about the waist.  3-axial linear acceleration and 3-axial angular velocity measurements were obtained at a rate of 50Hz.

70% of the subjects were randomly selected to generate the training data.  The remaining 30% generated the test data.

## For additional information 
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# Direction for use of and description run_analysis.R script 

The original raw data is contained in the "getdata_projectfiles_UCI HAR Dataset" .zip file.  

## Extracting and preparing raw data for analysis

Extract the entire folder named "UCI HAR Dataset"  this folder contains "train" and "test subfolders.
Four text files are also present.

1. activity_labels
2. features
3. features_info
4. README

The user should create a new sub folder entitled "required data files" and populate it with copies of the
following 8 files.  These are the required raw data that run_analysis.R will use.

* X_train
* y_train
* subject_train
* X_test
* y_test
* activity_labels
* features
* subject_test

The user should now set their working directory path to the "required data files" 
folder (this can be done on line 6 of the script) and run the entire run_analysis.R script.  

## Step-wise description of run_analysis.R

The "activity_label" and "features" files are read into R and assigned appropriate variable names.
The "activity_label" text file (dim: 6x2) lists six activitites described earlier and matches each activity name
with an integer from 1 to 6.   The "features" text file (dim: 561x2) lists the variable name for each measurement
taken.

At this point the script handles the test and training data separately.  The analyses of each set are identical and
only the test data will be explained.

The script reads "X_test" (dim: 2947x561) which contains the raw data from all measurement types listed in "features"
The script reads "subject_test" (dim: 2947x1) which contains an integer list in which each value corresponds to
a subject in the study.  Appropriate names are given to the variables in both files.

The script reads "y_test" (dim: 2947x1) which contains a list 2947 elements in length of integers ranging from 1 to 6.
A for loop creates a new data frame in which the integers 1-6 in "y_test" are matched to the corresponding activities
in the "activity_label" file.  The new data frame is appropriately named.

A large data frame (test_set) consisting of "x_test", "subject_test", and the newly created "Activity" data frame is created
using the cbind() function.

As only the varibles related to mean and std are required the test_set data frame is parsed into a smaller data frame
entitled small_test_set using a vector of appropriate indices.


This process is repeated for training data and yields a data frame enititle small_train_set

The rbind() function is used to combine small_test_set and small_train_set into
a data frame named combined_small

The mean of all mean and std columns (1:64) in combined_small are taken using the aggregate()
function and stored in a new data frame tidy_data.  tidy_data is then ordered by subject and 
given appropriate variable names.  

The script finally writes a tab delimited text file of the tidy_data data frame to the working directory.


Note:

This script was produced as the class project for Coursera's Getting and Cleaning Data course.

=======
Getting-and-Cleaning-Data-Class
===============================

Class project for Courseara (JHU) course entitled "Gettning and Cleaning Data"
>>>>>>> 5d0b065de18dda559afc9edf5238ecaa7484e94b
