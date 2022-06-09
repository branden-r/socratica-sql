-- Question 13: How many earthquakes were due to a nuclear explosion?

SELECT COUNT(*)
FROM earthquakes
WHERE cause = 'nuclear explosion';