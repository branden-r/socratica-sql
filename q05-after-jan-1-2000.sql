-- Question 05: Display all earthquakes that occurred on or after January 1st, 2000.

SELECT * 
FROM earthquakes
WHERE occurred_on >= '2000-01-01';