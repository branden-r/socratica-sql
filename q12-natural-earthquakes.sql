-- Question 12: How many earthquakes were natural?

SELECT COUNT(*) 
FROM earthquakes
WHERE cause = 'earthquake';