# ========================================================================
# Transformation of the UCI HAR Dataset smart Phone Data
# Version 1.0
# ========================================================================

## -------------------
## Data Setup
## -------------------

> Download the data for the project from 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
>
> 1. Extract the zip file to the R working directory
> 2. Retain the same file structure as in the zip file


## ----------------------------------------------------
## Reading of all testing data and merging
## ----------------------------------------------------
>
> 1. Read the Subject_test file from the test dataset
> 2. Calculate the no of rows -Subject has 2947 rows in the test folder
> 3. Read the X_test file from the test dataset
> 4. Calculate the no of rows (X has 2947 rows in the test folder)
> 5. Calculate the no of cols (X has 561 cols in the test folder)
> 6. Read the Y_test file from the test dataset
> 7. Calculate the no of rows (X has 2947 rows in the test folder)
> 8. Read the header name for X file ./smartdata/UCI HAR Dataset/features.txt"
> 9. Use the labels from features.txt to label the elements of X_test
> 10. Label subject data element as "subject" and y data element as"activity.type"
> 11. Cobine all the test data sets together 
> 12. Repeat the same for train datasets (7352 rows) in ./smartdata/UCI HAR Dataset/train/"      >     folder
> 13. Combine the rows of test and train data set

## -------------------------------------------------------------------
## Changing activity types from numeric to descriptive 
## -------------------------------------------------------------------
> 1. read activity_labels.txt in the UCI HAR Dataset folder
> 2. use the labels from activity_labels.txt to remain the numeric values of "activity"
>

## --------------------------------------
## Clean up the  variable names
## --------------------------------------

> 1. replace all () with nothing
> 2. replace all "-" with a "." to standardize as per R conventions 
> 3. eliminating double "." (..)
> 4. replace "(" with "."
> 5. replace ")" with "."
> 6. replace "," with "."
> 7. replace ending "."
> 8. assign the cleaned up name variables back to the combined data set
>

## -------------------------------------------------------------------------
## Extracts the measurements of mean and standard deviation only
## -------------------------------------------------------------------------
* Search of variable names 
1. Containing exactly ".mean." 
2. Ending with  ".mean"
3. Matching "std" 
4. Also include subject and activities types
5. Create a subset containing these variables only

## -------------------------------------------------
## Creating the second tidy data set
## -------------------------------------------------

> * Load reshape library to access melt and dcast functions
> * set subject and activity tupe as id and others varibales as measures
> * create a data set with rows as the 30 subjects and measures with category as headers

## ---------------------------------------------------------------
##  Creates the output file.
## ---------------------------------------------------------------

> * writes files in csv and txt. 
> * only the code of csv is uncomment
> * uncomment the code fo text if you would like to create a txt output
>

## ---------------------------------------------------------------
##  End Notes
## ---------------------------------------------------------------

> _The variables used and the variable names of the tidy set is explained in codebook.md_
>
> __The End__

