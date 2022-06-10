-- Question 15: How many earthquakes were caused by an explosion?
-- The explosions may be nuclear or non-nuclear.

SELECT COUNT(*)
FROM earthquakes
WHERE cause = 'nuclear explosion' OR cause = 'explosion';