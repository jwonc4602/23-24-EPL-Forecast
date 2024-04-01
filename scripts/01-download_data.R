#### Preamble ####
# Purpose: Downloads and saves the data from https://fbref.com/en/ starting from 2017/2018 season
# Author: Jiwon Choi
# Date: 30 March 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

### Workspace setup ###
# Load necessary libraries
library(rvest)
library(dplyr)
library(readr)

### 2023 - 2024 season <Current Season> ###
# Define the URL
url <- "https://fbref.com/en/comps/9/Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season <- table[[1]]
squad_stats <- table[[3]]

# Write the data frame to a CSV file
write_csv(regular_season, "data/raw_data/regular_data_23_24.csv")
write_csv(squad_stats, "data/raw_data/squad_data_23_24.csv")


### 2022 - 2023 season ###
# Define the URL
url_22_23 <- "https://fbref.com/en/comps/9/2022-2023/2022-2023-Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url_22_23)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_22_23 <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_22_23 <- table_22_23[[1]]
squad_stats_22_23 <- table_22_23[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_22_23, "data/raw_data/regular_data_22_23.csv")
write_csv(squad_stats_22_23, "data/raw_data/squad_data_22_23.csv")


### 2021 - 2022 season ###
# Define the URL
url_21_22 <- "https://fbref.com/en/comps/9/2021-2022/2021-2022-Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url_21_22)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_21_22 <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_21_22 <- table_21_22[[1]]
squad_stats_21_22 <- table_21_22[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_21_22, "data/raw_data/regular_data_21_22.csv")
write_csv(squad_stats_21_22, "data/raw_data/squad_data_21_22.csv")

### 2020 - 2021 season ###
# Define the URL
url_20_21 <- "https://fbref.com/en/comps/9/2020-2021/2020-2021-Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url_20_21)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_20_21 <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_20_21 <- table_20_21[[1]]
squad_stats_20_21 <- table_20_21[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_20_21, "data/raw_data/regular_data_20_21.csv")
write_csv(squad_stats_20_21, "data/raw_data/squad_data_20_21.csv")

### 2019 - 2020 season ###
# Define the URL
url_19_20 <- "https://fbref.com/en/comps/9/2019-2020/2019-2020-Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url_19_20)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_19_20 <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_19_20 <- table_19_20[[1]]
squad_stats_19_20 <- table_19_20[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_19_20, "data/raw_data/regular_data_19_20.csv")
write_csv(squad_stats_19_20, "data/raw_data/squad_data_19_20.csv")


### 2018 - 2019 season ###
# Define the URL
url_18_19 <- "https://fbref.com/en/comps/9/2018-2019/2018-2019-Premier-League-Stats"

# Read the HTML content from the page
page <- read_html(url_18_19)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_18_19 <- page %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_18_19 <- table_18_19[[1]]
squad_stats_18_19 <- table_18_19[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_18_19, "data/raw_data/regular_data_18_19.csv")
write_csv(squad_stats_18_19, "data/raw_data/squad_data_18_19.csv")


### 2017 - 2018 season ###
# Define the URL for the 2017-2018 season
url_17_18 <- "https://fbref.com/en/comps/9/2017-2018/2017-2018-Premier-League-Stats"

# Read the HTML content from the page
page_17_18 <- read_html(url_17_18)

# Parse the table by its specific identifier. Adjust the identifier as needed.
table_17_18 <- page_17_18 %>%
  html_table(fill = TRUE)

# Adjust the index [[n]] as necessary based on which table you need
regular_season_17_18 <- table_17_18[[1]]
squad_stats_17_18 <- table_17_18[[3]]

# Write the data frame to a CSV file
write_csv(regular_season_17_18, "data/raw_data/regular_data_17_18.csv")
write_csv(squad_stats_17_18, "data/raw_data/squad_data_17_18.csv")

