## Download the file. Put it in the GettingandCleaningData folder.
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "Dataset.zip"

path <- getwd()

if(!file.exists(path))
{
  dir.create(path)
}

download.file(url, file.path(path,filename))

## Load packages

packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

## Read files to datatables
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

## 1.  Merges the training and the test sets to create one data set.

dtSubject <- rbind(dtSubjectTest, dtSubjectTrain)
setnames(dtSubject, "V1", "subject")

dtY <- rbind(dtYTest, dtYTrain)
setnames(dtY, "V1", "activityNum")

dtX <- rbind(dtXTrain, dtXTest)

dtSubY <- cbind(dtSubject, dtY)

dt <- cbind (dtSubY, dtX)

setkey(dt, subject, activityNum)

## 2. Extract only the mean and standard deviation

dtFeatures <- fread(file.path(path, "features.txt"))
setnames(dtFeatures, names(dtFeatures), c("ID", "featureName"))

dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", featureName)]

dtFeatures$featureID <- dtFeatures[, paste0("V", ID)]

##Subset these variables using variable names.
select <- c(key(dt), dtFeatures$featureID)
dt <- dt[  ,select, with = FALSE]

## 3. Uses descriptive activity names to name the activities in the data set

dtActivity <- fread(file.path(path, "activity_labels.txt"))
setnames (dtActivity, names(dtActivity), c("activityNum", "activityName"))

## 4. Appropriately labels the data set with descriptive variable names. 
## Adding activityName to dt1
dt1 <- merge(dtActivity, dt, by = "activityNum", all.y = TRUE)

setkey(dt1, subject, activityNum, activityName)

## Reshaping data table
dtmelt <- data.table(melt(dt1, key(dt1), variable.name = "featureID"))

## Adding featureName to data.table
dt2 <- merge(dtFeatures[, list(featureID, featureName)], dtmelt,  by = "featureID", 
             all.x = TRUE)
setkey(dt2, featureID, featureName, subject, activityNum, activityName)

## 5. Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject. 

tidata <- dcast(dt2, subject + activityNum + activityName ~ featureName, mean)

write.table(tidata, file = "tidydata.txt", sep = " ", row.names = TRUE, col.names = TRUE)