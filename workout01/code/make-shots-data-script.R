# Title: Data Preparation
# Author: Shivansh Kumar
# Date: 13 March 2019
# Inputs: Data files in ../data folder
          # ../data/andre-iguodala.csv
          # ../data/draymond-green.csv
          # ../data/kevin-durant.csv
          # ../data/klay-thompson.csv
          # ../data/stephen-curry.csv
# Outputs:  # shots-data.csv: Combining all input data frames into new csv file
            # shots-data-summary.txt: Summary of shots-data data frame
            # Summary of all the data frames from data files
                # andre-iguodala-summary.txt
                # draymond-green-summary.txt
                # kevin-durant-summary.txt
                # klay-thompson-summary.txt
                # stephen-curry-summary.txt
            
# Reading in 5 datasets using relative data paths
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

# Adding column name to reach imported data for each player

# Changing original values of shot_made_flag to more descriptive values

# Add a column minute that contains the minute number where a shot occurred

# Using sink() to send the summary() output of each imported data frame into individual text files

# Using rbind() to stack the tables into one single data frame 

# Exporting table into CSV file shots-data.csv
# Use row.names = FALSE when using write.csv

# Using sink() to send the summary() output of the assembled table
