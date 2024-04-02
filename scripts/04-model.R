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
model_pts <- stan_glm(Pts ~ Poss + xG + PrgP + PrgC  + Pts.MP, data = data, 
                  family = gaussian(), # Assuming a Gaussian distribution of the outcome
                  prior = normal(0, 2.5), # Setting a normal prior with mean 0 and sd 2.5 for the coefficients
                  prior_intercept = normal(0, 10), # A wider prior for the intercept
                  chains = 4, iter = 2000) # Number of chains and iterations for the MCMC

model_win <- stan_glm(W ~ Poss + xG + PrgP + PrgC  + Pts.MP, data = data, 
                      family = gaussian(), # Assuming a Gaussian distribution of the outcome
                      prior = normal(0, 2.5), # Setting a normal prior with mean 0 and sd 2.5 for the coefficients
                      prior_intercept = normal(0, 10), # A wider prior for the intercept
                      chains = 4, iter = 2000) # Number of chains and iterations for the MCMC


# Load the dataset to be applied the model above
current_season_data <- read_csv("data/analysis_data/cleaned_data_23_24.csv")

# Predict the 'Pts' using the model
predicted_pts <- predict(model_pts, newdata = current_season_data, type = "response")

# Adding predicted points to the test data
current_season_data$PredictedPts <- predicted_pts

# Order the teams by the predicted points to find the potential winner
ordered_teams_pts <- current_season_data[order(-current_season_data$PredictedPts), ]


# Predict the 'W' using the model
predicted_win <- predict(model_win, newdata = current_season_data, type = "response")

# Adding predicted points to the test data
current_season_data$Predictedwin <- predicted_win

# Order the teams by the predicted points to find the potential winner
ordered_teams_win <- current_season_data[order(-current_season_data$Predictedwin), ]

#### Save model ####
saveRDS(
  model_pts,
  file = "models/model_pts.rds"
)

saveRDS(
  model_win,
  file = "models/model_win.rds"
)

saveRDS(
  ordered_teams_pts,
  file = "models/prediction_pts.rds"
)

saveRDS(
  ordered_teams_win,
  file = "models/prediction_win.rds"
)
