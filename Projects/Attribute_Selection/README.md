# Analysis and Evaluation of Variable Selection Techniques for Classification Models

## Project Overview
This project analyzes and evaluates various variable selection techniques for classification models in Machine Learning. The study is applied to a dataset containing financial and psychological attributes of individuals, with the goal of predicting employment status. The project is implemented in RMarkdown and follows a structured approach including data preprocessing, partitioning, model training, and evaluation.

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

### 2. **RMarkdown Report (Variable_Selection_Project.Rmd)**
   - Implements feature selection methods for probabilistic classification models.
   - Performs:
     - Data loading and preprocessing (scaling numeric variables, converting factors).
     - Train-test split (75% training, 25% test).
     - Evaluation of feature selection methods.
   - Output formats: HTML and PDF.

## Required Libraries
To run the project, install the following R packages:

```r
install.packages("tidyverse")
install.packages("tinytex")
install.packages("readxl")
install.packages("caret")
install.packages("ROCR")
install.packages("kernlab")
install.packages("FSelector")
install.packages("mlbench")
install.packages("klaR")
install.packages("catdata")
```

## Usage
1. Open `Variable_Selection_Project.Rmd` in RStudio.
2. Ensure that `score_test.xlsx` is in the working directory.
3. Run the RMarkdown file to generate analysis results.

## Author
**Raúl Varela Ferrando**

