-- Question 16: Which earthquakes were caused by explosions?

SELECT *
FROM earthquakes
WHERE cause = 'explosion';