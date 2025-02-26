# Web Scraping for E-Commerce Data Analysis

## Project Overview
This project focuses on **web scraping** to extract e-commerce data from the website **[webscraper.io](https://webscraper.io/test-sites/e-commerce/allinone)**. The extracted data is then analyzed and visualized using **Pandas and Plotly**.

The workflow includes:
- **Web scraping** using `BeautifulSoup` and `requests` to collect product data.
- **Data cleaning and structuring** in `Pandas`.
- **Exploratory data analysis (EDA)** with `Plotly`.
- **Integration with FastAPI and Tweepy** for potential API interactions.

---

## Project Contents
- **Jupyter Notebook (`Web_Scrapping_Project.ipynb`)**:
  - Implements web scraping of product listings.
  - Cleans and structures the collected data.
  - Performs exploratory data analysis.
  - Visualizes insights using interactive charts.

---

## Required Libraries
To execute this project, install the following dependencies:

```python
!pip install BeautifulSoup4 pandas plotly requests tweepy hug fastapi scikit-image
```

Or, if using Jupyter Notebook:

```python
import json
import re
import pandas as pd
import plotly.express as px
import requests
import tweepy
from bs4 import BeautifulSoup
```

---

## Usage Instructions
1. **Open Jupyter Notebook** and load `Web_Scrapping_Project.ipynb`.
2. **Run the notebook**, which will:
   - Scrape product data from **[webscraper.io](https://webscraper.io/test-sites/e-commerce/allinone)**.
   - Process and clean the data using **Pandas**.
   - Generate visual insights using **Plotly**.
3. **Analyze and interpret the results**.

---

## Author
**Raúl Varela Ferrando**