

-- Netflix Movies & TV Shows Queries
-- Dataset: netflix_shows_movies

-------------------------------------------------------
-- Q1: Total number of movies and TV shows
-------------------------------------------------------
SELECT COUNT(type) AS total_movies_TV_shows
FROM netflix_shows_movies;

-------------------------------------------------------
-- Q2: Count of content per age_certification
-------------------------------------------------------
SELECT age_certification, COUNT(*) AS content_per_age_certification
FROM netflix_shows_movies
GROUP BY age_certification;

-------------------------------------------------------
-- Q3: Average IMDb score by type (movie vs TV show)
-------------------------------------------------------
SELECT type, AVG(imdb_score) AS avg_imdb_score
FROM netflix_shows_movies
GROUP BY type;

-------------------------------------------------------
-- Q4: Most common release year
-------------------------------------------------------
SELECT release_year, COUNT(*) AS total_titles
FROM netflix_shows_movies
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 1;

-------------------------------------------------------
-- Q5: Top 5 titles with highest IMDb score
-------------------------------------------------------
SELECT title, imdb_score
FROM netflix_shows_movies
ORDER BY imdb_score DESC
LIMIT 5;

-------------------------------------------------------
-- Q6: Titles count grouped by release_year
-------------------------------------------------------
SELECT release_year, COUNT(title) AS total_titles
FROM netflix_shows_movies
GROUP BY release_year
ORDER BY release_year DESC;

-------------------------------------------------------
-- Q7: Count of movies with runtime over 120 minutes
-------------------------------------------------------
SELECT COUNT(title) AS long_movies_count
FROM netflix_shows_movies
WHERE type = 'MOVIE' 
  AND runtime_minutes > 120;

-------------------------------------------------------
-- Q8: Average IMDb score by age_certification
-------------------------------------------------------
SELECT age_certification, AVG(imdb_score) AS avg_imdb_score
FROM netflix_shows_movies
GROUP BY age_certification;

-------------------------------------------------------
-- Q9: Titles released before 2000
-------------------------------------------------------
SELECT release_year, COUNT(title) AS total_titles
FROM netflix_shows_movies
WHERE release_year < 2000
GROUP BY release_year
ORDER BY release_year;

-------------------------------------------------------
-- Q10: Titles with IMDb score greater than average
-------------------------------------------------------
SELECT title
FROM netflix_shows_movies
WHERE imdb_score > (
    SELECT AVG(imdb_score)
    FROM netflix_shows_movies
);
