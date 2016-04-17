---
title: "README"
author: "Balistes"
date: "17 апреля 2016 г."
output: html_document
---
# Getting and Cleaning Data Project

### Project summary

This is the repo for the week 4 course project for Getting and Cleaning Data Course.

The purpose of this project is to demonstrate how to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

Link to the requirements for the project and data for download:
<https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project>.

This repo contains the following files:

- **run_analysis.R**  - R script used to load and merge raw data sets, preparation a set of tidy data.

- **CodeBook.md** - file with describes the variables, data, and any transformations or work that was performed to clean up the data.

- **second_set.txt** - file with tidy data set, whitch is the result of the script run_analysis.R
- **README.md** - file with Project and R script summary.

### R script summary

R script **run_analysis.R** does the following:

1. Step 0 Load needed packages and execute work steps.

2. Step 1 Merges the training and the test sets to create one data set.

3. Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.

4. Step 3 Uses descriptive activity names to name the activities in the data set.

5. Step 4 Appropriately labels the data set with descriptive variable names.

6. Step 5 From the data set in step 4, creates a second, independent tidy data set.

For get the result, execute script run_analysis.R in RStudio or R for Mac OS X.

All data sets will be stored in a subdirectory "./data"" of the working directory.
