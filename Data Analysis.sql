---------------------------------------------------
-------------------DATA ANALYSIS-------------------
---------------------------------------------------
-- Level: Easy

-- Sneak peek: View a sample of the dataset
SELECT * 
FROM spotify_data
LIMIT 10;

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT track, stream
FROM spotify_data
WHERE stream >= 1000000000
ORDER BY stream DESC; 
-- Insight: "Blinding Lights" is the most streamed track, artist = The Weeknd.

-- 2. List all unique albums along with their respective artists.
SELECT DISTINCT(album), artist
FROM spotify_data
ORDER BY album;

-- 3. Get the total number of comments for tracks where licensing is granted.
SELECT 
	SUM(comments) AS total_comments
FROM spotify_data
WHERE licensed = 'TRUE';

-- 4. Retrieve all tracks that belong to albums classified as 'single'.
SELECT track, album_type
FROM spotify_data
WHERE album_type = 'single';

-- 5. Count the total number of tracks released by each artist.
SELECT artist, COUNT(track) AS total_tracks
FROM spotify_data
GROUP BY artist
ORDER BY total_tracks DESC; -- Sorting by most productive artists.

-- Level: Medium

-- 6. Calculate the average danceability score for each album.
SELECT album, AVG(danceability) AS average_danceability
FROM spotify_data
GROUP BY album
ORDER BY average_danceability DESC;

-- 7. Identify the top 5 tracks with the highest energy levels.
SELECT track, energy
FROM spotify_data
ORDER BY energy DESC
LIMIT 5;

-- 8. Retrieve tracks that have an official music video, displaying their views and likes.
SELECT track, views, likes, official_video
FROM spotify_data
WHERE official_video IS TRUE
ORDER BY views DESC; -- Sorting by most viewed videos.

-- 9. Calculate the total views for all tracks grouped by album.
SELECT album, SUM(views) AS total_views
FROM spotify_data
WHERE official_video IS TRUE
GROUP BY album
ORDER BY total_views DESC;

-- 10. Retrieve tracks that have more streams on Spotify than on YouTube.
SELECT * FROM
(
	SELECT track,
	COALESCE(SUM(CASE WHEN most_playedon = 'Spotify' THEN stream END), 0) AS spotify_streams,
	COALESCE(SUM(CASE WHEN most_playedon = 'Youtube' THEN stream END), 0) AS youtube_streams
	FROM spotify_data
	GROUP BY track
) AS sub_query1
WHERE spotify_streams > youtube_streams AND youtube_streams <> 0;

-- Level: Advanced

-- 11. Identify the top 3 most-viewed tracks for each artist using window functions.
WITH ranked_tracks AS (
	SELECT 
		artist, track, 
		SUM(views) AS total_views,
		DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC) AS rank
	FROM spotify_data
	GROUP BY artist, track
)
SELECT * 
FROM ranked_tracks
WHERE rank <= 3; 

-- 12. Retrieve tracks where the liveness score is above the dataset’s average.
SELECT track, liveness
FROM spotify_data
WHERE liveness > (SELECT AVG(liveness) FROM spotify_data);

-- 13. Compute the difference between the highest and lowest energy values for tracks in each album.
WITH energy_comparison AS (
	SELECT 
		album,
		MAX(energy) AS highest_energy,
		MIN(energy) AS lowest_energy
	FROM spotify_data
	GROUP BY album
)
SELECT album, (highest_energy - lowest_energy) AS energy_difference
FROM energy_comparison
ORDER BY energy_difference DESC; -- Sorting by highest energy variation.

-- 14. Find tracks where the energy-to-liveness ratio exceeds 1.2.
WITH track_energy_liveness AS (
	SELECT 
		track,
		energy,
		liveness
	FROM spotify_data
)
SELECT 
	track, 
	(energy / liveness) AS energy_liveness_ratio 
FROM track_energy_liveness
WHERE (energy / liveness) > 1.2
ORDER BY energy_liveness_ratio DESC;

-- 15. Calculate the cumulative sum of likes for tracks, ordered by views using window functions.
SELECT 
    track,
    views,
    likes,
    SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify_data;
