-- Question 16: Which earthquakes were caused by an explosion?

SELECT *
FROM earthquakes
WHERE cause = 'explosion';