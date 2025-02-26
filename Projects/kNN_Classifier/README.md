# README - KNN Regression Project
## Overview
This directory contains files related to a project on KNN Regression conducted by Raúl Varela Ferrando. The work explores a regression model using the K-Nearest Neighbors (KNN) algorithm and includes data preparation, model fitting, and error analysis. The project uses the dataset khantrainadd2.csv and provides a comparative study between two KNN regression models: Weighted KNN and Random KNN. Below is an explanation of each file in the directory.

## Files in the Directory
### 1. kNN_Class_Project.R:
   This is the R script that contains the code for the regression analysis. It includes steps for data loading, preprocessing, model training, and evaluation.

### 2. kNN_Class_Project.Rmd:
   This R Markdown file contains both the code and detailed comments explaining the steps of the project. It combines R code chunks with narrative text to describe the methodology and results of the analysis.

### 3. khantrainadd2.csv:
   This CSV file contains the dataset used for the analysis. It includes various features that are used to predict the target variable using the KNN regression models.

## Project Workflow

### 1. Data Preprocessing:
The dataset khantrainadd2.csv is loaded and standardized. Several transformations are applied to the data, including the removal of specific variables based on predefined criteria, scaling of numeric and binary variables, and the creation of dummy variables for nominal features.

### 2. Weighted KNN Regression:
The first model used is a Weighted KNN regression model with Euclidean distance. Key steps:

- Selection of the best kernel and optimal k using cross-validation.
- Calculation of the Mean Squared Error (MSE) of the model.
- The kernel function "inv" and k=4 are found to give the best results.
  
### 3. Random KNN Regression:
The second model is a Random KNN regression using cross-validation. Key steps:

- Estimation of predictor importance.
- Selection of the most relevant attributes using a geometric and linear step-wise approach.
- Calculation of the MSE after selecting the optimal attributes.

### 4. Comparison of Models:
A comparative study of both models is performed based on their MSE. The Weighted KNN model yields a lower MSE (130.86) compared to the Random KNN model, which gives MSE values of 209.84 and 157.17 before and after feature selection, respectively.

### **Requeriments**
To run the R script and R Markdown file, make sure to install the necessary packages:

```
install.packages(c("kknn", "caret", "rknn", "ggplot2"))
```

### How to Reproduce the Analysis

1. Load the data by reading the khantrainadd2.csv file.
2. Follow the steps in the Sknn_Varela_Ferrando.rmd file to process the data and fit the models.
3. The analysis results can be viewed in the Sknn_Varela_Ferrando.pdf file, which includes formatted tables and figures.

**Feel free to contact me for further questions or clarifications regarding the project.**







