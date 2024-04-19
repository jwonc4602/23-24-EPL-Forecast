#### Preamble ####
# Purpose: Tests the football team statistics datasets for integrity and validity
# Authors: Jiwon Choi
# Date: 1 April 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_ceaning.R

#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Load the datasets ####
data_17_23 <- read_csv("data/analysis_data/cleaned_data_17_23.csv")
data_23_24 <- read_csv("data/analysis_data/cleaned_data_23_24.csv")

#### Test for the football statistics data ####

# Check numeric values are within expected ranges (example for 'Pts', more can be added similarly)
all(data_17_23$Pts >= 0 & data_17_23$Pts <= 114) # Assuming a league with 38 games, max 3 points per win
all(data_23_24$Pts >= 0 & data_23_24$Pts <= 114)

# Check for valid 'season' format in 'data_17_23'
all(str_detect(data_17_23$season, "^[0-9]{2}/[0-9]{2}$"))

# Check for numeric columns to ensure they are of correct types
numeric_columns <- c("Rk", "W", "D", "L", "Pts", "Pts.MP", "Poss", "Gls", "xG", "PrgC", "PrgP")
all(sapply(data_17_23[numeric_columns], is.numeric))
all(sapply(data_23_24[numeric_columns], is.numeric))

#### Test result ####
# Didn't include the test for 'Squad' since there are Relegation/Promotion for every new seasons.
# Result: Should output TRUE for all tests if the data is valid and consistent