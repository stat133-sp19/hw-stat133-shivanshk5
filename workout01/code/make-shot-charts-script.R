# Title: Data Preparation
# Author: Shivansh Kumar
# Date: 13 March 2019
# Description: Code reads in all the input data frames and makes shot charts for each player and a facetted shot chart.
# Inputs: # Background image of a court: ../images/nba-court.jpg
        # Data files in ../data folder
            # ../data/andre-iguodala.csv
            # ../data/draymond-green.csv
            # ../data/kevin-durant.csv
            # ../data/klay-thompson.csv
            # ../data/stephen-curry.csv
      
# Outputs:  # gsw-shot-charts.png: One facetted shot chart for the players
            # Shot chart of each player:
                # andre-iguodala-shot-chart.pdf
                # draymond-green-shot-chart.pdf
                # kevin-durant-shot-chart.pdf
                # klay-thompson-shot-chart.pdf
                # stephen-curry-shot-chart.pdf

# Loading libraries
library("jpeg")
library("grid")
library("ggplot2")

# Reading in shots-data dataset
shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

# Shot charts for each player
# court image (to be used as background of plot)
court_file <- "../images/nba-court.jpg"

# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot charts with court background
iguodala_shot_chart <- ggplot(data = shots_data[shots_data$name == "Andre Iguodala", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

draymond_shot_chart <- ggplot(data = shots_data[shots_data$name == "Draymond Green", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

durant_shot_chart <- ggplot(data = shots_data[shots_data$name == "Kevin Durant", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant Thompson (2016 season)') +
  theme_minimal()

klay_shot_chart <- ggplot(data = shots_data[shots_data$name == "Klay Thompson", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

steph_shot_chart <- ggplot(data = shots_data[shots_data$name == "Stephen Curry", ]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

# Saving shot charts for each player in images/
pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
steph_shot_chart
dev.off()

