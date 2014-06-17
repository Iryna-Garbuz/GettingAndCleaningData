CodeBook
========================================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to reproduce this project
===============================================
1. Change the parameter of the setwd function call to the working directory/folder (i.e., the folder where these the R script file is saved).
2. Run the R script run_analysis.r. 

Input data description
==============================================
**Human Activity Recognition Using Smartphones Dataset **

**Version 1.0 **

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Output Data
==============================================
Output is tidy dataset file tidydata.txt containing data set with the average of each variable for each activity and each subject.


```r
str(tidata)
```

```
## 'data.frame':	180 obs. of  69 variables:
##  $ subject                    : int  1 1 1 1 1 1 2 2 2 2 ...
##  $ activityNum                : int  1 2 3 4 5 6 1 2 3 4 ...
##  $ activityName               : chr  "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" ...
##  $ fBodyAcc-mean()-X          : num  -0.522 -0.993 -0.989 -0.527 -0.974 ...
##  $ fBodyAcc-mean()-Y          : num  -0.443 -0.981 -0.963 -0.444 -0.963 ...
##  $ fBodyAcc-mean()-Z          : num  -0.462 -0.986 -0.973 -0.415 -0.965 ...
##  $ fBodyAcc-std()-X           : num  -0.406 -0.994 -0.99 -0.541 -0.966 ...
##  $ fBodyAcc-std()-Y           : num  -0.412 -0.979 -0.948 -0.472 -0.939 ...
##  $ fBodyAcc-std()-Z           : num  -0.325 -0.98 -0.956 -0.368 -0.951 ...
##  $ fBodyAccJerk-mean()-X      : num  -0.59 -0.994 -0.99 -0.565 -0.982 ...
##  $ fBodyAccJerk-mean()-Y      : num  -0.575 -0.986 -0.981 -0.555 -0.98 ...
##  $ fBodyAccJerk-mean()-Z      : num  -0.627 -0.989 -0.986 -0.548 -0.977 ...
##  $ fBodyAccJerk-std()-X       : num  -0.576 -0.995 -0.991 -0.532 -0.98 ...
##  $ fBodyAccJerk-std()-Y       : num  -0.552 -0.988 -0.983 -0.534 -0.979 ...
##  $ fBodyAccJerk-std()-Z       : num  -0.683 -0.991 -0.988 -0.577 -0.981 ...
##  $ fBodyAccMag-mean()         : num  -0.44 -0.987 -0.968 -0.532 -0.965 ...
##  $ fBodyAccMag-std()          : num  -0.496 -0.985 -0.956 -0.67 -0.958 ...
##  $ fBodyBodyAccJerkMag-mean() : num  -0.542 -0.991 -0.985 -0.51 -0.98 ...
##  $ fBodyBodyAccJerkMag-std()  : num  -0.572 -0.992 -0.984 -0.563 -0.98 ...
##  $ fBodyBodyGyroJerkMag-mean(): num  -0.805 -0.995 -0.992 -0.78 -0.987 ...
##  $ fBodyBodyGyroJerkMag-std() : num  -0.84 -0.995 -0.99 -0.801 -0.986 ...
##  $ fBodyBodyGyroMag-mean()    : num  -0.698 -0.984 -0.976 -0.734 -0.973 ...
##  $ fBodyBodyGyroMag-std()     : num  -0.647 -0.977 -0.964 -0.772 -0.967 ...
##  $ fBodyGyro-mean()-X         : num  -0.63 -0.986 -0.975 -0.687 -0.973 ...
##  $ fBodyGyro-mean()-Y         : num  -0.705 -0.988 -0.983 -0.71 -0.977 ...
##  $ fBodyGyro-mean()-Z         : num  -0.611 -0.989 -0.981 -0.553 -0.978 ...
##  $ fBodyGyro-std()-X          : num  -0.631 -0.988 -0.976 -0.743 -0.977 ...
##  $ fBodyGyro-std()-Y          : num  -0.674 -0.983 -0.977 -0.711 -0.972 ...
##  $ fBodyGyro-std()-Z          : num  -0.583 -0.991 -0.98 -0.533 -0.977 ...
##  $ tBodyAcc-mean()-X          : num  0.274 0.277 0.28 0.279 0.271 ...
##  $ tBodyAcc-mean()-Y          : num  -0.0153 -0.0173 -0.0152 -0.019 -0.0178 ...
##  $ tBodyAcc-mean()-Z          : num  -0.119 -0.106 -0.104 -0.107 -0.106 ...
##  $ tBodyAcc-std()-X           : num  -0.436 -0.994 -0.99 -0.537 -0.968 ...
##  $ tBodyAcc-std()-Y           : num  -0.396 -0.98 -0.951 -0.439 -0.944 ...
##  $ tBodyAcc-std()-Z           : num  -0.336 -0.981 -0.96 -0.352 -0.954 ...
##  $ tBodyAccJerk-mean()-X      : num  0.0708 0.0751 0.0744 0.0853 0.0772 ...
##  $ tBodyAccJerk-mean()-Y      : num  0.00895 0.00972 0.01249 0.01412 0.01488 ...
##  $ tBodyAccJerk-mean()-Z      : num  0.01414 -0.00298 -0.00369 0.0112 -0.00294 ...
##  $ tBodyAccJerk-std()-X       : num  -0.564 -0.994 -0.99 -0.528 -0.98 ...
##  $ tBodyAccJerk-std()-Y       : num  -0.549 -0.987 -0.981 -0.529 -0.978 ...
##  $ tBodyAccJerk-std()-Z       : num  -0.656 -0.991 -0.988 -0.564 -0.98 ...
##  $ tBodyAccJerkMag-mean()     : num  -0.561 -0.992 -0.989 -0.498 -0.98 ...
##  $ tBodyAccJerkMag-std()      : num  -0.553 -0.992 -0.985 -0.531 -0.98 ...
##  $ tBodyAccMag-mean()         : num  -0.353 -0.987 -0.969 -0.419 -0.956 ...
##  $ tBodyAccMag-std()          : num  -0.417 -0.985 -0.956 -0.577 -0.957 ...
##  $ tBodyGyro-mean()-X         : num  0.03429 -0.03557 -0.02978 -0.00767 -0.01993 ...
##  $ tBodyGyro-mean()-Y         : num  -0.0496 -0.0588 -0.0797 -0.0895 -0.0979 ...
##  $ tBodyGyro-mean()-Z         : num  0.0334 0.0917 0.089 0.0829 0.0894 ...
##  $ tBodyGyro-std()-X          : num  -0.626 -0.988 -0.975 -0.729 -0.976 ...
##  $ tBodyGyro-std()-Y          : num  -0.682 -0.985 -0.979 -0.709 -0.973 ...
##  $ tBodyGyro-std()-Z          : num  -0.557 -0.99 -0.979 -0.503 -0.976 ...
##  $ tBodyGyroJerk-mean()-X     : num  -0.1274 -0.096 -0.0996 -0.1005 -0.1067 ...
##  $ tBodyGyroJerk-mean()-Y     : num  -0.0403 -0.0432 -0.0387 -0.0362 -0.0379 ...
##  $ tBodyGyroJerk-mean()-Z     : num  -0.0502 -0.0572 -0.0549 -0.0555 -0.0537 ...
##  $ tBodyGyroJerk-std()-X      : num  -0.767 -0.994 -0.988 -0.743 -0.983 ...
##  $ tBodyGyroJerk-std()-Y      : num  -0.796 -0.995 -0.993 -0.781 -0.987 ...
##  $ tBodyGyroJerk-std()-Z      : num  -0.764 -0.994 -0.992 -0.662 -0.988 ...
##  $ tBodyGyroJerkMag-mean()    : num  -0.778 -0.996 -0.993 -0.747 -0.988 ...
##  $ tBodyGyroJerkMag-std()     : num  -0.814 -0.995 -0.991 -0.782 -0.987 ...
##  $ tBodyGyroMag-mean()        : num  -0.497 -0.974 -0.967 -0.594 -0.956 ...
##  $ tBodyGyroMag-std()         : num  -0.627 -0.978 -0.964 -0.728 -0.966 ...
##  $ tGravityAcc-mean()-X       : num  0.882 0.907 0.936 0.636 -0.025 ...
##  $ tGravityAcc-mean()-Y       : num  -0.019 -0.1689 -0.0115 -0.1963 0.0231 ...
##  $ tGravityAcc-mean()-Z       : num  -0.2732 -0.0383 -0.1271 0.0361 0.7711 ...
##  $ tGravityAcc-std()-X        : num  -0.964 -0.989 -0.988 -0.972 -0.971 ...
##  $ tGravityAcc-std()-Y        : num  -0.95 -0.985 -0.971 -0.969 -0.975 ...
##  $ tGravityAcc-std()-Z        : num  -0.931 -0.981 -0.964 -0.967 -0.971 ...
##  $ tGravityAccMag-mean()      : num  -0.353 -0.987 -0.969 -0.419 -0.956 ...
##  $ tGravityAccMag-std()       : num  -0.417 -0.985 -0.956 -0.577 -0.957 ...
```

List the key variables in the data table

```r
key(tidata)
```

```
## NULL
```

Summary of variables

```r
summary(tidata)
```

```
##     subject      activityNum  activityName       fBodyAcc-mean()-X
##  Min.   : 1.0   Min.   :1.0   Length:180         Min.   :-0.994   
##  1st Qu.: 8.0   1st Qu.:2.0   Class :character   1st Qu.:-0.961   
##  Median :15.5   Median :3.5   Mode  :character   Median :-0.703   
##  Mean   :15.5   Mean   :3.5                      Mean   :-0.617   
##  3rd Qu.:23.0   3rd Qu.:5.0                      3rd Qu.:-0.290   
##  Max.   :30.0   Max.   :6.0                      Max.   : 0.136   
##  fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y
##  Min.   :-0.985    Min.   :-0.987    Min.   :-0.995   Min.   :-0.984  
##  1st Qu.:-0.922    1st Qu.:-0.937    1st Qu.:-0.960   1st Qu.:-0.913  
##  Median :-0.608    Median :-0.737    Median :-0.684   Median :-0.573  
##  Mean   :-0.528    Mean   :-0.658    Mean   :-0.599   Mean   :-0.519  
##  3rd Qu.:-0.161    3rd Qu.:-0.444    3rd Qu.:-0.280   3rd Qu.:-0.204  
##  Max.   : 0.493    Max.   : 0.193    Max.   : 0.276   Max.   : 0.539  
##  fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y
##  Min.   :-0.987   Min.   :-0.9941       Min.   :-0.988       
##  1st Qu.:-0.917   1st Qu.:-0.9677       1st Qu.:-0.950       
##  Median :-0.677   Median :-0.7325       Median :-0.698       
##  Mean   :-0.612   Mean   :-0.6506       Mean   :-0.621       
##  3rd Qu.:-0.364   3rd Qu.:-0.3700       3rd Qu.:-0.355       
##  Max.   : 0.609   Max.   : 0.0739       Max.   : 0.181       
##  fBodyAccJerk-mean()-Z fBodyAccJerk-std()-X fBodyAccJerk-std()-Y
##  Min.   :-0.9901       Min.   :-0.995       Min.   :-0.990      
##  1st Qu.:-0.9641       1st Qu.:-0.969       1st Qu.:-0.952      
##  Median :-0.7991       Median :-0.732       Median :-0.691      
##  Mean   :-0.7367       Mean   :-0.649       Mean   :-0.603      
##  3rd Qu.:-0.5673       3rd Qu.:-0.378       3rd Qu.:-0.296      
##  Max.   : 0.0406       Max.   : 0.107       Max.   : 0.265      
##  fBodyAccJerk-std()-Z fBodyAccMag-mean() fBodyAccMag-std()
##  Min.   :-0.992       Min.   :-0.987     Min.   :-0.9855  
##  1st Qu.:-0.969       1st Qu.:-0.932     1st Qu.:-0.9235  
##  Median :-0.827       Median :-0.664     Median :-0.7360  
##  Mean   :-0.774       Mean   :-0.579     Mean   :-0.6557  
##  3rd Qu.:-0.632       3rd Qu.:-0.253     3rd Qu.:-0.4164  
##  Max.   :-0.154       Max.   : 0.218     Max.   : 0.0005  
##  fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
##  Min.   :-0.992             Min.   :-0.9927          
##  1st Qu.:-0.955             1st Qu.:-0.9554          
##  Median :-0.704             Median :-0.7225          
##  Mean   :-0.613             Mean   :-0.6322          
##  3rd Qu.:-0.310             3rd Qu.:-0.3550          
##  Max.   : 0.167             Max.   : 0.0938          
##  fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
##  Min.   :-0.9960             Min.   :-0.9957           
##  1st Qu.:-0.9664             1st Qu.:-0.9673           
##  Median :-0.8433             Median :-0.8532           
##  Mean   :-0.7724             Mean   :-0.7844           
##  3rd Qu.:-0.6242             3rd Qu.:-0.6519           
##  Max.   :-0.0319             Max.   :-0.0989           
##  fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyGyro-mean()-X
##  Min.   :-0.9842         Min.   :-0.978         Min.   :-0.989    
##  1st Qu.:-0.9414         1st Qu.:-0.924         1st Qu.:-0.948    
##  Median :-0.7518         Median :-0.738         Median :-0.707    
##  Mean   :-0.6894         Mean   :-0.695         Mean   :-0.666    
##  3rd Qu.:-0.4847         3rd Qu.:-0.518         3rd Qu.:-0.422    
##  Max.   : 0.0459         Max.   : 0.109         Max.   : 0.196    
##  fBodyGyro-mean()-Y fBodyGyro-mean()-Z fBodyGyro-std()-X fBodyGyro-std()-Y
##  Min.   :-0.991     Min.   :-0.989     Min.   :-0.991    Min.   :-0.989   
##  1st Qu.:-0.954     1st Qu.:-0.944     1st Qu.:-0.957    1st Qu.:-0.941   
##  Median :-0.774     Median :-0.708     Median :-0.759    Median :-0.718   
##  Mean   :-0.698     Mean   :-0.637     Mean   :-0.735    Mean   :-0.667   
##  3rd Qu.:-0.513     3rd Qu.:-0.408     3rd Qu.:-0.536    3rd Qu.:-0.478   
##  Max.   : 0.179     Max.   : 0.294     Max.   :-0.107    Max.   : 0.488   
##  fBodyGyro-std()-Z tBodyAcc-mean()-X tBodyAcc-mean()-Y  tBodyAcc-mean()-Z
##  Min.   :-0.991    Min.   :0.235     Min.   :-0.05187   Min.   :-0.1463  
##  1st Qu.:-0.945    1st Qu.:0.272     1st Qu.:-0.01983   1st Qu.:-0.1123  
##  Median :-0.723    Median :0.276     Median :-0.01751   Median :-0.1082  
##  Mean   :-0.686    Mean   :0.274     Mean   :-0.01782   Mean   :-0.1089  
##  3rd Qu.:-0.474    3rd Qu.:0.280     3rd Qu.:-0.01521   3rd Qu.:-0.1054  
##  Max.   : 0.417    Max.   :0.289     Max.   : 0.00648   Max.   :-0.0836  
##  tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z tBodyAccJerk-mean()-X
##  Min.   :-0.995   Min.   :-0.984   Min.   :-0.986   Min.   :0.0348       
##  1st Qu.:-0.961   1st Qu.:-0.915   1st Qu.:-0.919   1st Qu.:0.0737       
##  Median :-0.688   Median :-0.571   Median :-0.679   Median :0.0777       
##  Mean   :-0.603   Mean   :-0.501   Mean   :-0.607   Mean   :0.0788       
##  3rd Qu.:-0.262   3rd Qu.:-0.145   3rd Qu.:-0.346   3rd Qu.:0.0847       
##  Max.   : 0.240   Max.   : 0.592   Max.   : 0.553   Max.   :0.1145       
##  tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X
##  Min.   :-0.02552      Min.   :-0.03796      Min.   :-0.994      
##  1st Qu.: 0.00213      1st Qu.:-0.01213      1st Qu.:-0.967      
##  Median : 0.00848      Median :-0.00482      Median :-0.717      
##  Mean   : 0.00815      Mean   :-0.00468      Mean   :-0.633      
##  3rd Qu.: 0.01399      3rd Qu.: 0.00333      3rd Qu.:-0.351      
##  Max.   : 0.05564      Max.   : 0.02515      Max.   : 0.140      
##  tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyAccJerkMag-mean()
##  Min.   :-0.988       Min.   :-0.9916      Min.   :-0.993        
##  1st Qu.:-0.949       1st Qu.:-0.9663      1st Qu.:-0.964        
##  Median :-0.689       Median :-0.8174      Median :-0.728        
##  Mean   :-0.599       Mean   :-0.7562      Mean   :-0.642        
##  3rd Qu.:-0.303       3rd Qu.:-0.6057      3rd Qu.:-0.371        
##  Max.   : 0.262       Max.   :-0.0557      Max.   : 0.139        
##  tBodyAccJerkMag-std() tBodyAccMag-mean() tBodyAccMag-std()
##  Min.   :-0.993        Min.   :-0.987     Min.   :-0.985   
##  1st Qu.:-0.955        1st Qu.:-0.926     1st Qu.:-0.919   
##  Median :-0.713        Median :-0.626     Median :-0.685   
##  Mean   :-0.620        Mean   :-0.542     Mean   :-0.586   
##  3rd Qu.:-0.330        3rd Qu.:-0.194     3rd Qu.:-0.284   
##  Max.   : 0.119        Max.   : 0.262     Max.   : 0.190   
##  tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
##  Min.   :-0.1255    Min.   :-0.19032   Min.   :-0.0874   
##  1st Qu.:-0.0432    1st Qu.:-0.08716   1st Qu.: 0.0779   
##  Median :-0.0301    Median :-0.07527   Median : 0.0870   
##  Mean   :-0.0303    Mean   :-0.07519   Mean   : 0.0879   
##  3rd Qu.:-0.0192    3rd Qu.:-0.06294   3rd Qu.: 0.1007   
##  Max.   : 0.1086    Max.   :-0.00253   Max.   : 0.1575   
##  tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
##  Min.   :-0.9908   Min.   :-0.990    Min.   :-0.990   
##  1st Qu.:-0.9543   1st Qu.:-0.944    1st Qu.:-0.940   
##  Median :-0.7471   Median :-0.725    Median :-0.695   
##  Mean   :-0.7172   Mean   :-0.675    Mean   :-0.648   
##  3rd Qu.:-0.5023   3rd Qu.:-0.480    3rd Qu.:-0.420   
##  Max.   :-0.0315   Max.   : 0.356    Max.   : 0.489   
##  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
##  Min.   :-0.1518        Min.   :-0.0774        Min.   :-0.0825       
##  1st Qu.:-0.1051        1st Qu.:-0.0459        1st Qu.:-0.0603       
##  Median :-0.0977        Median :-0.0409        Median :-0.0549       
##  Mean   :-0.0968        Mean   :-0.0422        Mean   :-0.0549       
##  3rd Qu.:-0.0923        3rd Qu.:-0.0383        3rd Qu.:-0.0502       
##  Max.   :-0.0363        Max.   :-0.0176        Max.   :-0.0108       
##  tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
##  Min.   :-0.995        Min.   :-0.9959       Min.   :-0.9946      
##  1st Qu.:-0.963        1st Qu.:-0.9687       1st Qu.:-0.9686      
##  Median :-0.793        Median :-0.8586       Median :-0.8030      
##  Mean   :-0.725        Mean   :-0.7785       Mean   :-0.7325      
##  3rd Qu.:-0.551        3rd Qu.:-0.6542       3rd Qu.:-0.5578      
##  Max.   : 0.020        Max.   : 0.0531       Max.   :-0.0103      
##  tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() tBodyGyroMag-mean()
##  Min.   :-0.996          Min.   :-0.9959        Min.   :-0.977     
##  1st Qu.:-0.971          1st Qu.:-0.9660        1st Qu.:-0.921     
##  Median :-0.826          Median :-0.8459        Median :-0.654     
##  Mean   :-0.755          Mean   :-0.7702        Mean   :-0.599     
##  3rd Qu.:-0.583          3rd Qu.:-0.6243        3rd Qu.:-0.346     
##  Max.   :-0.117          Max.   :-0.0266        Max.   : 0.304     
##  tBodyGyroMag-std() tGravityAcc-mean()-X tGravityAcc-mean()-Y
##  Min.   :-0.978     Min.   :-0.529       Min.   :-0.4728     
##  1st Qu.:-0.924     1st Qu.: 0.470       1st Qu.:-0.2184     
##  Median :-0.711     Median : 0.857       Median :-0.0887     
##  Mean   :-0.655     Mean   : 0.663       Mean   : 0.0039     
##  3rd Qu.:-0.438     3rd Qu.: 0.924       3rd Qu.: 0.1950     
##  Max.   : 0.189     Max.   : 0.966       Max.   : 0.7330     
##  tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y
##  Min.   :-0.4715      Min.   :-0.993      Min.   :-0.995     
##  1st Qu.:-0.0616      1st Qu.:-0.978      1st Qu.:-0.971     
##  Median : 0.0431      Median :-0.968      Median :-0.955     
##  Mean   : 0.0947      Mean   :-0.965      Mean   :-0.954     
##  3rd Qu.: 0.2159      3rd Qu.:-0.958      3rd Qu.:-0.942     
##  Max.   : 0.8448      Max.   :-0.886      Max.   :-0.751     
##  tGravityAcc-std()-Z tGravityAccMag-mean() tGravityAccMag-std()
##  Min.   :-0.990      Min.   :-0.987        Min.   :-0.985      
##  1st Qu.:-0.959      1st Qu.:-0.926        1st Qu.:-0.919      
##  Median :-0.944      Median :-0.626        Median :-0.685      
##  Mean   :-0.939      Mean   :-0.542        Mean   :-0.586      
##  3rd Qu.:-0.922      3rd Qu.:-0.194        3rd Qu.:-0.284      
##  Max.   :-0.753      Max.   : 0.262        Max.   : 0.190
```


run_analysis.R 
=====================================================

This script performs all required data transformations to get tidy data as output: 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Download the file. Put it in the GettingandCleaningData folder.

```
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  filename <- "Dataset.zip"
  
  path <- getwd()
  
  if(!file.exists(path))
  {
    dir.create(path)
  }
  
  download.file(url, file.path(path,filename))
```

## Load packages


```r
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
```

```
## data.table   reshape2 
##       TRUE       TRUE
```
## Read files to datatables


```r
## Read files to datatables
setwd("~/datasciencecoursera/GettingAndCleaningData/UCI HAR Dataset")
path <- getwd()

dtSubjectTrain <- fread(file.path(path, "train", "subject_train.txt"))
dtSubjectTest <- fread(file.path(path, "test", "subject_test.txt"))

dtYTrain <- fread(file.path(path, "train", "Y_train.txt"))
dtYTest <- fread(file.path(path, "test", "Y_test.txt"))

fileToDataTable <- function(f) {
  df <- read.table(f)
  dt <- data.table(df)
}

dtXTrain <- fileToDataTable(file.path(path, "train", "X_train.txt"))
dtXTest <- fileToDataTable(file.path(path, "test", "X_test.txt"))
```

##  Merge the training and the test sets to create one data set.

```r
## 1.  Merges the training and the test sets to create one data set.

dtSubject <- rbind(dtSubjectTest, dtSubjectTrain)
setnames(dtSubject, "V1", "subject")

dtY <- rbind(dtYTest, dtYTrain)
setnames(dtY, "V1", "activityNum")

dtX <- rbind(dtXTrain, dtXTest)

dtSubY <- cbind(dtSubject, dtY)

dt <- cbind (dtSubY, dtX)

setkey(dt, subject, activityNum)

head(dt, n=3)
```

```
##    subject activityNum     V1        V2       V3      V4      V5      V6
## 1:       1           1 0.2921 -0.018472 -0.12084 -0.3297 -0.1512 -0.2070
## 2:       1           1 0.2667 -0.006808 -0.13698 -0.3963 -0.1343 -0.2310
## 3:       1           1 0.2673 -0.024155 -0.07899 -0.3932 -0.1529 -0.1999
##         V7      V8      V9      V10      V11     V12    V13    V14    V15
## 1: -0.3710 -0.1341 -0.1887 -0.06083 -0.03862 -0.4550 0.3032 0.2187 0.3553
## 2: -0.4422 -0.1395 -0.2290 -0.19527 -0.03862 -0.4287 0.3060 0.2187 0.3553
## 3: -0.4330 -0.1708 -0.1979 -0.16050 -0.11311 -0.4287 0.3545 0.2181 0.2570
##        V16     V17     V18     V19     V20     V21     V22    V23    V24
## 1: -0.1820 -0.7740 -0.8601 -0.7156 -0.4394 -0.3419 -0.1692 0.5350 0.2212
## 2: -0.2357 -0.8164 -0.8544 -0.7312 -0.5442 -0.3515 -0.2263 0.4399 0.2999
## 3: -0.2256 -0.8145 -0.8606 -0.7095 -0.5484 -0.4021 -0.1417 0.3752 0.2313
##       V25     V26    V27     V28    V29     V30     V31     V32      V33
## 1: 0.2465 -0.6663 0.6204 -0.4120 0.1905 -0.2701 0.10332 0.26828 -0.12850
## 2: 0.2462 -0.7184 0.7416 -0.6250 0.3343 -0.2593 0.06978 0.26404 -0.03714
## 3: 0.3756 -0.4385 0.3623 -0.2468 0.2125 -0.3841 0.25196 0.09575 -0.01564
##        V34    V35     V36      V37     V38     V39    V40    V41     V42
## 1: -0.4747 0.2775 -0.0120 -0.04604 -0.3059 -0.5942 0.3424 0.8031 -0.2995
## 2: -0.6006 0.4393 -0.2425  0.07880 -0.2485 -0.5844 0.4116 0.7979 -0.3014
## 3: -0.3326 0.1734 -0.0531  0.08251 -0.2559 -0.5206 0.3542 0.7987 -0.2963
##        V43     V44     V45     V46     V47     V48     V49    V50     V51
## 1: -0.4091 -0.9714 -0.9447 -0.9500 -0.9741 -0.9518 -0.9533 0.7429 -0.3005
## 2: -0.4114 -0.9787 -0.9596 -0.9513 -0.9802 -0.9619 -0.9491 0.7354 -0.3090
## 3: -0.4177 -0.9854 -0.9821 -0.9646 -0.9867 -0.9831 -0.9686 0.7323 -0.3090
##        V52    V53     V54     V55    V56    V57     V58     V59     V60
## 1: -0.4062 0.8140 -0.2842 -0.4225 0.5618 0.4996 -0.8470 -0.6598 -0.9795
## 2: -0.4062 0.8140 -0.2842 -0.4241 0.5634 0.4874 -0.8450 -0.6560 -0.9871
## 3: -0.4143 0.8178 -0.2709 -0.4250 0.5679 0.4894 -0.8506 -0.6456 -0.9893
##        V61     V62     V63 V64 V65     V66    V67     V68    V69     V70
## 1: -0.9611 -0.9692 -0.3339  -1  -1 -0.5973 0.6404 -0.6823 0.7230 -0.5168
## 2: -0.9690 -0.9542 -0.4187  -1  -1 -0.5464 0.5933 -0.6384 0.6817 -0.5408
## 3: -0.9868 -0.9735 -0.5712  -1  -1 -0.3389 0.3947 -0.4449 0.4895 -0.4151
##       V71     V72    V73     V74    V75     V76    V77     V78      V79
## 1: 0.5146 -0.5451 0.5882 -0.6794 0.7192 -0.7583 0.7938  0.6669 -0.53147
## 2: 0.5383 -0.5668 0.6071 -0.6742 0.7198 -0.7651 0.8067  0.0740  0.07067
## 3: 0.4105 -0.4446 0.4930 -0.6932 0.7387 -0.7838 0.8251 -0.1083  0.35418
##         V80     V81      V82      V83     V84     V85     V86     V87
## 1: -0.92457 0.02885  0.03454 -0.06251 -0.4251 -0.4602 -0.6545 -0.4243
## 2: -0.80217 0.03046  0.01365  0.08448 -0.4676 -0.4837 -0.6726 -0.4751
## 3: -0.07813 0.12915 -0.03730  0.01746 -0.4772 -0.4525 -0.6634 -0.4844
##        V88     V89     V90    V91     V92    V93    V94    V95     V96
## 1: -0.4001 -0.6321 -0.6327 -0.737 -0.7790 0.2950 0.6060 0.6445 -0.4583
## 2: -0.4413 -0.6609 -0.7282 -0.701 -0.8022 0.2950 0.6677 0.6445 -0.5016
## 3: -0.4198 -0.6671 -0.7282 -0.701 -0.7919 0.3682 0.5529 0.5689 -0.5007
##        V97     V98     V99    V100    V101    V102   V103   V104   V105
## 1: -0.8323 -0.8505 -0.9361 -0.4303 -0.4699 -0.6361 0.6263 0.5958 0.4075
## 2: -0.8559 -0.8630 -0.9424 -0.4563 -0.5206 -0.6547 0.5906 0.3637 0.4443
## 3: -0.8609 -0.8463 -0.9392 -0.5192 -0.4590 -0.7256 0.6175 0.2859 0.4715
##       V106   V107     V108      V109    V110     V111     V112   V113
## 1: -0.6191 0.4696 -0.16862 -0.004759 -0.3063 -0.03747  0.07875 0.3917
## 2: -0.6520 0.5352 -0.17323 -0.116881 -0.3247 -0.09305 -0.03333 0.5022
## 3: -0.3851 0.2014  0.02922 -0.157447 -0.4538  0.13536 -0.04692 0.3548
##       V114     V115    V116      V117      V118    V119   V120     V121
## 1: -0.4930  0.02805 -0.1339 -0.011601 -0.122749 -0.3964 0.2205  0.39102
## 2: -0.6331  0.21250 -0.2724 -0.047682 -0.009489 -0.3067 0.2991  0.29863
## 3: -0.3717 -0.01421 -0.1997 -0.006701 -0.092038 -0.2831 0.2078 -0.07858
##         V122    V123    V124    V125    V126    V127    V128    V129
## 1: -0.331633 -0.4347 -0.3725 -0.7074 -0.4967 -0.3802 -0.7096 -0.4991
## 2: -0.250172 -0.3326 -0.3567 -0.6859 -0.2939 -0.3573 -0.7058 -0.3219
## 3:  0.001131  0.1704 -0.4811 -0.7107 -0.4124 -0.5205 -0.7212 -0.4162
##       V130    V131    V132   V133   V134   V135    V136    V137    V138
## 1: -0.1872 -0.8187 -0.5915 0.6498 0.6408 0.2692 -0.2852 -0.7079 -0.9459
## 2: -0.1872 -0.7767 -0.2870 0.6847 0.6408 0.2692 -0.3010 -0.7429 -0.9455
## 3: -0.4265 -0.7214 -0.2870 0.4613 0.7913 0.4603 -0.4689 -0.8753 -0.9572
##       V139    V140    V141    V142   V143    V144    V145    V146   V147
## 1: -0.7771 -0.4024 -0.7227 -0.5623 0.5025 -0.1782 -0.4859 -0.6672 0.4053
## 2: -0.7009 -0.3719 -0.7404 -0.5041 0.2844 -0.2328 -0.3576 -0.6440 0.4154
## 3: -0.8367 -0.5901 -0.7820 -0.5198 0.1304  0.1400  0.3982 -0.6608 0.4190
##       V148    V149    V150   V151   V152    V153    V154   V155    V156
## 1: 0.18879 -0.3497 -0.2496 0.1260 0.2953 -0.2793 -0.4799 0.3849 -0.2199
## 2: 0.07972 -0.2059 -0.2941 0.2039 0.1582 -0.2270 -0.5655 0.4492 -0.2540
## 3: 0.17412 -0.3460 -0.2409 0.1811 0.1027 -0.1322 -0.5327 0.4031 -0.2189
##      V157    V158    V159   V160     V161      V162      V163    V164
## 1: 0.1310 -0.1321  0.2023 0.3132 -0.03746 -0.059965 -0.149191 -0.7325
## 2: 0.1566 -0.3445 -0.1739 0.4894 -0.20090  0.093194  0.073816 -0.7325
## 3: 0.1877  0.1247  0.1194 0.4175 -0.24853  0.003569 -0.009966 -0.7010
##       V165    V166    V167    V168    V169    V170    V171    V172   V173
## 1: -0.7867 -0.7606 -0.7094 -0.7817 -0.7454 -0.7531 -0.8393 -0.7777 0.8012
## 2: -0.7957 -0.7514 -0.7206 -0.7926 -0.7285 -0.7756 -0.8685 -0.7777 0.8012
## 3: -0.8103 -0.7814 -0.7096 -0.8047 -0.7583 -0.6250 -0.8685 -0.8133 0.8051
##     V174   V175    V176    V177    V178    V179    V180    V181    V182
## 1: 0.787 0.8784 -0.7537 -0.9633 -0.9768 -0.9701 -0.6890 -0.7719 -0.7347
## 2: 0.787 0.8808 -0.7579 -0.9632 -0.9787 -0.9678 -0.7082 -0.7724 -0.7336
## 3: 0.834 0.8928 -0.7673 -0.9542 -0.9816 -0.9750 -0.7140 -0.8096 -0.7457
##      V183   V184   V185    V186   V187     V188    V189    V190   V191
## 1: 0.3790 0.5221 0.4781 -0.4049 0.0702  0.13536 0.07042 -0.1323 0.1186
## 2: 0.3499 0.5694 0.4456 -0.4160 0.1492 -0.03941 0.23102 -0.1864 0.1909
## 3: 0.2663 0.5317 0.3961 -0.4163 0.1118  0.11015 0.17919 -0.1299 0.1831
##      V192    V193    V194   V195     V196    V197   V198     V199     V200
## 1: 0.2754 0.25493 -0.3508 0.1617  0.09654 -0.3026 0.3808  0.04148 -0.06756
## 2: 0.2653 0.09771 -0.4495 0.1951  0.04911 -0.2923 0.3786 -0.01096 -0.11081
## 3: 0.2672 0.01560 -0.4504 0.2069 -0.09894 -0.1243 0.4178 -0.06537 -0.16280
##       V201    V202    V203    V204    V205    V206    V207    V208   V209
## 1: -0.2046 -0.3571 -0.4718 -0.2842 -0.8213 -0.2046 -0.6789 -0.6057 0.7641
## 2: -0.2453 -0.3993 -0.4983 -0.2842 -0.8213 -0.2453 -0.7118 -0.6212 0.7134
## 3: -0.2391 -0.4008 -0.4820 -0.2835 -0.7031 -0.2391 -0.7080 -0.5539 0.7622
##       V210   V211    V212   V213    V214    V215    V216    V217    V218
## 1: -0.4352 0.3372 -0.2038 0.1506 -0.2046 -0.3571 -0.4718 -0.2842 -0.8213
## 2: -0.4775 0.3958 -0.3193 0.2416 -0.2453 -0.3993 -0.4983 -0.2842 -0.8213
## 3: -0.4100 0.3407 -0.3509 0.3259 -0.2391 -0.4008 -0.4820 -0.2835 -0.7031
##       V219    V220    V221   V222    V223   V224    V225   V226    V227
## 1: -0.2046 -0.6789 -0.6057 0.7641 -0.4352 0.3372 -0.2038 0.1506 -0.4554
## 2: -0.2453 -0.7118 -0.6212 0.7134 -0.4775 0.3958 -0.3193 0.2416 -0.4941
## 3: -0.2391 -0.7080 -0.5539 0.7622 -0.4100 0.3407 -0.3509 0.3259 -0.4957
##       V228    V229    V230    V231    V232    V233    V234   V235    V236
## 1: -0.5021 -0.5362 -0.4450 -0.4263 -0.4554 -0.8500 -0.6031 0.5908 -0.1760
## 2: -0.5210 -0.5537 -0.4450 -0.5586 -0.4941 -0.8678 -0.6224 0.5740 -0.2323
## 3: -0.4963 -0.5319 -0.4894 -0.6862 -0.4957 -0.8649 -0.6555 0.5676 -0.2607
##      V237    V238    V239    V240    V241    V242    V243    V244    V245
## 1: 0.4657 -0.4853 0.01792 -0.2662 -0.2661 -0.2037 -0.4595 -0.5998 -0.2662
## 2: 0.5184 -0.5329 0.07556 -0.2772 -0.2754 -0.2124 -0.4595 -0.6662 -0.2772
## 3: 0.3413 -0.2799 0.11359 -0.4513 -0.5614 -0.5219 -0.6410 -0.6662 -0.4513
##       V246    V247   V248    V249     V250     V251    V252    V253
## 1: -0.7004 -0.3429 0.6724 -0.1691 -0.06823  0.17405 0.06552 -0.7542
## 2: -0.7090 -0.4544 0.6426 -0.1202 -0.08992  0.04200 0.27254 -0.7584
## 3: -0.8459 -0.5933 0.9341 -0.3483  0.18671 -0.05109 0.12624 -0.7660
##       V254    V255    V256    V257    V258    V259    V260   V261   V262
## 1: -0.8283 -0.8359 -0.7901 -0.5312 -0.7542 -0.9730 -0.8135 0.6550 0.4450
## 2: -0.8314 -0.8405 -0.7901 -0.7151 -0.7584 -0.9739 -0.8347 0.6419 0.3487
## 3: -0.8268 -0.8454 -0.8208 -0.7151 -0.7660 -0.9749 -0.8714 0.5669 0.2555
##       V263     V264     V265    V266    V267    V268    V269    V270
## 1: -0.3160  0.06586 -0.33305 -0.4294 -0.2992 -0.4397 -0.2941 -0.1342
## 2: -0.2575  0.05277 -0.29041 -0.4640 -0.3089 -0.4847 -0.3714 -0.1075
## 3: -0.2267 -0.08057 -0.06206 -0.5049 -0.2936 -0.4569 -0.3542 -0.1390
##       V271    V272    V273    V274    V275    V276     V277    V278
## 1: -0.1560 -0.3532 -0.1841 -0.2812 -0.2646 -0.4104 -0.05795 -0.8305
## 2: -0.1710 -0.3974 -0.1448 -0.3138 -0.3553 -0.4043 -0.07209 -0.8735
## 3: -0.1401 -0.4781 -0.1698 -0.3261 -0.3235 -0.3920 -0.04445 -0.9292
##       V279    V280    V281    V282    V283    V284    V285    V286    V287
## 1: -0.9778 -0.9168 -0.3071 -0.7735 -0.6348 -0.6777 -0.3148 -0.6180 -0.6259
## 2: -0.9858 -0.9626 -0.3430 -0.8159 -0.6204 -0.6965 -0.2599 -0.7043 -0.6678
## 3: -0.9599 -0.9500 -0.3498 -0.8141 -0.6363 -0.6720 -0.5609 -0.4393 -0.6309
##      V288   V289   V290    V291 V292    V293    V294    V295    V296
## 1: 0.4993 0.3297 0.2630 -0.8065 -0.8 -0.7692 -0.4667 -0.3199 -0.4179
## 2: 0.4568 0.3040 0.2711 -0.8065 -0.8 -0.7692 -0.4623 -0.4017 -0.4661
## 3: 0.3959 0.3330 0.3119 -0.8065 -0.8 -0.7692 -0.3702 -0.3227 -0.4074
##      V297   V298    V299    V300   V301     V302    V303    V304    V305
## 1: 0.4329 0.2239 -0.2548 -0.6708 0.1272 -0.13179 -0.7556 -0.8641 -0.8152
## 2: 0.3556 0.1228 -0.2681 -0.6845 0.1484 -0.10904 -0.8050 -0.8794 -0.8677
## 3: 0.4884 0.2762 -0.2483 -0.6553 0.1850 -0.09966 -0.7893 -0.9062 -0.9126
##       V306    V307    V308    V309    V310    V311    V312    V313    V314
## 1: -0.9207 -0.9479 -0.9500 -0.9821 -0.9944 -0.7648 -0.8178 -0.9487 -0.9862
## 2: -0.8859 -0.9612 -0.9733 -0.9778 -0.9920 -0.8088 -0.8524 -0.9658 -0.9825
## 3: -0.8635 -0.9536 -0.9504 -0.9616 -0.9956 -0.8042 -0.8842 -0.9524 -0.9730
##       V315    V316    V317    V318    V319    V320    V321    V322    V323
## 1: -0.7684 -0.9188 -0.5767 -0.8609 -0.9597 -0.9428 -0.9459 -0.9092 -0.9608
## 2: -0.8130 -0.9021 -0.5509 -0.8583 -0.9793 -0.9595 -0.9443 -0.9295 -0.9424
## 3: -0.8119 -0.8797 -0.5797 -0.8640 -0.9458 -0.9489 -0.9337 -0.9575 -0.9436
##       V324    V325    V326    V327    V328    V329    V330    V331    V332
## 1: -0.9957 -0.6041 -0.9445 -0.9256 -0.9743 -0.6311 -0.9346 -0.6205 -0.9211
## 2: -0.9999 -0.5830 -0.9683 -0.9323 -0.9648 -0.6153 -0.9490 -0.6416 -0.9271
## 3: -0.9928 -0.6080 -0.9329 -0.9353 -0.9625 -0.6322 -0.9420 -0.6101 -0.9271
##       V333    V334    V335    V336    V337    V338    V339    V340    V341
## 1: -0.9534 -0.9875 -0.9824 -0.9586 -0.9800 -0.9948 -0.6712 -0.9658 -0.9750
## 2: -0.9553 -0.9902 -0.9848 -0.9787 -0.9882 -0.9985 -0.6900 -0.9680 -0.9822
## 3: -0.9551 -0.9918 -0.9714 -0.9513 -0.9731 -0.9987 -0.6648 -0.9684 -0.9642
##       V342    V343   V344    V345    V346    V347    V348    V349    V350
## 1: -0.9842 -0.6733 -0.984 -0.4730 -0.5056 -0.6489 -0.4260 -0.4459 -0.6582
## 2: -0.9912 -0.6918 -0.988 -0.5087 -0.5352 -0.6672 -0.4716 -0.4615 -0.6761
## 3: -0.9806 -0.6675 -0.984 -0.5179 -0.5068 -0.6451 -0.4809 -0.4291 -0.6794
##       V351    V352    V353    V354    V355    V356    V357    V358    V359
## 1: -0.3051 -0.4956 -0.6541 -0.5591 -0.4675 -0.6498 -0.8805 -0.7997 -0.9865
## 2: -0.3431 -0.4983 -0.6599 -0.6149 -0.5539 -0.6783 -0.7771 -0.9766 -0.6527
## 3: -0.3953 -0.4569 -0.6692 -0.5769 -0.5298 -0.6577 -0.9643 -0.8626 -0.9404
##       V360    V361    V362    V363    V364    V365    V366   V367   V368
## 1: -0.4571 -0.8320 -0.8505 -0.9361 -0.3574 -0.6160 -0.6840 0.4637 0.2798
## 2: -0.4906 -0.8556 -0.8630 -0.9424 -0.4582 -0.6571 -0.6698 0.4169 0.2724
## 3: -0.4770 -0.8607 -0.8463 -0.9392 -0.4306 -0.6265 -0.6822 0.4033 0.3454
##      V369  V370  V371  V372    V373    V374    V375    V376    V377
## 1: 0.1120 -0.88 -0.48 -0.88 -0.4369 -0.5334 -0.7379 -0.2487 -0.7327
## 2: 0.1329 -0.88 -0.72 -0.88 -0.4377 -0.6432 -0.6516 -0.2752 -0.7687
## 3: 0.1601 -0.88 -0.72 -0.88 -0.2715 -0.6681 -0.5838 -0.1681 -0.6422
##        V378    V379    V380    V381    V382    V383    V384    V385
## 1: -0.08934 -0.5805 -0.2084 -0.6201 -0.8769 -0.8404 -0.8391 -0.9099
## 2: -0.23378 -0.7612 -0.1950 -0.6422 -0.9015 -0.8699 -0.8615 -0.8823
## 3: -0.22788 -0.7434 -0.2340 -0.5939 -0.8750 -0.8844 -0.9122 -0.8585
##       V386    V387    V388    V389    V390    V391    V392    V393    V394
## 1: -0.9432 -0.9353 -0.9762 -0.9975 -0.8427 -0.8327 -0.9352 -0.9761 -0.8124
## 2: -0.9628 -0.9620 -0.9714 -0.9929 -0.8726 -0.8383 -0.9594 -0.9705 -0.8449
## 3: -0.9503 -0.9301 -0.9419 -0.9998 -0.8701 -0.8681 -0.9379 -0.9429 -0.8624
##       V395    V396    V397    V398    V399    V400    V401    V402    V403
## 1: -0.8900 -0.6580 -0.8628 -0.9487 -0.9429 -0.9480 -0.8850 -0.9556 -0.9920
## 2: -0.8859 -0.6132 -0.8765 -0.9742 -0.9560 -0.9480 -0.9113 -0.9331 -0.9998
## 3: -0.8538 -0.6094 -0.8668 -0.9409 -0.9444 -0.9415 -0.9411 -0.9463 -0.9963
##       V404    V405    V406    V407    V408    V409    V410    V411    V412
## 1: -0.7950 -0.9357 -0.9086 -0.9602 -0.8283 -0.9289 -0.6818 -0.9061 -0.9578
## 2: -0.7969 -0.9604 -0.9199 -0.9415 -0.8409 -0.9415 -0.7070 -0.9259 -0.9577
## 3: -0.7872 -0.9306 -0.9273 -0.9526 -0.8192 -0.9371 -0.7159 -0.9236 -0.9549
##       V413    V414    V415    V416    V417    V418    V419    V420    V421
## 1: -0.9882 -0.9843 -0.9545 -0.9747 -0.9997 -0.8067 -0.9727 -0.9743 -0.9760
## 2: -0.9887 -0.9804 -0.9742 -0.9820 -0.9705 -0.8326 -0.9729 -0.9772 -0.9795
## 3: -0.9918 -0.9707 -0.9497 -0.9541 -0.9986 -0.8338 -0.9730 -0.9624 -0.9563
##       V422    V423    V424    V425    V426    V427    V428    V429    V430
## 1: -0.8854 -0.9827 -0.5378 -0.7087 -0.5545 -0.3476 -0.7086 -0.5250 -0.4548
## 2: -0.8969 -0.9842 -0.4969 -0.6951 -0.4567 -0.3361 -0.6824 -0.3126 -0.4092
## 3: -0.8955 -0.9802 -0.4663 -0.7187 -0.5791 -0.4908 -0.7078 -0.4208 -0.4454
##       V431    V432    V433    V434    V435    V436    V437    V438    V439
## 1: -0.6999 -0.5025 -0.2089 -0.8076 -0.6229 -0.9082 -0.9229 -0.9454 -0.5905
## 2: -0.6997 -0.3553 -0.2265 -0.7370 -0.4495 -0.9819 -0.7237 -0.9141 -0.5457
## 3: -0.7337 -0.4973 -0.5119 -0.7737 -0.4738 -0.8557 -0.8909 -0.9402 -0.5749
##       V440    V441    V442    V443    V444    V445   V446   V447   V448
## 1: -0.8023 -0.9565 -0.8716 -0.7386 -0.6860 -0.6226 0.1435 0.4128 0.1552
## 2: -0.7922 -0.9500 -0.7486 -0.8203 -0.7742 -0.6858 0.2144 0.3029 0.0965
## 3: -0.8646 -0.9575 -0.8255 -0.6649 -0.7557 -0.7607 0.3489 0.3320 0.1916
##       V449    V450   V451    V452    V453    V454    V455     V456    V457
## 1: -0.9333 -0.8065 -0.931 -0.6171 -0.2206 -0.4219 0.45525  0.16816 -0.4981
## 2: -1.0000 -1.0000 -0.931 -0.5720 -0.1484 -0.5204 0.36405  0.03037 -0.2975
## 3: -1.0000 -0.8065 -0.931 -0.3607 -0.1253 -0.5854 0.01985 -0.38128 -0.2657
##       V458     V459     V460    V461    V462    V463    V464    V465
## 1: -0.8546 -0.01904 -0.41160 -0.7935 -0.9544 -0.9843 -0.9956 -0.9893
## 2: -0.6794  0.11866 -0.28857 -0.7852 -0.9350 -0.9942 -0.9891 -0.9893
## 3: -0.6792  0.28180 -0.05522 -0.8685 -0.9140 -0.9789 -0.9872 -0.9632
##       V466    V467    V468    V469    V470    V471    V472    V473    V474
## 1: -0.9883 -0.9876 -0.9917 -0.7989 -0.9856 -0.9878 -0.9894 -0.8015 -0.9933
## 2: -0.9758 -0.9851 -0.9824 -0.7884 -0.9909 -0.9827 -0.9839 -0.7917 -0.9871
## 3: -0.9721 -0.9665 -0.9620 -0.8636 -0.9778 -0.9631 -0.9645 -0.8648 -0.9801
##       V475    V476    V477    V478    V479    V480    V481    V482    V483
## 1: -0.9555 -0.9836 -0.9808 -0.9928 -0.9956 -0.9789 -0.9862 -0.9983 -0.9594
## 2: -0.9421 -0.9848 -0.9820 -0.9923 -0.9949 -0.9822 -0.9727 -0.9840 -0.9511
## 3: -0.9464 -0.9894 -0.9885 -0.9916 -0.9914 -0.9870 -0.9782 -0.9866 -0.9570
##       V484    V485    V486    V487    V488    V489    V490    V491    V492
## 1: -0.9799 -0.9921 -0.9895 -0.9531 -0.9920 -0.8808 -0.9629 -0.9852 -0.9855
## 2: -0.9808 -0.9923 -0.9739 -0.9459 -0.9917 -0.7537 -0.9558 -0.9806 -0.9901
## 3: -0.9867 -0.9904 -0.9789 -0.9546 -0.9906 -0.8285 -0.9702 -0.9873 -0.9932
##       V493    V494    V495    V496    V497    V498    V499    V500    V501
## 1: -0.9965 -0.9811 -0.9848 -0.9829 -0.8742 -0.9788 -0.9924 -0.9840 -0.8728
## 2: -0.9947 -0.9797 -0.9677 -0.9688 -0.7509 -0.9767 -0.9907 -0.9681 -0.7495
## 3: -0.9941 -0.9907 -0.9941 -0.9969 -0.8269 -0.9846 -0.9932 -0.9953 -0.8260
##       V502    V503    V504    V505    V506    V507    V508    V509    V510
## 1: -0.9877 -0.3768 -0.4457 -0.3536 -0.5718 -0.9461 -0.3768 -0.7889 -0.5377
## 2: -0.9902 -0.4183 -0.4818 -0.3644 -0.6748 -0.9891 -0.4183 -0.8153 -0.5145
## 3: -0.9932 -0.4185 -0.4837 -0.4112 -0.6077 -0.9709 -0.4185 -0.8162 -0.5624
##      V511    V512     V513    V514    V515    V516    V517    V518    V519
## 1: 0.4452 -0.5172 -0.04353 -0.3106 -0.6261 -0.4696 -0.5483 -0.4649 -0.6047
## 2: 0.4268 -0.5172 -0.11845 -0.4529 -0.7786 -0.5154 -0.5298 -0.4419 -0.6072
## 3: 0.4025 -0.5172 -0.08252 -0.2717 -0.5973 -0.4981 -0.4967 -0.5262 -0.4924
##       V520    V521    V522    V523   V524    V525    V526    V527     V528
## 1: -0.6456 -0.4696 -0.8715 -0.4501 0.1498 -0.9048 0.17321 -0.2970 -0.60446
## 2: -0.9052 -0.5154 -0.8809 -0.5261 0.1660 -0.9048 0.08981 -0.2927 -0.63797
## 3: -0.8729 -0.4981 -0.8689 -0.5990 0.0804 -0.9048 0.05270  0.2269 -0.04265
##       V529    V530    V531    V532    V533    V534    V535    V536   V537
## 1: -0.5621 -0.2289 -0.3547 -0.3081 -0.9354 -0.5621 -0.7291 -0.7533 0.2662
## 2: -0.5971 -0.2280 -0.4022 -0.1694 -0.9663 -0.5971 -0.7359 -0.8122 0.2347
## 3: -0.6381 -0.5861 -0.5363 -0.6724 -0.8936 -0.6381 -0.9026 -0.6464 0.3360
##       V538    V539     V540    V541    V542    V543    V544    V545
## 1: -1.0000 -0.5667  0.04091 -0.4065 -0.8097 -0.8692 -0.8449 -0.9023
## 2: -1.0000 -0.5530  0.27928 -0.0740 -0.8176 -0.8641 -0.8265 -0.9038
## 3: -0.8462 -0.3172 -0.40192 -0.7543 -0.8192 -0.8498 -0.8296 -0.8451
##       V546    V547    V548    V549     V550    V551   V552    V553    V554
## 1: -0.8620 -0.8097 -0.9847 -0.8377 -0.03734 -0.7778 0.3271 -0.5417 -0.8467
## 2: -0.9172 -0.8176 -0.9853 -0.7901  0.03411 -0.9048 0.2057 -0.6463 -0.9135
## 3: -0.8406 -0.8192 -0.9845 -0.8116 -0.06455 -0.9048 0.1246 -0.1723 -0.4702
##        V555    V556    V557    V558    V559   V560   V561
## 1: -0.66212  0.3478 -0.9524 -0.7914 -0.4939 0.2900 0.3142
## 2: -0.01193  0.7089 -0.9348  0.6489 -0.4896 0.2917 0.3165
## 3:  0.30613 -0.5945  0.8286  0.8462 -0.4880 0.2878 0.3207
```

```r
names(dt)
```

```
##   [1] "subject"     "activityNum" "V1"          "V2"          "V3"         
##   [6] "V4"          "V5"          "V6"          "V7"          "V8"         
##  [11] "V9"          "V10"         "V11"         "V12"         "V13"        
##  [16] "V14"         "V15"         "V16"         "V17"         "V18"        
##  [21] "V19"         "V20"         "V21"         "V22"         "V23"        
##  [26] "V24"         "V25"         "V26"         "V27"         "V28"        
##  [31] "V29"         "V30"         "V31"         "V32"         "V33"        
##  [36] "V34"         "V35"         "V36"         "V37"         "V38"        
##  [41] "V39"         "V40"         "V41"         "V42"         "V43"        
##  [46] "V44"         "V45"         "V46"         "V47"         "V48"        
##  [51] "V49"         "V50"         "V51"         "V52"         "V53"        
##  [56] "V54"         "V55"         "V56"         "V57"         "V58"        
##  [61] "V59"         "V60"         "V61"         "V62"         "V63"        
##  [66] "V64"         "V65"         "V66"         "V67"         "V68"        
##  [71] "V69"         "V70"         "V71"         "V72"         "V73"        
##  [76] "V74"         "V75"         "V76"         "V77"         "V78"        
##  [81] "V79"         "V80"         "V81"         "V82"         "V83"        
##  [86] "V84"         "V85"         "V86"         "V87"         "V88"        
##  [91] "V89"         "V90"         "V91"         "V92"         "V93"        
##  [96] "V94"         "V95"         "V96"         "V97"         "V98"        
## [101] "V99"         "V100"        "V101"        "V102"        "V103"       
## [106] "V104"        "V105"        "V106"        "V107"        "V108"       
## [111] "V109"        "V110"        "V111"        "V112"        "V113"       
## [116] "V114"        "V115"        "V116"        "V117"        "V118"       
## [121] "V119"        "V120"        "V121"        "V122"        "V123"       
## [126] "V124"        "V125"        "V126"        "V127"        "V128"       
## [131] "V129"        "V130"        "V131"        "V132"        "V133"       
## [136] "V134"        "V135"        "V136"        "V137"        "V138"       
## [141] "V139"        "V140"        "V141"        "V142"        "V143"       
## [146] "V144"        "V145"        "V146"        "V147"        "V148"       
## [151] "V149"        "V150"        "V151"        "V152"        "V153"       
## [156] "V154"        "V155"        "V156"        "V157"        "V158"       
## [161] "V159"        "V160"        "V161"        "V162"        "V163"       
## [166] "V164"        "V165"        "V166"        "V167"        "V168"       
## [171] "V169"        "V170"        "V171"        "V172"        "V173"       
## [176] "V174"        "V175"        "V176"        "V177"        "V178"       
## [181] "V179"        "V180"        "V181"        "V182"        "V183"       
## [186] "V184"        "V185"        "V186"        "V187"        "V188"       
## [191] "V189"        "V190"        "V191"        "V192"        "V193"       
## [196] "V194"        "V195"        "V196"        "V197"        "V198"       
## [201] "V199"        "V200"        "V201"        "V202"        "V203"       
## [206] "V204"        "V205"        "V206"        "V207"        "V208"       
## [211] "V209"        "V210"        "V211"        "V212"        "V213"       
## [216] "V214"        "V215"        "V216"        "V217"        "V218"       
## [221] "V219"        "V220"        "V221"        "V222"        "V223"       
## [226] "V224"        "V225"        "V226"        "V227"        "V228"       
## [231] "V229"        "V230"        "V231"        "V232"        "V233"       
## [236] "V234"        "V235"        "V236"        "V237"        "V238"       
## [241] "V239"        "V240"        "V241"        "V242"        "V243"       
## [246] "V244"        "V245"        "V246"        "V247"        "V248"       
## [251] "V249"        "V250"        "V251"        "V252"        "V253"       
## [256] "V254"        "V255"        "V256"        "V257"        "V258"       
## [261] "V259"        "V260"        "V261"        "V262"        "V263"       
## [266] "V264"        "V265"        "V266"        "V267"        "V268"       
## [271] "V269"        "V270"        "V271"        "V272"        "V273"       
## [276] "V274"        "V275"        "V276"        "V277"        "V278"       
## [281] "V279"        "V280"        "V281"        "V282"        "V283"       
## [286] "V284"        "V285"        "V286"        "V287"        "V288"       
## [291] "V289"        "V290"        "V291"        "V292"        "V293"       
## [296] "V294"        "V295"        "V296"        "V297"        "V298"       
## [301] "V299"        "V300"        "V301"        "V302"        "V303"       
## [306] "V304"        "V305"        "V306"        "V307"        "V308"       
## [311] "V309"        "V310"        "V311"        "V312"        "V313"       
## [316] "V314"        "V315"        "V316"        "V317"        "V318"       
## [321] "V319"        "V320"        "V321"        "V322"        "V323"       
## [326] "V324"        "V325"        "V326"        "V327"        "V328"       
## [331] "V329"        "V330"        "V331"        "V332"        "V333"       
## [336] "V334"        "V335"        "V336"        "V337"        "V338"       
## [341] "V339"        "V340"        "V341"        "V342"        "V343"       
## [346] "V344"        "V345"        "V346"        "V347"        "V348"       
## [351] "V349"        "V350"        "V351"        "V352"        "V353"       
## [356] "V354"        "V355"        "V356"        "V357"        "V358"       
## [361] "V359"        "V360"        "V361"        "V362"        "V363"       
## [366] "V364"        "V365"        "V366"        "V367"        "V368"       
## [371] "V369"        "V370"        "V371"        "V372"        "V373"       
## [376] "V374"        "V375"        "V376"        "V377"        "V378"       
## [381] "V379"        "V380"        "V381"        "V382"        "V383"       
## [386] "V384"        "V385"        "V386"        "V387"        "V388"       
## [391] "V389"        "V390"        "V391"        "V392"        "V393"       
## [396] "V394"        "V395"        "V396"        "V397"        "V398"       
## [401] "V399"        "V400"        "V401"        "V402"        "V403"       
## [406] "V404"        "V405"        "V406"        "V407"        "V408"       
## [411] "V409"        "V410"        "V411"        "V412"        "V413"       
## [416] "V414"        "V415"        "V416"        "V417"        "V418"       
## [421] "V419"        "V420"        "V421"        "V422"        "V423"       
## [426] "V424"        "V425"        "V426"        "V427"        "V428"       
## [431] "V429"        "V430"        "V431"        "V432"        "V433"       
## [436] "V434"        "V435"        "V436"        "V437"        "V438"       
## [441] "V439"        "V440"        "V441"        "V442"        "V443"       
## [446] "V444"        "V445"        "V446"        "V447"        "V448"       
## [451] "V449"        "V450"        "V451"        "V452"        "V453"       
## [456] "V454"        "V455"        "V456"        "V457"        "V458"       
## [461] "V459"        "V460"        "V461"        "V462"        "V463"       
## [466] "V464"        "V465"        "V466"        "V467"        "V468"       
## [471] "V469"        "V470"        "V471"        "V472"        "V473"       
## [476] "V474"        "V475"        "V476"        "V477"        "V478"       
## [481] "V479"        "V480"        "V481"        "V482"        "V483"       
## [486] "V484"        "V485"        "V486"        "V487"        "V488"       
## [491] "V489"        "V490"        "V491"        "V492"        "V493"       
## [496] "V494"        "V495"        "V496"        "V497"        "V498"       
## [501] "V499"        "V500"        "V501"        "V502"        "V503"       
## [506] "V504"        "V505"        "V506"        "V507"        "V508"       
## [511] "V509"        "V510"        "V511"        "V512"        "V513"       
## [516] "V514"        "V515"        "V516"        "V517"        "V518"       
## [521] "V519"        "V520"        "V521"        "V522"        "V523"       
## [526] "V524"        "V525"        "V526"        "V527"        "V528"       
## [531] "V529"        "V530"        "V531"        "V532"        "V533"       
## [536] "V534"        "V535"        "V536"        "V537"        "V538"       
## [541] "V539"        "V540"        "V541"        "V542"        "V543"       
## [546] "V544"        "V545"        "V546"        "V547"        "V548"       
## [551] "V549"        "V550"        "V551"        "V552"        "V553"       
## [556] "V554"        "V555"        "V556"        "V557"        "V558"       
## [561] "V559"        "V560"        "V561"
```

## 2. Extract only the mean and standard deviation

```r
## 2. Extract only the mean and standard deviation

dtFeatures <- fread(file.path(path, "features.txt"))
setnames(dtFeatures, names(dtFeatures), c("ID", "featureName"))

dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]

dtFeatures$featureID <- dtFeatures[, paste0("V", ID)]

##Subset these variables using variable names.
select <- c(key(dt), dtFeatures$featureID)
dt <- dt[  ,select, with = FALSE]

names(dt)
```

```
##  [1] "subject"     "activityNum" "V1"          "V2"          "V3"         
##  [6] "V4"          "V5"          "V6"          "V41"         "V42"        
## [11] "V43"         "V44"         "V45"         "V46"         "V81"        
## [16] "V82"         "V83"         "V84"         "V85"         "V86"        
## [21] "V121"        "V122"        "V123"        "V124"        "V125"       
## [26] "V126"        "V161"        "V162"        "V163"        "V164"       
## [31] "V165"        "V166"        "V201"        "V202"        "V214"       
## [36] "V215"        "V227"        "V228"        "V240"        "V241"       
## [41] "V253"        "V254"        "V266"        "V267"        "V268"       
## [46] "V269"        "V270"        "V271"        "V345"        "V346"       
## [51] "V347"        "V348"        "V349"        "V350"        "V424"       
## [56] "V425"        "V426"        "V427"        "V428"        "V429"       
## [61] "V503"        "V504"        "V516"        "V517"        "V529"       
## [66] "V530"        "V542"        "V543"
```

## 3. Uses descriptive activity names to name the activities in the data set


```r
dtActivity <- fread(file.path(path, "activity_labels.txt"))
setnames (dtActivity, names(dtActivity), c("activityNum", "activityName"))
head(dtActivity)
```

```
##    activityNum       activityName
## 1:           1            WALKING
## 2:           2   WALKING_UPSTAIRS
## 3:           3 WALKING_DOWNSTAIRS
## 4:           4            SITTING
## 5:           5           STANDING
## 6:           6             LAYING
```

## 4. Appropriately labels the data set with descriptive variable names. 


```r
## Adding activityName to dt1
dt1 <- merge(dtActivity, dt, by = "activityNum", all.y = TRUE)

setkey(dt1, subject, activityNum, activityName)

head(dt1, n=3)
```

```
##    activityNum activityName subject     V1        V2       V3      V4
## 1:           1      WALKING       1 0.2921 -0.018472 -0.12084 -0.3297
## 2:           1      WALKING       1 0.2667 -0.006808 -0.13698 -0.3963
## 3:           1      WALKING       1 0.2673 -0.024155 -0.07899 -0.3932
##         V5      V6    V41     V42     V43     V44     V45     V46     V81
## 1: -0.1512 -0.2070 0.8031 -0.2995 -0.4091 -0.9714 -0.9447 -0.9500 0.02885
## 2: -0.1343 -0.2310 0.7979 -0.3014 -0.4114 -0.9787 -0.9596 -0.9513 0.03046
## 3: -0.1529 -0.1999 0.7987 -0.2963 -0.4177 -0.9854 -0.9821 -0.9646 0.12915
##         V82      V83     V84     V85     V86     V121      V122    V123
## 1:  0.03454 -0.06251 -0.4251 -0.4602 -0.6545  0.39102 -0.331633 -0.4347
## 2:  0.01365  0.08448 -0.4676 -0.4837 -0.6726  0.29863 -0.250172 -0.3326
## 3: -0.03730  0.01746 -0.4772 -0.4525 -0.6634 -0.07858  0.001131  0.1704
##       V124    V125    V126     V161      V162      V163    V164    V165
## 1: -0.3725 -0.7074 -0.4967 -0.03746 -0.059965 -0.149191 -0.7325 -0.7867
## 2: -0.3567 -0.6859 -0.2939 -0.20090  0.093194  0.073816 -0.7325 -0.7957
## 3: -0.4811 -0.7107 -0.4124 -0.24853  0.003569 -0.009966 -0.7010 -0.8103
##       V166    V201    V202    V214    V215    V227    V228    V240    V241
## 1: -0.7606 -0.2046 -0.3571 -0.2046 -0.3571 -0.4554 -0.5021 -0.2662 -0.2661
## 2: -0.7514 -0.2453 -0.3993 -0.2453 -0.3993 -0.4941 -0.5210 -0.2772 -0.2754
## 3: -0.7814 -0.2391 -0.4008 -0.2391 -0.4008 -0.4957 -0.4963 -0.4513 -0.5614
##       V253    V254    V266    V267    V268    V269    V270    V271    V345
## 1: -0.7542 -0.8283 -0.4294 -0.2992 -0.4397 -0.2941 -0.1342 -0.1560 -0.4730
## 2: -0.7584 -0.8314 -0.4640 -0.3089 -0.4847 -0.3714 -0.1075 -0.1710 -0.5087
## 3: -0.7660 -0.8268 -0.5049 -0.2936 -0.4569 -0.3542 -0.1390 -0.1401 -0.5179
##       V346    V347    V348    V349    V350    V424    V425    V426    V427
## 1: -0.5056 -0.6489 -0.4260 -0.4459 -0.6582 -0.5378 -0.7087 -0.5545 -0.3476
## 2: -0.5352 -0.6672 -0.4716 -0.4615 -0.6761 -0.4969 -0.6951 -0.4567 -0.3361
## 3: -0.5068 -0.6451 -0.4809 -0.4291 -0.6794 -0.4663 -0.7187 -0.5791 -0.4908
##       V428    V429    V503    V504    V516    V517    V529    V530    V542
## 1: -0.7086 -0.5250 -0.3768 -0.4457 -0.4696 -0.5483 -0.5621 -0.2289 -0.8097
## 2: -0.6824 -0.3126 -0.4183 -0.4818 -0.5154 -0.5298 -0.5971 -0.2280 -0.8176
## 3: -0.7078 -0.4208 -0.4185 -0.4837 -0.4981 -0.4967 -0.6381 -0.5861 -0.8192
##       V543
## 1: -0.8692
## 2: -0.8641
## 3: -0.8498
```

```r
## Reshaping data table
dtmelt <- data.table(melt(dt1, key(dt1), variable.name = "featureID"))
head(dtmelt, n=3)
```

```
##    subject activityNum activityName featureID  value
## 1:       1           1      WALKING        V1 0.2921
## 2:       1           1      WALKING        V1 0.2667
## 3:       1           1      WALKING        V1 0.2673
```

```r
## Adding featureName to data.table
dt2 <- merge(dtFeatures[, list(featureID, featureName)], dtmelt,  by = "featureID", 
             all.x = TRUE)
setkey(dt2, featureID, featureName, subject, activityNum, activityName) 

names(dt2)
```

```
## [1] "featureID"    "featureName"  "subject"      "activityNum" 
## [5] "activityName" "value"
```

```r
head(dt2, n=3)
```

```
##    featureID       featureName subject activityNum activityName  value
## 1:        V1 tBodyAcc-mean()-X       1           1      WALKING 0.2921
## 2:        V1 tBodyAcc-mean()-X       1           1      WALKING 0.2667
## 3:        V1 tBodyAcc-mean()-X       1           1      WALKING 0.2673
```

## 5. Creates a second, independent tidy data set with the average of each variable  for each activity and each subject. 

```r
tidata <- dcast(dt2, subject + activityNum + activityName ~ featureName, mean)
head(tidata, n=3)
```

```
##   subject activityNum       activityName fBodyAcc-mean()-X
## 1       1           1            WALKING           -0.5225
## 2       1           2   WALKING_UPSTAIRS           -0.9934
## 3       1           3 WALKING_DOWNSTAIRS           -0.9894
##   fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y
## 1           -0.4430           -0.4617          -0.4063          -0.4125
## 2           -0.9807           -0.9856          -0.9936          -0.9794
## 3           -0.9627           -0.9730          -0.9903          -0.9478
##   fBodyAcc-std()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y
## 1          -0.3250               -0.5902               -0.5748
## 2          -0.9799               -0.9941               -0.9864
## 3          -0.9556               -0.9902               -0.9810
##   fBodyAccJerk-mean()-Z fBodyAccJerk-std()-X fBodyAccJerk-std()-Y
## 1               -0.6274              -0.5764              -0.5524
## 2               -0.9892              -0.9945              -0.9879
## 3               -0.9859              -0.9910              -0.9829
##   fBodyAccJerk-std()-Z fBodyAccMag-mean() fBodyAccMag-std()
## 1              -0.6831            -0.4405           -0.4956
## 2              -0.9913            -0.9872           -0.9855
## 3              -0.9883            -0.9685           -0.9562
##   fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
## 1                    -0.5420                   -0.5722
## 2                    -0.9914                   -0.9915
## 3                    -0.9853                   -0.9836
##   fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
## 1                     -0.8048                    -0.8397
## 2                     -0.9951                    -0.9948
## 3                     -0.9918                    -0.9904
##   fBodyBodyGyroMag-mean() fBodyBodyGyroMag-std() fBodyGyro-mean()-X
## 1                 -0.6979                -0.6474            -0.6302
## 2                 -0.9842                -0.9775            -0.9860
## 3                 -0.9758                -0.9638            -0.9747
##   fBodyGyro-mean()-Y fBodyGyro-mean()-Z fBodyGyro-std()-X
## 1            -0.7048            -0.6114           -0.6313
## 2            -0.9879            -0.9888           -0.9881
## 3            -0.9831            -0.9810           -0.9756
##   fBodyGyro-std()-Y fBodyGyro-std()-Z tBodyAcc-mean()-X tBodyAcc-mean()-Y
## 1           -0.6740           -0.5834            0.2736          -0.01530
## 2           -0.9834           -0.9911            0.2771          -0.01727
## 3           -0.9772           -0.9804            0.2803          -0.01524
##   tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z
## 1           -0.1190          -0.4361          -0.3963          -0.3361
## 2           -0.1061          -0.9935          -0.9796          -0.9815
## 3           -0.1042          -0.9900          -0.9506          -0.9596
##   tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
## 1               0.07085              0.008952              0.014135
## 2               0.07515              0.009720             -0.002982
## 3               0.07445              0.012492             -0.003685
##   tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
## 1              -0.5642              -0.5494              -0.6558
## 2              -0.9940              -0.9866              -0.9909
## 3              -0.9902              -0.9812              -0.9878
##   tBodyAccJerkMag-mean() tBodyAccJerkMag-std() tBodyAccMag-mean()
## 1                -0.5609               -0.5535            -0.3525
## 2                -0.9922               -0.9919            -0.9871
## 3                -0.9886               -0.9851            -0.9691
##   tBodyAccMag-std() tBodyGyro-mean()-X tBodyGyro-mean()-Y
## 1           -0.4174            0.03429           -0.04964
## 2           -0.9851           -0.03557           -0.05879
## 3           -0.9558           -0.02978           -0.07967
##   tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
## 1            0.03343           -0.6264           -0.6824           -0.5573
## 2            0.09170           -0.9875           -0.9849           -0.9898
## 3            0.08905           -0.9751           -0.9792           -0.9792
##   tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
## 1               -0.12738               -0.04029               -0.05023
## 2               -0.09605               -0.04319               -0.05717
## 3               -0.09959               -0.03871               -0.05493
##   tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
## 1               -0.7669               -0.7965               -0.7639
## 2               -0.9939               -0.9949               -0.9945
## 3               -0.9882               -0.9930               -0.9920
##   tBodyGyroJerkMag-mean() tBodyGyroJerkMag-std() tBodyGyroMag-mean()
## 1                 -0.7782                -0.8137             -0.4971
## 2                 -0.9958                -0.9950             -0.9744
## 3                 -0.9932                -0.9910             -0.9673
##   tBodyGyroMag-std() tGravityAcc-mean()-X tGravityAcc-mean()-Y
## 1            -0.6267               0.8825             -0.01900
## 2            -0.9777               0.9073             -0.16888
## 3            -0.9645               0.9359             -0.01152
##   tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y
## 1             -0.27316             -0.9640             -0.9501
## 2             -0.03831             -0.9894             -0.9854
## 3             -0.12712             -0.9879             -0.9713
##   tGravityAcc-std()-Z tGravityAccMag-mean() tGravityAccMag-std()
## 1             -0.9306               -0.3525              -0.4174
## 2             -0.9814               -0.9871              -0.9851
## 3             -0.9643               -0.9691              -0.9558
```

```r
## Write tidata to file "tidydata.txt"
write.table(tidata, file = "tidydata.txt", sep = " ", row.names = TRUE, col.names = TRUE)
```

