# Spatial Dependence Analysis and Modeling (A Comparative Study of SAR and SEM Models)

## Project Overview
This project focuses on **spatial regression models** using **spatial data analysis techniques** in **R**. The dataset is generated using the **`genera_esp.R`** script, which simulates **spatially correlated data** for regression modeling. The main objective is to analyze spatial relationships and dependencies within the generated dataset.

The workflow includes:
- **Data generation** using `genera_esp.R`.
- **Spatial data processing** using R packages like `raster`, `sp`, and `sf`.
- **Modeling and visualization** of spatial dependencies.
- **Analysis of spatial regression results**.

---

## Project Contents
- **Data Generation Script**:
  - `genera_esp.R`: Generates spatial data based on user-provided parameters.

- **RMarkdown Report**:
  - `SpatialSeries_Project.Rmd`: Implements spatial regression analysis and visualization.

---

## Required Libraries
To run this project, install the following R packages:

```r
install.packages("raster")
install.packages("rgeos")
install.packages("lattice")
install.packages("RColorBrewer")
install.packages("latticeExtra")
install.packages("sp")
install.packages("sf")
install.packages("spdep")
install.packages("spatialreg")
```

---

## Usage Instructions
1. **Run `genera_esp.R`** to generate spatial data:
   ```r
   source("genera_esp.R")
   data <- genespdat(DNI15 = 12345)  # Replace 12345 with your last five digits of ID
   ```
2. **Open and execute `SpatialSeries_Project.Rmd`** in **RStudio** to:
   - Load and preprocess the spatial dataset.
   - Perform spatial regression analysis.
   - Visualize results using maps and spatial plots.

---

## Author
**Raúl Varela Ferrando**

