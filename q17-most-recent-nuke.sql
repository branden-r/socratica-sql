-- Question 17: Find the most recent earthquake caused by a nuke.
-- Display where the earthquake occurred, its magnitude, and when it happened.

SELECT place, magnitude, occurred_on
FROM earthquakes
WHERE cause = 'nuclear explosion'
ORDER BY occurred_on DESC
LIMIT 1;