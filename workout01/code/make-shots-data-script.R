# Title: Data Preparation
# Author: Shivansh Kumar
# Date: 13 March 2019
# Description: Code reads in all the input data frames and adds certain columns like name and minutes to create a new data frame called shots_data. This file also exports the summaries of all the data frames.
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
iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

# Changing original values of shot_made_flag to more descriptive values
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"

green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"

curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"

# Add a column minute that contains the minute number where a shot occurred
iguodala$minute <- 12 * iguodala$period - iguodala$minutes_remaining
green$minute <- 12 * green$period - green$minutes_remaining
durant$minute <- 12 * durant$period - durant$minutes_remaining
thompson$minute <- 12 * thompson$period - thompson$minutes_remaining
curry$minute <- 12 * curry$period - curry$minutes_remaining

# Using sink() to send the summary() output of each imported data frame into individual text files
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

# Using rbind() to stack the tables into one single data frame 
shots_data <- rbind(iguodala, green, durant, thompson, curry)

# Exporting table into CSV file shots-data.csv
write.csv(shots_data, file = "../data/shots-data.csv", row.names = FALSE)

# Using sink() to send the summary() output of the assembled table
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()
