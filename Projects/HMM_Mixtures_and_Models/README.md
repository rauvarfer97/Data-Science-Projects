# Hidden Markov Models for Air Pollution Analysis

## Project Overview
This project implements **Hidden Markov Models (HMM)** to analyze air pollution time series, focusing on **NO₂** levels. The study utilizes data from **Contamin.RData**, which contains daily measurements of five different pollution variables. The objective is to fit an HMM model to the NO₂ time series and determine the optimal number of hidden states based on the **Bayesian Information Criterion (BIC)**.

---

## Project Contents

- **RMarkdown Report (`HMM_Model_Project.Rmd`)**  
  - Loads and explores the air pollution dataset.
  - Plots the NO₂ time series for visualization.
  - Constructs multiple **Hidden Markov Models (HMMs)** with different numbers of hidden states.
  - Evaluates the models using **BIC** to select the best-fitting one.

- **Dataset (`Contamin.RData`)**  
  - Contains five pollution variables recorded daily.
  - The study focuses on the **NO₂** variable.
  - The dataset has different time series lengths, requiring preprocessing before model fitting.

---

## Required Libraries
To run the project, install the following R packages:

```r
install.packages("tinytex")
install.packages("depmixS4")
```

---

## Usage
1. Open **RStudio**.
2. Ensure that `Contamin.RData` is in the working directory.
3. Open and run the `HMM_Model_Project.Rmd` file to:
   - Load and explore the dataset.
   - Fit multiple HMMs to the NO₂ time series.
   - Select the best model based on **BIC**.
   - Visualize the hidden state dynamics.

---

## Author
**Raúl Varela Ferrando**

