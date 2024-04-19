#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Jiwon Choi
# Date: 1 April 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(dplyr)

# Step 1: Load the dataset without using the first row as headers
squad_data_23_24 <- read.csv("data/raw_data/squad_data_23_24.csv")
squad_data_22_23 <- read.csv("data/raw_data/squad_data_22_23.csv")
squad_data_21_22 <- read.csv("data/raw_data/squad_data_21_22.csv")
squad_data_20_21 <- read.csv("data/raw_data/squad_data_20_21.csv")
squad_data_19_20 <- read.csv("data/raw_data/squad_data_19_20.csv")
squad_data_18_19 <- read.csv("data/raw_data/squad_data_18_19.csv")
squad_data_17_18 <- read.csv("data/raw_data/squad_data_17_18.csv")


# Step 2: Set the first row as column names
colnames(squad_data_23_24) <- as.character(squad_data_23_24[1, ])
colnames(squad_data_22_23) <- as.character(squad_data_22_23[1, ])
colnames(squad_data_21_22) <- as.character(squad_data_21_22[1, ])
colnames(squad_data_20_21) <- as.character(squad_data_20_21[1, ])
colnames(squad_data_19_20) <- as.character(squad_data_19_20[1, ])
colnames(squad_data_18_19) <- as.character(squad_data_18_19[1, ])
colnames(squad_data_17_18) <- as.character(squad_data_17_18[1, ])


# Step 3: Remove the first row
squad_data_23_24 <- squad_data_23_24[-1, ]
squad_data_22_23 <- squad_data_22_23[-1, ]
squad_data_21_22 <- squad_data_21_22[-1, ]
squad_data_20_21 <- squad_data_20_21[-1, ]
squad_data_19_20 <- squad_data_19_20[-1, ]
squad_data_18_19 <- squad_data_18_19[-1, ]
squad_data_17_18 <- squad_data_17_18[-1, ]


# Now, to filter out only the specific columns you mentioned earlier
filtered_data_23_24 <- squad_data_23_24 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')

filtered_data_22_23 <- squad_data_22_23 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_22_23$season <- "22/23"

filtered_data_21_22 <- squad_data_21_22 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_21_22$season <- "21/22"

filtered_data_20_21 <- squad_data_20_21 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_20_21$season <- "20/21"

filtered_data_19_20 <- squad_data_19_20 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_19_20$season <- "19/20"

filtered_data_18_19 <- squad_data_18_19 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_18_19$season <- "18/19"

filtered_data_17_18 <- squad_data_17_18 %>% 
  select('Squad', 'Poss', 'Gls', 'xG', 'PrgC', 'PrgP')
filtered_data_17_18$season <- "17/18"

# For adding variables ('rk', 'W', 'D', 'L', 'Pts', 'Pts/MP') from regular_data
# Assuming regular_data is prepared similarly and includes a 'Squad' column for matching

# Step 1: Ensure 'Squad' is a column in both datasets, not row names or missing
# (This step might need adjustments based on how you've prepared regular_data)
regular_data_23_24 <- read.csv("data/raw_data/regular_data_23_24.csv")
regular_data_22_23 <- read.csv("data/raw_data/regular_data_22_23.csv")
regular_data_21_22 <- read.csv("data/raw_data/regular_data_21_22.csv")
regular_data_20_21 <- read.csv("data/raw_data/regular_data_20_21.csv")
regular_data_19_20 <- read.csv("data/raw_data/regular_data_19_20.csv")
regular_data_18_19 <- read.csv("data/raw_data/regular_data_18_19.csv")
regular_data_17_18 <- read.csv("data/raw_data/regular_data_17_18.csv")

# Step 2: Merge datasets
# This requires a common identifier, assuming here it's 'Squad' for illustration
# Ensure both datasets have a 'Squad' column, and then perform the merge
final_data_23_24 <- merge(regular_data_23_24[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_23_24, by = 'Squad')
final_data_22_23 <- merge(regular_data_22_23[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_22_23, by = 'Squad')
final_data_21_22 <- merge(regular_data_21_22[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_21_22, by = 'Squad')
final_data_20_21 <- merge(regular_data_20_21[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_20_21, by = 'Squad')
final_data_19_20 <- merge(regular_data_19_20[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_19_20, by = 'Squad')
final_data_18_19 <- merge(regular_data_18_19[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_18_19, by = 'Squad')
final_data_17_18 <- merge(regular_data_17_18[, c('Squad', 'Rk', 'W', 'D', 'L', 'Pts', 'Pts.MP')], filtered_data_17_18, by = 'Squad')

combined_data <- bind_rows(final_data_22_23, final_data_21_22, final_data_20_21, final_data_19_20, final_data_18_19, final_data_17_18)


# save the data as parquet
write_csv(final_data_23_24, "data/analysis_data/cleaned_data_23_24.csv")
write_csv(combined_data, "data/analysis_data/cleaned_data_17_23.csv")

