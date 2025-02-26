# Data Transformation and Analysis using Pentaho

## Project Overview
This project focuses on **data transformation and analysis using Pentaho Data Integration (Kettle)**. It processes datasets containing **Spotify streaming data** to extract insights on top songs, artists, and genres. The workflow involves **data cleansing, transformation, and merging** to generate meaningful outputs.

---

## Project Contents
- **Pentaho Model (`EntregaPentahoTransf.ktr`)**  
  - Implements a **data transformation pipeline** in Pentaho Kettle.  
  - Reads multiple CSV datasets.  
  - Cleans and selects relevant variables.  
  - Merges datasets based on common keys.  
  - Generates various analytical outputs.

- **Input Data (`Inputs.rar`)**  
  This folder contains the datasets used in the project:
  - **Top Songs Weekly.csv**: Contains weekly rankings of songs on Spotify.
  - **Top Streamed Songs.csv**: List of globally most streamed songs.
  - **Top_Artists_By_Country.csv**: Artists ranked by country.

- **Output Data (`Outputs.rar`)**  
  This folder contains the generated results:
  - **Artistas_Top.txt**: Artists who have reached the top position.
  - **Canciones_Top.txt**: Songs that have reached the number one position.
  - **Generos_mas_escuchados.txt**: Most popular music genres.
  - **Media_Generos.txt**: Average statistics for each genre.
  - **Países_Artistas.txt**: Mapping of top artists to their respective countries.

---

## Data Processing Workflow
1. **Reading and Cleaning Data**  
   - Load **Top Songs Weekly** dataset.  
   - Select relevant attributes such as *rank, artist names, genre, track name, album info, peak rank, streams, tempo, duration, and loudness*.  
   - Process missing values and ensure data consistency.

2. **Merging Datasets**  
   - Combine **weekly top songs** with **top streamed songs** based on track name.  
   - Extract songs that reached the **Top 10** and classify them by genre.  

3. **Generating Outputs**  
   - **Most Popular Genres**: Extracts and saves genres appearing in both top weekly and global charts.  
   - **Top Songs and Artists**: Filters songs and artists that reached the **number one position**.  
   - **Country-wise Artist Ranking**: Matches top-ranked artists with their respective countries.

---

## Required Software
To run this project, you need:
- **Pentaho Data Integration (Kettle)**: Download from [Pentaho Official Website](https://www.hitachivantara.com/en-us/products/data-management-analytics/pentaho-platform.html)
- **A CSV viewer or spreadsheet editor** to explore input/output files.

---

## Usage Instructions
1. **Extract `Inputs.rar` and `Outputs.rar`.**
2. **Open Pentaho Data Integration (Kettle).**
3. **Load the transformation file**: `EntregaPentahoTransf.ktr`.
4. **Configure input file paths** to match the extracted datasets.
5. **Run the transformation** to generate the outputs.
6. **Analyze the results** in the `Outputs.rar` folder.

---

## Author
**Raúl Varela Ferrando**

