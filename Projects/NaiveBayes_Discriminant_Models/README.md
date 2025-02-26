# Comparative Analysis of Classification Models: Evaluating Naïve Bayes and Discriminant Analysis Approaches

## Project Overview
This project performs a **Comparative Analysis of Classification Models**, focusing on **Naïve Bayes** and **Discriminant Analysis** approaches. The study uses a dataset of financial and psychological attributes to predict **employment status**. The goal is to evaluate the **performance of classification models** and compare their predictive capabilities.

---

## Data Source
The dataset used in this project, **score_test.xlsx**, contains information on various financial and behavioral factors. It has been **preprocessed in RStudio** to remove the *id* variable, which served only as an identifier.

📌 **Dataset Variables:**
- **Employee**: Target variable (1 = employed, 0 = not employed).
- **Time_employment**: Number of years employed.
- **Account_balance**: Bank account balance.
- **Loan_value**: Amount of the requested loan.
- **Other_accounts**: Number of other accounts owned.
- **Self-control, Impulsivity, Confidence**: Psychological attributes.

---

## Project Contents
- **RMarkdown Report (`Prob_Class_Project.Rmd`)**:
  - Loads and preprocesses the dataset.
  - Standardizes numerical variables.
  - Splits data into training and testing sets.
  - Builds classification models using:
    - **Naïve Bayes** (e1071 package).
    - **Linear Discriminant Analysis (LDA)** (MASS package).
  - Evaluates models using performance metrics.
  - Visualizes results with **ROC curves**.

- **Dataset (`score_test.xlsx`)**:
  - Preprocessed dataset used for model training and evaluation.

---

## Required Libraries
To run the project, install the following R packages:

```r
install.packages("tidyverse")
install.packages("tinytex")
install.packages("MASS")
install.packages("readxl")
install.packages("e1071")
install.packages("caret")
install.packages("ROCR")
install.packages("kernlab")
install.packages("naivebayes")
install.packages("pROC")
install.packages("ggplot2")
```

---

## Usage
1. Open **RStudio**.
2. Ensure that `score_test.xlsx` is in the working directory.
3. Open and run **`Prob_Class_Project.Rmd`** to:
   - Load and preprocess the dataset.
   - Train and evaluate classification models.
   - Compare model performance using ROC curves.

---

## Author
**Raúl Varela Ferrando**