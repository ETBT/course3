#Created for R version 3.2.0
#It is assumed that the user is in the working directory where the data directory files are stored.
#From the extracted zip file of the data, that would be in the directory "UCI HAR Dataset/".


#*************Acquire and properly label test data.*******************************************************
#read in test data
initial <- read.table("./test/x_test.txt", nrows = 100)     #read the first 100 rows for R to determine the column classes
classes <- sapply(initial,class)                            #create a vector variable to store the determined classes
testdata <- read.table("./test/x_test.txt", colClasses = classes)       #read in the full test set and set the column classes. This loads data faster.

#populate column names
features <- read.table("features.txt")          #get column names from the features file 
colnames(testdata) <- features$V2               #apply the names to the testdata data frame.

#include test subject data in the testdata
testsubject <- read.table("./test/subject_test.txt")        #get data for the test subjects
testdata <- cbind(testsubject, testdata)                    #merge the data about the subjects into testdata
names(testdata)[names(testdata) == "V1"] <- "subject"       #change the name of the V1 column to the more descriptive label "subject"

#merge test activity data into the testdata
activity <- read.table("./test/y_test.txt")                 #get observation data for the activity identification
testdata <- cbind(activity, testdata)                       #merge the data about the activity identification into testdata

# merge activity labels into the testdata
activitylabel <- read.table("activity_labels.txt")
testdata <- merge(testdata, activitylabel, by = "V1", sort = FALSE)
names(testdata)[names(testdata) == "V2"] <- "activity"


#*************Acquire and properly label training data.*******************************************************
#read in training data
initial <- read.table("./train/x_train.txt", nrows = 100)         #read the first 100 rows for R to determine the column classes
classes <- sapply(initial,class)                                  #create a vector variable to store the determined classes
traindata <- read.table("./train/x_train.txt", colClasses = classes)    #read in the full test set and set the column classes. This loads data faster.
colnames(traindata) <- features$V2

#match training subject to data
trainsubject <- read.table("./train/subject_train.txt")
traindata <- cbind(trainsubject, traindata)
#change the name of the V1 column to the more descriptive label "subject"
names(traindata)[names(traindata) == "V1"] <- "subject"


#match training activity to data
activity <- read.table("./train/y_train.txt")
traindata <- cbind(activity, traindata)


# merge by label id and populate the label
activitylabel <- read.table("activity_labels.txt")
traindata <- merge(traindata, activitylabel, by = "V1", sort = FALSE)
names(traindata)[names(traindata) == "V2"] <- "activity"


#*************Combine the training and test data and tidy up the column names.*******************************************************
#bind the two sets together by row
combined <- rbind(testdata, traindata)
combined$V1 <- NULL                       #remove the column named V1

#tidy up the variable/column names
names(combined) <- tolower(names(combined))
names(combined) <- gsub("\\(","",names(combined))
names(combined) <- gsub("\\)","",names(combined))
names(combined) <- gsub("-","",names(combined))
names(combined) <- gsub(",","to",names(combined))


#*************Extract and Summarize the Data as Instructed.*******************************************************
#Extract only the measurements on the mean and standard deviation for each measurement.
extractcolumns <- c("subject", "activity", grep("mean", names(combined), value=TRUE), grep("std", names(combined), value=TRUE))
finalsubset <- combined[, which(names(combined) %in% extractcolumns)]

#Group the data by subject and activity
bySubjectActivity <- group_by(finalsubset, subject, activity)     #create a variable to store the grouping.

#Summarize each grouping by he mean of each column.
SummarySubjectActivity <- summarize_each(bySubjectActivity, funs(mean))

#output the file.
write.table(SummarySubjectActivity, file = "tidy.txt", row.names = FALSE, quote = FALSE)
