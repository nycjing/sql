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