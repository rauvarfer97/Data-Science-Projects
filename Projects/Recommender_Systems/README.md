# Music Recommendation System using Collaborative Filtering

## Project Overview
This project focuses on **music recommendation systems** using **collaborative filtering techniques**. The goal is to recommend **new artists** to users based on their listening history and preferences. The system calculates recommendations based on **Pearson correlation coefficients** and adjusts recommendations based on **user feedback**.

---

## Project Contents
- **Jupyter Notebooks**
  - **`RecommenderSystem.ipynb`**: Implements a recommendation system using **collaborative filtering**.
  - **`FeedbackRecommenderSystem.ipynb`**: Enhances the recommender system by incorporating **user feedback** to refine suggestions.

- **Dataset (`Dataset.csv`)**  
  - Contains user listening history, including:
    - **Users** and their interactions with **artists**.
    - **Ratings** given to different artists.
    - Used as input to generate personalized recommendations.

---

## Required Libraries
To run the Jupyter notebooks, install the following dependencies:

```python
pip install pandas matplotlib
```

Or, if using Jupyter Notebook:

```python
!pip install pandas matplotlib
```

---

## Usage Instructions
1. **Ensure `Dataset.csv` is in the working directory.**
2. **Open Jupyter Notebook** and load either:
   - `RecommenderSystem.ipynb` to generate artist recommendations.
   - `FeedbackRecommenderSystem.ipynb` to generate recommendations with user feedback.
3. **Follow the steps in the notebook**:
   - Load the dataset.
   - Input a user name to generate personalized recommendations.
   - Analyze the recommendations with visualizations (e.g., pie charts).

---

## Author
**Raúl Varela Ferrando**

