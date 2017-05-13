# getting-cleaning-data-project
Data Science Coursera Getting and Cleaning Data Project

dataset used: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

run_analysis.R will do the following on the UCI HAR Dataset:

  1. Read and load the data tables for activity and feature.
  2. Load only the STD and Mean columns for the training and test data
  3. Load the subject and activity for each dataset and merges those columns
  4. Merges the two datasets
  5. Converts subject and activity into factors
  6. Creates a tidy dataset of the Mean of each pair of subject and activity
  
