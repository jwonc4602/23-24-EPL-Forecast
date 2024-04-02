#### Preamble ####
# Purpose: Simulates the datasets and their variables
# Author: Jiwon Choi
# Date: 1 April 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tibble)
library(ggplot2)
library(dplyr)

### simulation 1) ranking for a team over several seasons ###
set.seed(123) # Setting seed for reproducibility

# Create a function to simulate ranking data for a team over several seasons
simulate_ranking_data <- function(team_name) {
  seasons <- c('17/18', '18/19', '19/20', '20/21', '21/22', '22/23')
  rankings <- round(runif(6, min=1, max=20)) # Assuming rank is between 1 and 20
  
  tibble(
    season = seasons,
    rank = rankings,
    team = team_name
  )
}

# Simulate data for three teams
simulated_data_liverpool <- simulate_ranking_data("Liverpool")
simulated_data_mancity <- simulate_ranking_data("Manchester City")
simulated_data_arsenal <- simulate_ranking_data("Arsenal")

# Combine all data into one dataframe
combined_data <- bind_rows(simulated_data_liverpool, simulated_data_mancity, simulated_data_arsenal)

# Create a line plot with custom styles using ggplot
plot_teams_ranking <- ggplot(combined_data, aes(x = season, y = rank, group = team, color = team)) +
  geom_line() + # Draw lines
  geom_point() + # Add points
  scale_y_reverse(breaks = 1:20) + # Reverse the scale as lower rank is better in sports
  labs(title = "Ranking over Previous Seasons",
       x = "Season", y = "Rank") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), # Center the plot title
        axis.text.x = element_text(angle = 45, hjust = 1))

# Display the plot
print(plot_teams_ranking)


### simulation 2) W/D/L data for a team over several seasons ###
set.seed(123) # Setting seed for reproducibility

# Create a function to simulate W/D/L data for a team over several seasons
simulate_wdl_data <- function(team_name) {
  seasons <- c('17/18', '18/19', '19/20', '20/21', '21/22', '22/23')
  # Simulate the rate of Wins, Draws, and Losses
  data <- tibble(
    season = rep(seasons, times = 3),
    rate = c(runif(6, min=0, max=1), runif(6, min=0, max=1), runif(6, min=0, max=1)),
    result = rep(c('Win', 'Draw', 'Lose'), each = 6),
    team = team_name
  )
  # Normalize the rates so they sum to 1 for each season
  data <- data %>% 
    group_by(season) %>% 
    mutate(rate = rate / sum(rate)) %>%
    ungroup()
  
  return(data)
}

# Simulate data for three teams
simulated_data_liverpool_wdl <- simulate_wdl_data("Liverpool")
simulated_data_mancity_wdl <- simulate_wdl_data("Manchester City")
simulated_data_arsenal_wdl <- simulate_wdl_data("Arsenal")

# Combine all data into one dataframe
combined_data_wdl <- bind_rows(simulated_data_liverpool_wdl, simulated_data_mancity_wdl, simulated_data_arsenal_wdl)

# Create a grouped bar plot with custom styles using ggplot
plot_teams_wdl <- ggplot(combined_data_wdl, aes(x = season, y = rate, fill = result)) +
  geom_bar(stat = "identity", position = position_dodge(), width = 0.7) + # Create grouped bars
  scale_fill_manual(values = c("Win" = "blue", "Draw" = "yellow", "Lose" = "red")) +
  facet_wrap(~team, scales = "free_y") + # Create separate plots for each team
  labs(title = "W/D/L Rate Over Season",
       x = "Season", y = "Rate") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), # Center the plot title
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom") +
  guides(fill=guide_legend(title="Result"))

# Display the plot
print(plot_teams_wdl)


