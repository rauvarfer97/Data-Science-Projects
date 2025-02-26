# Real Estate Price Prediction with PySpark and Pandas

## Project Overview
This project focuses on **real estate price prediction** using **PySpark and Pandas** in a **Google Colab environment**. The dataset consists of various housing attributes, such as lot area, neighborhood, construction year, number of rooms, and overall quality, which are used to train and evaluate machine learning models.

The workflow includes:
- **Data preprocessing** using **PySpark and Pandas**.
- **Feature engineering** and transformation using **VectorAssembler and StringIndexer**.
- **Model training** using **Generalized Linear Regression, Factorization Machines, and Random Forest**.
- **Evaluation** with **custom RMLSE (Root Mean Squared Logarithmic Error) metric**.

---

## Project Contents
- **Datasets**:
  - `train.csv`: Training dataset with housing features and sale prices.
  - `test.csv`: Test dataset without target values.
  - `sample_submission.csv`: Sample format for predictions.

- **Notebooks and Scripts**:
  - `PySpark_Pandas_Project.ipynb`: Main Jupyter notebook implementing the model pipeline.
  - `rmsle.py`: Custom evaluator class to calculate **Root Mean Squared Logarithmic Error (RMSLE)**.

---

## Required Libraries and Environment Setup
To run this project in **Google Colab**, install and configure the following dependencies:

```python
# Install Java and Spark
!apt-get install openjdk-11-jdk-headless -qq > /dev/null
!wget -q https://dlcdn.apache.org/spark/spark-3.2.4/spark-3.2.4-bin-hadoop3.2.tgz
!tar xf spark-3.2.4-bin-hadoop3.2.tgz
!pip install -q findspark

# Import required libraries
import os
from google.colab import drive
import findspark
from pyspark.sql import SparkSession

# Install PyArrow for Pandas API on PySpark
!pip install pyarrow

# Import necessary libraries
from pyspark import pandas as ps
import pandas as pd
from pyspark.sql.types import IntegerType
from pyspark.ml.feature import StringIndexer, IndexToString, VectorAssembler
from pyspark.ml import Pipeline
from pyspark.ml.regression import GeneralizedLinearRegression, FMRegressor, RandomForestRegressor
from pyspark.ml.evaluation import Evaluator, RegressionEvaluator
from math import sqrt
from operator import add
import pyspark.sql.functions as F
```

---

## Usage Instructions
1. **Open Google Colab** and upload the datasets and script files.
2. **Run `PySpark_Pandas_Project.ipynb`**, which:
   - Loads and preprocesses the datasets.
   - Trains different machine learning models.
   - Evaluates model performance using RMSLE.
   - Generates predictions for the test set.
3. **Review predictions** and compare model performance.

---

## Custom Evaluation Metric
The `rmsle.py` script defines a **custom RMSLE evaluator** (`RmsleEvaluator`), replacing the standard PySpark `RegressionEvaluator`. This metric is particularly useful for models predicting house prices with a high variance.

---

## Author
**Raúl Varela Ferrando**