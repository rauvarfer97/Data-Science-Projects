# Time Series Analysis and Forecasting

## Project Overview
This project focuses on **time series analysis and forecasting** using the **electricity dataset** from the **TSA package** in R. The objective is to explore and apply various **time series modeling techniques**, including **regression trees, random forests, and forecasting models**, to analyze electricity consumption patterns.

---

## Project Contents
- **RMarkdown Report (`TemporalSeries_Project.Rmd`)**  
  - Loads and preprocesses the **electricity** dataset from the `TSA` package.  
  - Applies **exploratory data analysis** techniques.  
  - Implements **machine learning models**, including regression trees and random forests.  
  - Evaluates forecasting models using appropriate performance metrics.  

---

## Required Libraries
To execute this project, install the following R packages:

```r
install.packages("TSA")
install.packages("tseries")
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
install.packages("forecast")
```

---

## Usage Instructions
1. **Open RStudio** and load `TemporalSeries_Project.Rmd`.  
2. **Execute the RMarkdown file**, which will:  
   - Load the **electricity** dataset from the `TSA` package.  
   - Perform **data preprocessing** and **exploratory analysis**.  
   - Train **time series models** to predict electricity consumption.  
   - Visualize results using appropriate plots.  

---

## Author
**Raúl Varela Ferrando**