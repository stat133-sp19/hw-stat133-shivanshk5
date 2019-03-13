---
title: "Data Dictionary"
author: Shivansh Kumar
date: 13 March 2019
output: github_document
---

1. Title of Data Files:
    + andre-iguodala.csv
    + draymond-green.csv
    + kevin-durant.csv
    + klay-thompson.csv
    + stephen-curry.csv

2. Sources:
    + andre-iguodala.csv: <https://github.com/ucb-stat133/stat133-hws/blob/master/data/andre-iguodala.csv>
    + draymond-green.csv: <https://github.com/ucb-stat133/stat133-hws/blob/master/data/draymond-green.csv>
    + kevin-durant.csv: <https://github.com/ucb-stat133/stat133-hws/blob/master/data/kevin-durant.csv>
    + klay-thompson.csv: <https://github.com/ucb-stat133/stat133-hws/blob/master/data/klay-thompson.csv>
    + stephen-curry.csv: <https://github.com/ucb-stat133/stat133-hws/blob/master/data/stephen-curry.csv>

3. Number of Instances (Each instance/row corresponds to one shot taken):
    + andre-iguodala.csv: 371
    + draymond-green.csv: 578
    + kevin-durant.csv: 915
    + klay-thompson.csv: 1220
    + stephen-curry.csv: 1250

4. Number of Attributes per Data File: 13

5. Attribute Information:
Given is the exact variable name as in the data file, a version of the variable name that might be used in data visualizations, the data type of the attribute, and a longer description of the variable.

| Name              | Plot_Name           | Data Type   | Description                                             |
| ----------------- | ------------------- | ----------- | ------------------------------------------------------- |
| team_name         | Team                | Character   | Only value is "Golden State Warriors"                   |
| game_date         | Date of Game        | Character   | Date in form of mm/dd/yy (one digit if m or d < 10)     |
| season            | Season              | Character   | Only dealing with 2016 season                           |
| period            | Period              | Integer     | Period number from 1-4 (1st period is first 12 minutes) |
| minutes_remaining | Minutes Remaining   | Integer     | Minutes remaining in period (Less than 12)              |
| seconds_remaning  | Seconds Remaning    | Integer     | Seconds remaining in period (Less than 60)              |
| shot_made_flag    | Shot Made           | Character   | Either "y" for made shot or "n" for missed shot         |
| action_type       | Type of Shot        | Character   | The type of shot taken (Ex: Dunk Shot, Jump Shot, etc.) |
| shot_type         | Point Value of Shot | Character   | Either "2PT Field Goal" or "3PT Field Goal"             |
| shot_distance     | Distance of Shot    | Integer     | Distance from basket (in feet)                          |
| opponent          | Opponent Team       | Character   | Opponent Team Name                                      |
| x                 | Court Width         | Integer     | Dimension of Court Width (in feet) and max is 50'       |
| y                 | Court Height        | Integer     | Dimension of Court Height (in feet) and max is 94'      |

6. Missing Attribute Values: None