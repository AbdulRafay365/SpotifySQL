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

### 📌 Key Learnings
- **SQL Query Optimization:** Improved query efficiency using `WITH` clauses and `WINDOW FUNCTIONS`.
- **Data Cleaning Techniques:** Identified missing and incorrect data before performing analysis.
- **Trend Analysis:** Discovered insights on track popularity, streaming patterns, and artist performance.

### 🚀 Future Enhancements
- Integrate Tableau/Power BI for data visualization.
- Apply machine learning techniques for track recommendation.
- Expand dataset to include different time periods for trend analysis.
