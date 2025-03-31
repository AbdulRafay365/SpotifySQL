---------------------------------------------------
-------------------DATA ANALYSIS-------------------
---------------------------------------------------
-- level: easy
-- Sneak peak
SELECT * 
FROM spotify_data;

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT track, stream
FROM spotify_data
WHERE stream >= 1000000000
ORDER BY 2 DESC;
-- Insight: Blinding lights is the most streamed track, artist = the weekend

-- 2. List all albums along with their respective artists.
SELECT DISTINCT(album), artist
FROM spotify_data
ORDER BY 1;

-- 3. Get the total number of comments for tracks where licensed = TRUE.

SELECT 
	SUM(comments) as total_comments
FROM spotify_data
WHERE licensed = 'TRUE';

-- 4. Find all tracks that belong to the album type 'single'.

SELECT track, album_type
FROM spotify_data
WHERE album_type = 'single';

-- 5. Count the total number of tracks by each artist.

SELECT artist, COUNT(track) AS total_tracks
FROM spotify_data
GROUP BY artist
ORDER BY 2 DESC;

-- level: medium

-- 6. Calculate the average danceability of tracks in each album.
SELECT album, AVG(danceability) AS average_danceability
FROM spotify_data
GROUP BY 1
ORDER BY 2 DESC;

-- 7. Find the top 5 tracks with the highest energy values.
SELECT track, energy
FROM spotify_data
ORDER BY 2 DESC
LIMIT 5;

-- 8. List all tracks along with their views and likes where official_video = TRUE.

SELECT track, views, likes, official_video
FROM spotify_data
WHERE official_video IS TRUE
ORDER BY 2 DESC;

-- 9. For each album, calculate the total views of all associated tracks.

SELECT album, track, SUM(views) AS total_views
FROM spotify_data
WHERE official_video IS TRUE
GROUP BY album, track
ORDER BY total_views DESC;

-- 10. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * FROM
(
		SELECT track,
		COALESCE(SUM(CASE WHEN most_playedon = 'Spotify' THEN stream END),0) AS spotify_streams,
		COALESCE(SUM(CASE WHEN most_playedon = 'Youtube' THEN stream END),0) AS Youtube_streams
		FROM spotify_data
		GROUP BY 1
) as sub_query1
WHERE spotify_streams > Youtube_streams
AND Youtube_streams <> 0;

-- level: Advanced

-- 11. Find the top 3 most-viewed tracks for each artist using window functions.

WITH ranked_table AS

(SELECT 
	artist, track, 
	SUM(views) total_views,
	DENSE_RANK() OVER(PARTITION BY(artist) ORDER BY SUM(views) DESC) AS ranks
FROM spotify_data
GROUP BY 1, 2
ORDER BY 1, 3 DESC)

SELECT * FROM 
ranked_table
WHERE ranks <=3 ;

-- 12. Write a query to find tracks where the liveness score is above the average.

SELECT track, liveness
FROM spotify_data
WHERE liveness > (SELECT AVG(liveness) FROM spotify_data);

-- 13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

WITH energy_comparision AS

(SELECT 
	album,
	MAX(energy) AS highest,
	MIN(energy) AS lowest
FROM spotify_data
GROUP BY 1)

SELECT album, (highest - lowest) AS difference
FROM energy_comparision
ORDER BY 2 DESC;

-- 14. Find tracks where the energy-to-liveness ratio is greater than 1.2.

WITH cte AS
(SELECT 
	track,
	energy,
	liveness
FROM spotify_data)
SELECT 
	track, 
	(energy / liveness) AS ratio 
FROM cte
WHERE (energy / liveness) > 1.2
ORDER BY ratio DESC;

-- 15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions

SELECT 
    track,
    views,
    likes,
    SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify_data;
