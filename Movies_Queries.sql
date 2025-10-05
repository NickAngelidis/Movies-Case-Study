-- Find the 5 movies with the highest ratings
SELECT m.TITLE, r.RATING
FROM MOVIES m
JOIN RATINGS r ON r.MOVIEID = m.MOVIEID
ORDER BY r.RATING DESC
LIMIT 5;

-- Find the average rating for each genre of movies
SELECT m.GENRE, AVG(r.RATING) AS AVG_RATING
FROM MOVIES m
JOIN RATINGS r ON r.MOVIEID = m.MOVIEID
GROUP BY m.GENRE;

-- Find all the movies with no ratings
SELECT m.TITLE
FROM MOVIES m
WHERE m.MOVIEID NOT IN (
SELECT r.MOVIEID
FROM RATINGS r);

-- Find the highest ratings given to every genre
SELECT m.GENRE, MAX(r.RATING) AS MAX_RATING
FROM MOVIES m 
JOIN RATINGS r ON m.MOVIEID = r.MOVIEID
GROUP BY m.GENRE;

-- Find the difference between each rating with the average rating of each movie
SELECT m.TITLE, r.RATING, 
AVG(r.RATING) OVER( PARTITION BY m.MOVIEID) AS AVERAGE_RATING,
r.RATING - AVG(r.RATING) OVER( PARTITION BY m.MOVIEID) AS RATING_DIFF
FROM MOVIES m
JOIN RATINGS r ON r.MOVIEID = m.MOVIEID;

-- Find the users that have given more than 1 rating to the same movie
SELECT u.FIRSTNAME, u.LASTNAME, r.MOVIEID, COUNT(r.RATING) AS NUM_OF_RATINGS
FROM USERS u
JOIN RATINGS r ON r.USERID = u.USERID
GROUP BY u.FIRSTNAME, u.LASTNAME, r.MOVIEID
HAVING NUM_OF_RATINGS > 1;

-- Find each movie's rank in the movie genre, ordred by movie average rating
SELECT m.TITLE, m.GENRE, AVG(r.RATING),
ROW_NUMBER() OVER (PARTITION BY m.GENRE ORDER BY AVG(RATING) DESC) AS RANK_IN_GENRE
FROM MOVIES m 
JOIN RATINGS r ON r.MOVIEID = m.MOVIEID
GROUP BY m.GENRE, m.TITLE
ORDER BY m.GENRE, RANK_IN_GENRE;

-- Find the ratings submitted by users with a certain email pattern(@gmail.com) and for a specific movie genre (action)
SELECT u.FIRSTNAME, u.LASTNAME, u.EMAIL, m.GENRE, r.RATING
FROM RATINGS r
JOIN USERS u ON u.USERID = r.USERID
JOIN MOVIES m ON m.MOVIEID = r.MOVIEID
WHERE u.EMAIL LIKE '%@gmail.com' AND m.GENRE = 'Action';

-- Find the total amount of ratings per movie and show only the movies with a higher amount of ratings
SELECT m.TITLE,COUNT(r.RATING) AS NUMBER_OF_RATINGS
FROM MOVIES m
JOIN RATINGS r ON r.MOVIEID = m.MOVIEID
GROUP BY m.TITLE
HAVING COUNT(r.RATING) > 1;

-- Create a list that combines movie titles and user names for each rating
SELECT u.FIRSTNAME, u.LASTNAME, m.TITLE, r.RATING
FROM RATINGS r
JOIN MOVIES m ON r.MOVIEID = m.MOVIEID
JOIN USERS u ON u.USERID = r.USERID;


