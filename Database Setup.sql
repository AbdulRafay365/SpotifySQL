-- Table: public.spotify_data

-- DROP TABLE IF EXISTS public.spotify_data;

CREATE TABLE IF NOT EXISTS public.spotify_data
(
    artist character varying(255) COLLATE pg_catalog."default",
    track character varying(255) COLLATE pg_catalog."default",
    album character varying(255) COLLATE pg_catalog."default",
    album_type character varying(255) COLLATE pg_catalog."default",
    danceability double precision,
    energy double precision,
    loudness double precision,
    speechiness double precision,
    acousticness double precision,
    instrumentalness double precision,
    liveness double precision,
    valence double precision,
    tempo double precision,
    duration_min double precision,
    title character varying(255) COLLATE pg_catalog."default",
    channel character varying(255) COLLATE pg_catalog."default",
    views double precision,
    likes bigint,
    comments bigint,
    licensed boolean,
    official_video boolean,
    stream bigint,
    energyliveness double precision,
    most_playedon character varying(50) COLLATE pg_catalog."default"
);

SELECT * FROM spotify_data;

-- EDA

-- Checking UTF-8 encription works or not
SELECT * FROM spotify_data
WHERE track ILIKE ('%√%');

-- How many artists

SELECT COUNT(DISTINCT(artist)) 
FROM spotify_data;

-- How many albums

SELECT COUNT(DISTINCT(album))
FROM spotify_data;

-- How many types of albums and which types

SELECT COUNT(DISTINCT(album_type)) 
FROM spotify_data;

SELECT DISTINCT(album_type)
FROM spotify_data;

-- Maximum duration
SELECT title, MAX(duration_min)
FROM spotify_data
GROUP BY title
ORDER BY 2 DESC
LIMIT 1;

-- Minimum duration
SELECT title, min(duration_min)
FROM spotify_data
GROUP BY title
ORDER BY 2 ASC;

DELETE FROM spotify_data
WHERE duration_min = 0;

-- Maximum danceability
SELECT title, MAX(danceability)
FROM spotify_data
GROUP BY title
ORDER BY 2 DESC;

-- Minimum danceability
SELECT title, MIN(danceability)
FROM spotify_data
GROUP BY title
ORDER BY 2 ASC;

-- Minimum danceability
SELECT COUNT(*)
FROM spotify_data
WHERE danceability = (SELECT MIN(danceability) FROM spotify_data);

SELECT COUNT(DISTINCT(channel))
FROM spotify_data;

SELECT DISTINCT(most_playedon)
FROM spotify_data;

---------------------------------------------------
-------------------DATA ANALYSIS-------------------
---------------------------------------------------








