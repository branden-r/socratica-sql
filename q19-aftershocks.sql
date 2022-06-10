-- Question 19: How many aftershocks occurred as a result of the second largest earthquake?

SELECT COUNT(*) 
FROM earthquakes
-- percent symbol matches zero or more characters
-- this will match any row where the place column contains the word Honshu before the word Japan

-- between is shorthand for searching for a range of data
-- between is inclusive - it includes values that match the beginning and end of the specified range
-- for example, this query includes quakes that occurred on 2011-03-11 and 2011-03-18 and everything between those dates
-- an equivalent syntax:
-- WHERE place LIKE '%Honshu%Japan%' AND '2011-03-11' <= occurred_on AND occurred_on <= '2011-03-18';
WHERE place LIKE '%Honshu%Japan%' AND occurred_on BETWEEN '2011-03-11' AND '2011-03-18';