Workout 01
================
Shivansh Kumar
13 March 2019

Warriors Championship Run as a Jump Shooting Team: Individual Player Analysis
=============================================================================

![](../images/warriors_all_stars.jpg)

### Introduction

After coming from one of the biggest heartbreaks and disappointing final results in NBA history after a record-breaking regular season, the Warriors front office amazingly were able to sign one of the best basketball players on the planet. Kevin Durant would join the tandem of Steph Curry, Draymond Green, Klay Thompson, and Andre Iguodala to form arguably one of the best teams in NBA history. However, the infamous Charles Barkley still had his doubts about the Warrior's goal towards a championship. He claimed, "A jump-shooting team would never win the championship." However, with statistical evidence on their side (with obviously hours of jump shot practice), the team proves the ESPN analyst wrong. This article also discusses the importance of Andre Iguodala and justifies his previous Finals MVP accomplishment. This article also articulates the efficiency field goal percentages of all the 5 players in comparison to each other.

### Data

Here are a few tables that show the effective percentage for the different FG attempts for each player.

#### 2 Pointer Effective Shooting Percentage

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Andre Iguodala |    210|   134|       63.81|
| Kevin Durant   |    643|   390|       60.65|
| Stephen Curry  |    563|   304|       54.00|
| Klay Thompson  |    640|   329|       51.41|
| Draymond Green |    346|   171|       49.42|

#### 3 Pointer Effective Shooting Percentage

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Klay Thompson  |    580|   246|       42.41|
| Stephen Curry  |    687|   280|       40.76|
| Kevin Durant   |    272|   105|       38.60|
| Andre Iguodala |    161|    58|       36.02|
| Draymond Green |    232|    74|       31.90|

#### Field Goal Effective Shooting Percentage

| name           |  total|  made|  perc\_made|
|:---------------|------:|-----:|-----------:|
| Kevin Durant   |    915|   495|       54.10|
| Andre Iguodala |    371|   192|       51.75|
| Klay Thompson  |   1220|   575|       47.13|
| Stephen Curry  |   1250|   584|       46.72|
| Draymond Green |    578|   245|       42.39|

We can also see how the players individually shoot with a visual depiction of the shots made and missed by these 5 players with distance as a factor as well.

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

### Team Analysis

This facetted shot chart allows us to visually analyze the shot charts for each individual player all at the same time. First off, we can see that the range for Stephen Curry is much larger than the other players. We can see many shots that are taken several feet beyond the three point line and he made a significant amount of these long 3 point shots. However, he does have some very long shots that can be considered outliers in the data set. There are around 6 outliers for Stephen Curry and he missed all of them. Most of these shots probably however come at end of quarters so there is no harm with taking these shots. Also, from this chart, we can see that Andre Iguodala's plot is very less dense compared to the others while Stephen Curry's and Klay Thompson's are very dense, showing that Iguodala takes a significant amount of fewer shots compared to Steph and Klay. This makes sense since Iguodala comes off the bench and plays much fewer minutes compared to the other players. Draymond Green also has very few shots, indicating why he is more of a pass first type of player.

Furthermore, a common pattern that we can see in this plot is that in all the charts for the 5 players, there are definitely more points around the 3 point line and in the paint. There are fewer points in the middle, signifying that the Warrior player do not take that many mid-range shots, especially for Andre Iguodala and Draymond Green. Klay Thompson, Kevin Durant, and Stephen Curry have more points in the mid-range area but their plots are clearly more dense in the paint and the 3 point area, showing the diverse game for these three players. However, with a lot of shots taken in the paint, this calls to question whether the Golden State Warriors are actually a jump shooting team. Based on these plots, the Warriors do shot a lot of three pointers but they do not only live and die by the three. Some interesting things to notice about Kevin Durant's plot is also that he is very consistent on the right wing (left side of the chart) and made most of his shots that he took from that area.

Also, the Golden State Warriors had the highest efficient field goal percentage for that season at 50.4 percent. Based on this facetted shot chart, we can go into details on individual stats compared to each other.

#### Stephen Curry

<img src="../images/steph.jpg" width="300px" />

Based on the data tables, one of the interesting things we can see about Stephen Curry is that he is the only player out of the 5 to have more attempted 3 pointers compared to 2 pointer even though he shoots 2 pointers at a field goal percentage of 14 percent higher compared to 3 pointer field goal percentage. He shot 687 threes at a 40 percent success rate and shot 563 two pointers at a 54 percent success rate. Even though he might make more two pointers, his ability to shoot from the three gives an extreme advantage to the Golden State Warriors. Obviously, 3 is more than 2. By being able to shoot over 40 percent from the 3 point line with a significant amount of attempted threes, Curry demonstrates why he is a one of a kind player that helped the Warriors get back on championship runs. Here we have a code snippet of the total points Curry adds to the team considering he shoots 500 FG attempts for 2 pointers and 3 pointers with the same field goal percentage (54 percent from 2 and 41 percent from 3).

``` r
# 500 Curry two pointers results in these many points:
500 * .54 * 2  # 540 points

# 500 Curry three pointers results in these many points:
500 * .41 * 3  # 615 points

two_point_x * 0.54 * 2 = three_point_x * .41 * 3
# Ratio of two_point_x to three_point_x is 1.14
```

Since Curry gets more total points with 3 pointers at those field goal percentage rates, it makes sense for Curry to shoot more 3 pointers. Based on these calculations, Curry will get the same effect in terms of total points if he shoots around 1.14 times the number of 2 point shots compared to 3 point shots.

#### Klay Thompson

<img src="../images/klay.jpg" width="300px" />

Moreover, based on the data tables, we can see that Klay Thompson is the most efficient 3 point shooter between these 5 players on the Golden State Warriors. He shoots over 42 percent from the 3 point line but attempted less than 130 shots compared to Stephen Curry. Also, interestingly, Klay Thompson has the smallest difference among the five players between his 3 point efficiency percentage and his 2 pt efficiency percentage. Since this difference is pretty small, it makes sense statistically for Klay Thompson to shoot more 3 pointers compared to 2 pointers. However, based on Klay Thompson's game, he is more of a catch and shoot type of player so he essentially takes all his open 3 pointers and drives to the basket when he is guarded. Because of this game style with a lot of hard work and practice, he is able to have a high shooting percentage outside and inside the 3 point line.

#### Draymond Green

<img src="../images/draymond.jpg" width="300px" />

With the offensive stats in the data tables, it is pretty safe to say that Draymond Green is the worst shooter out of the 5 players. He has the lowest percentage made for 2 pointers and 3 pointers and has a total field goal percentage of 42.39 percent, which is not that great for an All-Star. However, with Draymond being an All-Star, these data tables show that Draymond's impact on the team comes more than just the offensive numbers. Draymond is one of the best defensive players on the team and his intensity and ferocity always keeps the team on their feet. Without a leader like Draymond, the Warriors might lose some of their passion on the field but this may help the offensive numbers for the team.

#### Kevin Durant

<img src="../images/kd.jpg" width="300px" />

Kevin Durant is the only player on the Warriors to shoot less than half the amount of 3 pointers compared to two pointers. However, he is still able to very efficient from the field from both inside and outside the 3 point line. Out of the 5 players, he has the second highest field goal percentage for 2 pointers and took the most amount and has the third highest field goal percentage for 3 pointers. Even though Kevin Durant does not take as many shots compared to the Splash Brothers since he is slowly adjusting to the team, he is still able to produce very efficient numbers. Being able to transition from one team to another with still super efficient shooting percentages shows that Kevin Durant is one of the best players in the NBA. Solely creating this claim from these statistical numbers, once Kevin Durant starts shooting the ball more and Draymond Green starts shooting the ball less, the Warriors will be an even more dominant dynasty.

#### Andre Iguodala

<img src="../images/iggy.jpeg" width="300px" />

Last but not least, based on the data tables, we can see the importance of Andre Iguodala on the Warriors. Even though he is definitely getting older past his prime, his efficiency rating has not went down. In a team full of superstars, Andre Iguodala still has the highest shooting percentage for 2 point FG attempts at 63.81 percent and the second-highest total FG percentage at 51.75 percent. However, he does not take that many shots compared to the other players on the team and does not get the recognition that he deserves. But in the 2015 finals, Andre Iguodala shot 52 percent from the field and 40 percent from the 3 point line with only 5 less 3 pointers compared to Klay Thompson and 12 more FG attempts than Draymond Green. Therefore, Andre Iguodala was able to produce the same efficiency percentages with higher totals and was bale to benefit the team significantly, justifying why he won the Finals MVP in 2015.

### Conclusion

In conclusion, the Warriors as players individually excel in efficiency ratings for 3 pointers (maybe other than Draymond Green) and but they definitely as a whole excel as a team. With this type of efficiency, the Warriors have a very high offensive rating and scored the most points per game in the 2016-2017 NBA season with an average of 115.9 points per game. Coming in close second are the Houston Rockets who score around 115.3 points per game, who modeled their game on the Warriors also as a jump shooting team. Therefore, it is not any surprise that the Golden State Warriors have the highest efficiency field goal percentage as a team with those individual players with high field goal efficiency statistics. With underrated players like Andre Iguodala that are able to increase their total numbers while keeping the same efficiency rating, the Golden State Warriors have to be one of the most dangerous basketball teams ever seen. While the plot shows that the players on the Warriors do not only live and die by the 3, there could be some debate on whether Golden State Warriors are truly a jump-shooting team. However, with the statistical analysis given in the article, we know for a fact that the Golden State Warriors are favorites to win the 2016-2017 NBA Championship and that most of Charles Barkley's comments come without any base of supporting numbers.
