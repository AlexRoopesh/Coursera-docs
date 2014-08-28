##You should create one R script called run_analysis.R that does the following. 
##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive activity names. 
##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## set the working directory to the Coursera Folder
## setwd("./Coursera R/data")
##********************************************************
## Creating a single merged test and train data set
##*******************************************************

## Read the Subject_test file from the test dataset
sTest <- read.table("./smartdata/UCI HAR Dataset/test/subject_test.txt")
## Calculate the no of rows -Subject has 2947 rows in the test folder
nrow(sTest)
        
## Read the X_test file from the test dataset
xTest <- read.table("./smartdata/UCI HAR Dataset/test/X_test.txt")
## Calculate the no of rows (X has 2947 rows in the test folder)
nrow(sTest)
## Calculate the no of cols (X has 561 cols in the test folder)
nrow(sTest)

## Read the Y_test file from the test dataset
yTest <- read.table("./smartdata/UCI HAR Dataset/test/y_test.txt")

## Calculate the no of rows (X has 2947 rows in the test folder)
nrow(sTest)

## read the header name for X file 
features <- read.table("./smartdata/UCI HAR Dataset/features.txt")

## Col heads
names(features)<- c("A1", "A2")

## Creating a vector with all the header names
xNames <- c("")
for(i in 1:561){xNames[i]<- as.character(features$A2[i])}

## Adding names to subject, xTest, yTest in Test
names(sTest)[1] <- "subject"
names(xTest) <- xNames
names(yTest)[1] <- "activity.type"

## bind all test data together 
testAll <- cbind(sTest, xTest, yTest)

## Repeat the same for train datasets, 7352 rows
sTrain <- read.table("./smartdata/UCI HAR Dataset/train/subject_train.txt")
nrow(sTrain)
xTrain <- read.table("./smartdata/UCI HAR Dataset/train/X_train.txt")
nrow(xTrain)
yTrain <- read.table("./smartdata/UCI HAR Dataset/train/Y_train.txt")
nrow(yTrain)

names(sTrain)[1] <- "subject"
names(xTrain) <- xNames
names(yTrain)[1] <- "activity.type"

## bind all train data together 
trainAll <- cbind(sTrain, xTrain, yTrain)

## combine the test data and train data together
allData<- rbind(testAll, trainAll)

##********************************************************
## Changing activity types from numeric to descriptive 
##*******************************************************
for(i in 1:10299){
if(allData$activity.type[i] == 1) 
{ allData$activity.type[i] ="WALKING"}
if(allData$activity.type[i] == 2) 
{ allData$activity.type[i] ="WALKING_UPSTAIRS"}
if(allData$activity.type[i] == 3) 
{ allData$activity.type[i] ="WALKING_DOWNSTAIRS"}
if(allData$activity.type[i] == 4) 
{ allData$activity.type[i] ="SITTING"}
if(allData$activity.type[i] == 5) 
{ allData$activity.type[i] ="STANDING"}
if(allData$activity.type[i] == 6) 
{ allData$activity.type[i] ="LAYING"}
 print(i)
}
##**************************************
## Manipulate variable names
##***************************************
## STEP1 : replace all () with nothing
n1<-gsub("\\()","",names(allData),)
## STEP2 : replace all "-" with a "." to standardize as per R conventions 
n2<- gsub("\\-",".",n1,)
## eliminating repeated ".."
n3<- sub("\\.\\.",".",n2,)
## replace "(" with "."
n4<- gsub("\\(",".",n3,)
##  replace ")" with "."
n5 <- gsub("\\)",".",n4,)
##  replace "," with "."
n6 <- gsub("\\,",".",n5,)
## replace ending "."
n7 <- sub("\\.$","",n6,)
## Assigning the cleaned up name variables back to the combined data set
names(allData) <-n7
##****************************************************************************************
## Extracts the measurements on the mean and standard deviation for each measurement. 
## Also extracts subject and activity type variables
##****************************************************************************************

## finding and assigning the index of the mean and standard deviation variables, also the subject and  activity type
p1<-grep("subject|\\.mean\\.|\\.mean$|std|activity.type",names(allData))

## creating the subset with only mean and standard deviation
subData <- allData[p1]


##****************************************************************************************
##Creates a second, independent tidy data set with the average of each variable for 
## each activity and each subject.
##**************************************************************************************

## Loading reshape library to access melt and dcast
library(reshape2)
actMelt <- melt(subData, id=c("subject","activity.type"),measure.vars=c(2:67))
subjectData<-dcast(actMelt,subject ~ activity.type + variable,mean)

##***************************************
## finally creates a CSV or txt. Deliberately commented so that no new files are created if run
## Uncomment if you want to generate the file based on the format you want
##************************************
##head(subjectData)
#write.csv(subjectData, file="./data/Subjectactivity.csv")
##write.table(subjectData,file = "./data/subjectactivity.txt")
### Phew the End!!                    
