
SELECT * FROM netflix_shows_movies;



-- Q1: Total number of movies and TV shows.

SELECT COUNT(*) AS total_movies_TV_shows
FROM netflix_shows_movies;



-- Q2: Count of content per age_certification.

SELECT COUNT(*) AS content_per_age_certification, age_certification
FROM netflix_shows_movies
GROUP BY age_certification
ORDER BY content_per_age_certification DESC;



-- Q3: Average IMDb score by type (movie vs TV show).

SELECT ROUND(AVG(imdb_score),2) AS avg_imdb_score, type
FROM netflix_shows_movies
GROUP BY type;


-- Q4: Most common release year.

SELECT COUNT(*) AS total_titles, release_year
FROM netflix_shows_movies
GROUP BY release_year
ORDER BY total_titles DESC
LIMIT 1;




-- Q5: Top 5 titles with highest imdb_score.

SELECT title, imdb_score
FROM netflix_shows_movies
ORDER BY imdb_score DESC
LIMIT 5;


-- Q6: Group by release_year and count how many titles.

SELECT COUNT(title) As total_titles, release_year
FROM netflix_shows_movies
GROUP BY release_year
ORDER BY release_year DESC;



-- Q7: Count of movies with runtime over 120 minutes.

SELECT COUNT(title) 
FROM netflix_shows_movies
WHERE type = "MOVIE" AND (runtime_minutes > 120);


-- Q8: Group by age_certification and calculate avg IMDb score.

SELECT ROUND(AVG(imdb_score),2) AS avg_imdb_score,  age_certification
FROM netflix_shows_movies
GROUP BY age_certification;


-- Q9: How many titles released before 2000?

SELECT COUNT(*) AS total_titles_before_2000, release_year
FROM netflix_shows_movies
WHERE release_year < 2000
GROUP BY release_year;


-- Q10: Titles with imdb_votes greater than average.

SELECT title
FROM netflix_shows_movies
WHERE imdb_score > (
SELECT AVG(imdb_score)
FROM netflix_shows_movies);