# Model Estimation using Boosting and Gradient Boosting with XGBoost

## Project Overview
This project implements Boosting and Gradient Boosting techniques using XGBoost to estimate classification models. The analysis is applied to a dataset containing financial and psychological attributes of individuals, aiming to predict employment status. The project is implemented in RMarkdown and follows a structured approach including data preprocessing, partitioning, model training, and evaluation.

## Contents

### 1. **Dataset (score_test.xlsx)**
   - Source file: `score_test.xlsx`
   - Contains information on financial and psychological factors.
   - Main variables:
     - **id**: Unique identifier (removed in preprocessing).
     - **Empleado**: Employment status (target variable, 1 = employed, 0 = not employed).
     - **Tiempo_empleo**: Years of employment.
     - **Saldo_cuenta**: Bank account balance.
     - **Valor_prestamo**: Loan amount.
     - **Cuentas_otros**: Number of other accounts.
     - **Autocontrol**, **Impulsividad**, **Confianza**: Psychological attributes.

### 2. **RMarkdown Report (Boosting_Project.Rmd)**
   - Implements Boosting and Gradient Boosting for probabilistic classification models.
   - Performs:
     - Data loading and preprocessing (removing ID, converting factors).
     - Train-test split (75% training, 25% test).
     - Model training using `caret::train()`.
     - Validation using 10-fold cross-validation.
   - Output formats: HTML and PDF.

## Required Libraries
To run the project, install the following R packages:

```r
install.packages("tidyverse")
install.packages("tinytex")
install.packages("catdata")
install.packages("caret")
install.packages("adabag")
install.packages("xgboost")
install.packages("readxl")
```

## Usage
1. Open `Boosting_Project.Rmd` in RStudio.
2. Ensure that `score_test.xlsx` is in the working directory.
3. Run the RMarkdown file to generate analysis results.

## Author
**Raúl Varela Ferrando**

