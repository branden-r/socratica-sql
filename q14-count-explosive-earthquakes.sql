-- Question 14: How many earthquakes were due to an explosion?
-- Your answer should not include quakes induced by nukes.

SELECT COUNT(*) 
FROM earthquakes
WHERE cause = 'explosion';