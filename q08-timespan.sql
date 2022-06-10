-- Question 08: What is the timespan of the earthquake data?

SELECT MIN(occurred_on), MAX(occurred_on)
FROM earthquakes;