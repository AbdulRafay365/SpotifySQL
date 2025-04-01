## Spotify SQL Data Analysis Project

<p align="center">
  <img src="https://github.com/user-attachments/assets/13291151-f341-42c6-9aec-2e9c4cb14308" width="500">
</p>

### Project Overview
This project analyzes Spotify music data using PostgreSQL. The dataset includes various attributes such as artist name, track name, album details, audio features (danceability, energy, loudness, etc.), and streaming statistics. The goal is to extract meaningful insights through SQL queries, covering exploratory data analysis (EDA), data cleaning, and advanced data analysis.

### 📂 Dataset Information
Source: https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset/data

**Table Name:** `spotify_data`

**Columns:**
- `artist`: Name of the artist
- `track`: Song title
- `album`: Album name
- `album_type`: Type of album (Single, Album, etc.)
- `danceability`, `energy`, `loudness`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`: Audio features
- `duration_min`: Track duration in minutes
- `views`, `likes`, `comments`: YouTube statistics
- `licensed`, `official_video`: Boolean flags for licensing and official music videos
- `stream`: Spotify streaming count
- `most_playedon`: Platform where the song is most played (Spotify, YouTube, etc.)

### 🔍 Exploratory Data Analysis (EDA)
To understand the dataset, the following analyses were performed:
- **Data Cleaning:** Handled null values, ensured consistent formatting, and checked for duplicate entries.
- **Unique Counts:** Number of unique artists, albums, and album types.
- **Track Durations:** Identified the longest and shortest tracks.
- **Danceability & Energy Levels:** Analyzed how engaging and energetic the songs are.
- **Platform Insights:** Checked the most played platform for each track.

### 📊 SQL Queries & Insights
#### 🔹 Basic Analysis
- Counted the number of distinct artists and albums.
- Retrieved tracks with more than 1 billion streams.
- Found all tracks belonging to album type: Single.
- Listed all albums along with their respective artists.
- Summed the total number of comments for licensed tracks.

#### 🔸 Intermediate Analysis
- Average danceability per album.
- Top 5 most energetic tracks.
- Total views of tracks per album.
- Tracks with more Spotify streams than YouTube views.

#### 🔺 Advanced Analysis
- Used window functions to find top 3 most-viewed tracks per artist.
- Identified tracks with above-average liveness scores.
- Energy-to-liveness ratio analysis to find highly energetic tracks.
- Cumulative sum of likes based on the number of views.

### 🛠️ Tools & Technologies
- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Cleaning:** Excel (for initial pre-processing)
- **IDE:** pgAdmin / DBeaver

### SQL Techniques Used in Spotify Data Analysis  

In this project, we employed a variety of **SQL techniques** to analyze Spotify's music dataset, extracting meaningful insights about track popularity, artist performance, and user engagement. Below are the key SQL methods utilized:  

#### 1️⃣ **Basic Querying & Filtering**  
- Used `SELECT` statements to retrieve relevant data fields.  
- Applied `WHERE` clauses to filter results based on conditions (e.g., filtering tracks with more than 1 billion streams).  
- Utilized `ORDER BY` to sort results based on numerical and categorical attributes.  

#### 2️⃣ **Aggregation & Grouping**  
- **`SUM()`**: Calculated total views and comments for different categories.  
- **`AVG()`**: Found the average danceability and liveness of tracks.  
- **`COUNT()`**: Counted the number of tracks per artist.  
- **`GROUP BY`**: Aggregated data to summarize artist performance, album statistics, and streaming platforms.  

#### 3️⃣ **Conditional Logic & Data Cleaning**  
- Used `COALESCE()` to handle `NULL` values in streaming data.  
- Applied `CASE WHEN` within `SUM()` to compare streams from different platforms (Spotify vs. YouTube).  

#### 4️⃣ **Subqueries & Common Table Expressions (CTEs)**  
- **Subqueries**: Used in `WHERE` clauses to filter based on computed aggregates (e.g., tracks with liveness above the dataset average).  
- **WITH clauses (CTEs)**: Improved query readability by breaking down complex calculations into structured temporary tables (e.g., energy difference calculations across albums).  

#### 5️⃣ **Window Functions for Ranking & Cumulative Calculations**  
- **`DENSE_RANK()`**: Ranked the top 3 most-viewed tracks per artist.  
- **`SUM() OVER()`**: Computed cumulative likes across tracks, ordered by views.  
- **`PARTITION BY`**: Applied ranking within each artist’s dataset to compare their most popular tracks.  

These **SQL techniques** allowed us to extract insights from large-scale music data, enabling deeper analysis of streaming trends and artist performance. 🚀### 📌 Key Learnings
- **SQL Query Optimization:** Improved query efficiency using `WITH` clauses and `WINDOW FUNCTIONS`.
- **Data Cleaning Techniques:** Identified missing and incorrect data before performing analysis.
- **Trend Analysis:** Discovered insights on track popularity, streaming patterns, and artist performance.

### 🚀 Future Enhancements
- Integrate Tableau/Power BI for data visualization.
- Apply machine learning techniques for track recommendation.
- Expand dataset to include different time periods for trend analysis.
