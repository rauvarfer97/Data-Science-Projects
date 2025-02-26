# Shiny Web Application for Data Analysis

## Project Overview
This project involves the development of an **interactive web application** using **Shiny in R**. The app is based on an example model but has been **redesigned and extended** to include:
- **A multiple regression analysis section** within the descriptive study.
- **An additional feature** allowing users to explore car models and characteristics using the **`mpg` dataset** from Kaggle.

The project is divided into two main parts:
1. **Custom Shiny Application (`server.R` & `ui.R`)**
2. **An additional Shiny app (`app2/app.R`)** sourced from an external repository.

---

## Project Contents
- **Data Sources**:
  - `advertising.csv` - Advertising data.
  - `datos_ordenadores.csv` - Computer sales dataset.
  - `datos_salarios.csv` - Salary dataset.
  - `mpg` dataset from Kaggle, used in the `ui.R` file.

- **Shiny Application Components**:
  - `server.R` - Defines the server-side logic for the application.
  - `ui.R` - Defines the user interface, including multiple interactive elements.

- **Styling and Images**:
  - **`www/` directory**:
    - `hex_shiny.jpg` & `portadashiny.png` - Images used in the app interface.
    - `estilos.css` - Custom stylesheet to enhance UI aesthetics.

- **Additional Shiny App**:
  - **`app2/` directory**:
    - `app.R` - A secondary Shiny app implementation.
    - **`www/` directory** - Contains `nametag_7x5.png`, an image used in the second app.

---

## Required Libraries
To run the Shiny applications, install the following R packages:

```r
install.packages("dplyr")
install.packages("DT")
install.packages("ggplot2")
install.packages("plotly")
install.packages("leaflet")
install.packages("shiny")
install.packages("shinythemes")
install.packages("TSA")
install.packages("dygraphs")
install.packages("cluster")
install.packages("factoextra")
install.packages("e1071")
install.packages("terra")
install.packages("tidyverse")
```

---

## Usage Instructions
1. **Ensure all datasets and files are in the working directory.**
2. **Run the main Shiny application**:
   - Open **RStudio**.
   - Set the working directory to the folder containing `server.R` and `ui.R`.
   - Execute `shiny::runApp()`.
3. **To run the secondary Shiny app (`app2/app.R`)**:
   - Navigate to the `app2/` directory.
   - Open `app.R` and run `shiny::runApp()`.
4. **Explore the interactive visualizations and data analysis tools provided by the app.**

---

## Author
**Raúl Varela Ferrando**

