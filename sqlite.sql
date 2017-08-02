CREATE TABLE movies(
   id integer PRIMARY KEY,
   name TEXT DEFAULT NULL,
   year integer DEFAULT NULL,
   rank real DEFAULT NULL
);

CREATE TABLE actors(
   id integer PRIMARY KEY,
   first_name TEXT DEFAULT NULL,
   last_name TEXT DEFAULT NULL,
   gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);


SELECT name, year FROM movies WHERE year=1902 AND rank>5;


Find all movies made in the year you were born.
SELECT name, year FROM movies WHERE year=1968;


How many movies does our dataset have for the year 1982?
SELECT count(*) FROM movies WHERE year = 1982;

Find actors who have "stack" in their last name.
SELECT id,first_name,last_name,gender FROM actors WHERE last_name like '%stack%';

What are the 10 most popular first names and last names in the business?


SELECT first_name, COUNT(first_name)
FROM actors
GROUP BY first_name
ORDER BY COUNT(first_name) DESC LIMIT 10;

SELECT last_name, COUNT(last_name)
FROM actors
GROUP BY last_name
ORDER BY COUNT(last_name) DESC LIMIT 10;

SELECT (first_name|| " " ||last_name) AS full_name,COUNT(first_name|| " " ||last_name)
FROM actors
GROUP BY full_name
ORDER BY COUNT(full_name) DESC LIMIT 10;

Prolific
SELECT (first_name|| " " ||last_name) AS full_name, COUNT(first_name|| " " ||last_name)
FROM actors JOIN roles ON actors.id = actor_id GROUP BY full_name ORDER BY COUNT(full_name) DESC LIMIT 100;

Bottom of the Barrel
SELECT genre, COUNT(genre) from movies_genres JOIN movies ON movies.id = movie_id GROUP BY genre
ORDER BY COUNT(genre) ASC LIMIT 10;

Braveheart

SELECT (first_name|| " " ||last_name) AS full_name
FROM actors JOIN roles ON actors.id = actor_id JOIN movies ON movie_id = movies.id
WHERE year = 1995 AND name = "Braveheart"
ORDER BY last_name;

Leap Noir

SELECT (first_name|| " " ||last_name) AS full_name, name, year
FROM directors JOIN  movies_directors ON directors.id = movies_directors.director_id
JOIN movies ON movies_directors.movie_id = movies.id JOIN movies_genres
ON movies.id = movies_genres.movie_id WHERE year % 4 = 0 AND genre = "Film-Noir" ORDER BY name;

Bacon
SELECT sub.name,actors.first_name, actors.last_name
FROM
    (SELECT name, movies.id as id  FROM actors
    JOIN roles ON roles.actor_id = actors.id JOIN movies ON roles.movie_id = movies.id
    JOIN movies_genres ON movies.id = movies_genres.movie_id
    WHERE first_name = "Kevin" AND last_name ="Bacon"  AND genre = "Drama") sub
JOIN roles ON roles.movie_id = sub.id JOIN actors ON roles.actor_id = actors.id
WHERE actors.first_name <> "Kevin" AND last_name <> "Bacon"
ORDER BY sub.name;

Immortal actors
SELECT *
FROM
(SELECT first_name, last_name, actors.id AS sub_id
FROM actors JOIN roles ON actors.id = roles.actor_id JOIN movies ON roles.movie_id = movies.id
WHERE year < 1900
INTERSECT
SELECT first_name, last_name, actors.id AS sub_id
FROM actors JOIN roles ON actors.id = roles.actor_id JOIN movies ON roles.movie_id = movies.id
WHERE year > 2000)
ORDER BY sub_id;

