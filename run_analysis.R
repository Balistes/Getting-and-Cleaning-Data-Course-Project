# Step 0 Load needed packages and execute work steps
# before performing the data clean-up operations must be download the following R-packages
if(!is.element("plyr", installed.packages()[,1])) {
  install.packages("plyr")
}
library(plyr)

if(!is.element("data.table", installed.packages()[,1])) {
  install.packages("data.table")
}
library(data.table)


# insert the name of your own working directory instead of the following names 
# workdir <- "~/Desktop/Coursera/GettingClearingData/Week4/Project"
# setwd(workdir)
if( !file.exists("./data") ) {
    dir.create("./data")
}

# read and unzip destination file
# variable filesdest is the path to the unpacked files
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCIHARDataset.zip", method = "curl")
unzip(zipfile="./data/UCIHARDataset.zip",exdir="./data")
fd <- file.path("./data" , "UCI HAR Dataset")
testfd  <- file.path(fd, "test")
trainfd <- file.path(fd, "train")

# read data from test folder
xtestdata <- read.table(file.path(testfd,"X_test.txt"))
ytestdata <- read.table(file.path(testfd,"y_test.txt"))
subjtestdata <- read.table(file.path(testfd,"subject_test.txt"))

# read data from train folder
xtraindata <- read.table(file.path(trainfd,"X_train.txt"))
ytraindata <- read.table(file.path(trainfd,"y_train.txt"))
subjtraindata <- read.table(file.path(trainfd,"subject_train.txt"))

# read data from main folder
featdata <- read.table(file.path(fd,"features.txt"))
actlabdata <- read.table(file.path(fd,"activity_labels.txt"))

# Step 1 Merges the training and the test sets to create one data set
setsdata <- rbind(xtraindata,xtestdata)
setslabels <- rbind(ytraindata,ytestdata)
setssubj <- rbind(subjtraindata,subjtestdata)

# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement
meanstdcol <- grep("-(mean|std)\\(\\)",featdata[,2])
# Create subset with mean and standard deviation
setsdata <- setsdata[,meanstdcol]

# Step 3 Uses descriptive activity names to name the activities in the data set
# True columns name
names(setsdata) <- featdata[meanstdcol,2]

# Name the activities
setslabels[,1] <- actlabdata[setslabels[,1],2]
names(setslabels) <- "activity"

# Step 4 Appropriately labels the data set with descriptive variable names
names(setssubj) <- "subject"

# bind all the data in a single data set
firstdataset <- cbind(setsdata, setslabels, setssubj)

# Step 5 From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
secondtidyset <- ddply(firstdataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write tidy sets to files
# write.table(firstdataset, file.path("./data","clean_data.txt"))
write.table(secondtidyset,file.path("./data","second_set.txt"),row.name=FALSE)




