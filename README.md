GetCleanDataAssignment
======================

This repository contains the scipt and final output files of the programming assignment for Coursera's Getting and Cleaning Data assignment - the 3rd course in the Data Science specialization.

The data used for this assingment comes from the UCI Machine Learnings Repository and a study of how people move as measured by their smartphones. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script run_analysis.R takes as input the test and train readings available from the dataset linked above, combines them into one larger table, removes the measures that are not calculating mean (including mean frequency) and standard deviation, and then collects the average results of each measure by user and by activity in a tidy data set.
