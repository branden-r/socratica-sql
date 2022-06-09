-- Question 06: What was the largest earthquake in 2010?

SELECT * FROM earthquakes
WHERE occurred_on >= '2010-01-01' AND occurred_on < '2011-01-01' -- only consider quakes that occurred in 2010
ORDER BY magnitude DESC -- put the largest quake at the top
LIMIT 1; -- the answer will be a single quake, so only show one