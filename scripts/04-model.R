#### Preamble ####
# Purpose: Model EPL points and wins using Bayesian linear regression.
# Author: Jiwon Choi
# Date: 1 April 2024
# Contact: jwon.choi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
data <- read_csv("data/analysis_data/cleaned_data_17_23.csv")

# Fit a Bayesian linear regression model
# Note: No need to log-transform 'Pts' as Gamma handles positive values directly
model_pts <- stan_glm(Pts ~ Poss + Gls + xG + PrgP + PrgC, data = data, 
                      family = Gamma(link = "log"), # Using a Gamma distribution with a log link
                      prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
                      prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
                      seed = 853,
                      iter = 4000,
                      warmup = 2000)

# Load the dataset to be applied the model above
current_season_data <- read_csv("data/analysis_data/cleaned_data_23_24.csv")

# Predict the 'Pts' using the model
predicted_pts <- predict(model_pts, newdata = current_season_data, type = "response")

# Adding predicted points to the test data
current_season_data$PredictedPts <- predicted_pts

# Order the teams by the predicted points to find the potential winner
ordered_teams_pts <- current_season_data[order(-current_season_data$PredictedPts), ]


#### Save model ####
saveRDS(
  model_pts,
  file = "models/model_pts.rds"
)


saveRDS(
  ordered_teams_pts,
  file = "models/prediction_pts.rds"
)


