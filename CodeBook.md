##CodeBook.md for the Getting and Cleaning Data - Course Project

###Data

It is assumed that the user is in the working directory where the data directory files are stored.
From the extracted zip file of the data, that would be in the directory "UCI HAR Dataset/".

####The Data include the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Subject labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Subject labels.


####The R_Analysis.R script performs the following actions on the data.
1. Reads in the Test set from X_test.txt.
2. Populates descriptive column names for the Test set using the features.txt file.
3. Includes a subject identifier for the Test set by using the subject_test.txt file.
4. Includes the activity and activity labels for the Test set using the y_test.txt and activity_labels.txt files.
5. Reads in the Training set from X_train.txt.
6. Populates descriptive column names for the Training set using the features.txt file.
7. Includes a subject identifier for the Training set by using the subject_train.txt file.
8. Includes the activity and activity labels for the Training set using the y_train.txt and activity_labels.txt files.
9. Combines rows from the Test and Training sets.
10 Cleans up extraneous characters from the column names.
11. Extracts a subset of columns for mean and standard deviation measurements per the assignment description.
12. Groups the data by subject and activity.
13. Summarizes each grouping by he mean of each column.
14. Outputs the file.


####The data include the following activity labels:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

####The data include the following variables by column number:

- 1 subject
- 2 activity
- 3 tbodyaccmeanx
- 4 tbodyaccmeany
- 5 tbodyaccmeanz
- 6 tbodyaccstdx
- 7 tbodyaccstdy
- 8 tbodyaccstdz
- 9 tgravityaccmeanx
- 10 tgravityaccmeany
- 11 tgravityaccmeanz
- 12 tgravityaccstdx
- 13 tgravityaccstdy
- 14 tgravityaccstdz
- 15 tbodyaccjerkmeanx
- 16 tbodyaccjerkmeany
- 17 tbodyaccjerkmeanz
- 18 tbodyaccjerkstdx
- 19 tbodyaccjerkstdy
- 20 tbodyaccjerkstdz
- 21 tbodygyromeanx
- 22 tbodygyromeany
- 23 tbodygyromeanz
- 24 tbodygyrostdx
- 25 tbodygyrostdy
- 26 tbodygyrostdz
- 27 tbodygyrojerkmeanx
- 28 tbodygyrojerkmeany
- 29 tbodygyrojerkmeanz
- 30 tbodygyrojerkstdx
- 31 tbodygyrojerkstdy
- 32 tbodygyrojerkstdz
- 33 tbodyaccmagmean
- 34 tbodyaccmagstd
- 35 tgravityaccmagmean
- 36 tgravityaccmagstd
- 37 tbodyaccjerkmagmean
- 38 tbodyaccjerkmagstd
- 39 tbodygyromagmean
- 40 tbodygyromagstd
- 41 tbodygyrojerkmagmean
- 42 tbodygyrojerkmagstd
- 43 fbodyaccmeanx
- 44 fbodyaccmeany
- 45 fbodyaccmeanz
- 46 fbodyaccstdx
- 47 fbodyaccstdy
- 48 fbodyaccstdz
- 49 fbodyaccmeanfreqx
- 50 fbodyaccmeanfreqy
- 51 fbodyaccmeanfreqz
- 52 fbodyaccjerkmeanx
- 53 fbodyaccjerkmeany
- 54 fbodyaccjerkmeanz
- 55 fbodyaccjerkstdx
- 56 fbodyaccjerkstdy
- 57 fbodyaccjerkstdz
- 58 fbodyaccjerkmeanfreqx
- 59 fbodyaccjerkmeanfreqy
- 60 fbodyaccjerkmeanfreqz
- 61 fbodygyromeanx
- 62 fbodygyromeany
- 63 fbodygyromeanz
- 64 fbodygyrostdx
- 65 fbodygyrostdy
- 66 fbodygyrostdz
- 67 fbodygyromeanfreqx
- 68 fbodygyromeanfreqy
- 69 fbodygyromeanfreqz
- 70 fbodyaccmagmean
- 71 fbodyaccmagstd
- 72 fbodyaccmagmeanfreq
- 73 fbodybodyaccjerkmagmean
- 74 fbodybodyaccjerkmagstd
- 75 fbodybodyaccjerkmagmeanfreq
- 76 fbodybodygyromagmean
- 77 fbodybodygyromagstd
- 78 fbodybodygyromagmeanfreq
- 79 fbodybodygyrojerkmagmean
- 80 fbodybodygyrojerkmagstd
- 81 fbodybodygyrojerkmagmeanfreq
- 82 angletbodyaccmeantogravity
- 83 angletbodyaccjerkmeantogravitymean
- 84 angletbodygyromeantogravitymean
- 85 angletbodygyrojerkmeantogravitymean
- 86 anglextogravitymean
- 87 angleytogravitymean
- 88 angleztogravitymean
