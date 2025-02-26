# Comparative Evaluation of Classification Models: CART, Random Forest, and Artificial Neural Networks

## Project Overview
This project evaluates the performance of three classification models: Classification and Regression Trees (CART), Random Forest, and Artificial Neural Networks (ANN). The dataset contains climbing route information, and the objective is to classify the difficulty of the routes using various predictive features. The project is implemented in RMarkdown and follows a structured approach including data preprocessing, partitioning, model training, and evaluation.

## Contents

### 1. **Dataset (CLIMBING.xlsx)**
   - Source file: `CLIMBING.xlsx`
   - Contains information on climbing routes and difficulty levels.
   - Main variables:
     - **ID**: Unique identifier (removed in preprocessing).
     - **N SEQ**: Number of holds in the route (constant, removed).
     - **GRADE**: Difficulty level of the route (target variable, 15 categories).
     - **i_X**, **i_Y**, **i_Z**: Coordinates of holds in the route.
     - **i_PRESA**: Difficulty of each hold.

### 2. **RMarkdown Report (CART_RF_ANN_Project.Rmd)**
   - Implements three classification models: CART, Random Forest, and ANN.
   - Performs:
     - Data loading and preprocessing (removal of unnecessary variables, normalization).
     - Train-test split (with seed 1234).
     - Model training and comparison.
   - Output format: PDF.

## Required Libraries
To run the project, install the following R packages:

```r
install.packages("rpart")
install.packages("readxl")
install.packages("MASS")
install.packages("foreign")
install.packages("tidyverse")
install.packages("DMwR2")
install.packages("randomForest")
install.packages("caret")
install.packages("corrplot")
install.packages("GA")
install.packages("performanceEstimation")
install.packages("ROSE")
install.packages("nnet")
```

## Usage
1. Open `CART_RF_ANN_Project.Rmd` in RStudio.
2. Ensure that `CLIMBING.xlsx` is in the working directory.
3. Run the RMarkdown file to generate analysis results.

## Author
**Raúl Varela Ferrando**