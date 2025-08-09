

/* 
===========================================================
    Project: Netflix Shows & Movies Dataset - SQL Practice
    Day 2: Filtering, Sorting & Conditional Queries
-----------------------------------------------------------
Dataset Description:
    - Total Columns: 9
    - Columns: 
        id, title, type, release_year, age_certification, 
        runtime_minutes, imdb_id, imdb_score, imdb_votes
    - Objective:
        Apply SQL filtering, sorting, string matching, 
        and aggregation techniques on Netflix dataset.
===========================================================
*/

-- Q1: Find all movies released after 2015.
SELECT title, release_year
FROM netflix_shows_movies
WHERE type = 'MOVIE'  
  AND release_year > 2015;


-- Q2: Get all TV shows with IMDb score above 8 and age_certification = 'TV-MA'.
SELECT title, imdb_score, age_certification
FROM netflix_shows_movies
WHERE type = 'SHOW' 
  AND imdb_score > 8
  AND age_certification = 'TV-MA';


-- Q3: List all titles where runtime_minutes is between 90 and 120.
SELECT title, runtime_minutes
FROM netflix_shows_movies
WHERE runtime_minutes BETWEEN 90 AND 120;


-- Q4: Show all titles with IMDb score >= 8 OR runtime_minutes > 150.
SELECT title, imdb_score, runtime_minutes
FROM netflix_shows_movies
WHERE imdb_score >= 8 
   OR runtime_minutes > 150;


-- Q5: Find all rows where age_certification is NULL.
SELECT * 
FROM netflix_shows_movies
WHERE age_certification IS NULL;


-- Q6: Get top 10 oldest movies (by release_year, ascending).
SELECT title, release_year
FROM netflix_shows_movies
WHERE type = 'MOVIE'
ORDER BY release_year ASC
LIMIT 10;


-- Q7: Find all titles with word "Love" in their title.
SELECT title
FROM netflix_shows_movies
WHERE title LIKE '%Love%';


-- Q8: Get all content released between 2000 and 2010.
SELECT * 
FROM netflix_shows_movies
WHERE release_year BETWEEN 2000 AND 2010;


-- Q9: List TV shows with IMDb score above the overall average IMDb score.
SELECT title, imdb_score
FROM netflix_shows_movies
WHERE type = 'SHOW'
  AND imdb_score > (
        SELECT AVG(imdb_score)
        FROM netflix_shows_movies
    );


-- Q10: Find all movies that are NOT in top 25% IMDb scores.

WITH ranked AS (
    SELECT 
        title, 
        imdb_score,
        PERCENT_RANK() OVER (ORDER BY imdb_score) AS pr
    FROM netflix_shows_movies
    WHERE type = 'MOVIE'
)
SELECT title, imdb_score
FROM ranked
WHERE pr < 0.75;
