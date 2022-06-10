-- Question 18: What were the ten largest earthquakes?
-- For each earthquake, display where it happened, its magnitude, and when it happened.

SELECT place, magnitude, occurred_on 
FROM earthquakes
ORDER BY magnitude DESC
LIMIT 10;