-- Question 00: Import the earthquake data.
-- drop the table in case we are re-running the query
DROP TABLE IF EXISTS earthquakes;

-- called my table "earthquakes" instead of "earthquake"
CREATE TABLE earthquakes (
	-- column names and data types pulled straight from the video
	earthquake_id INTEGER PRIMARY KEY, -- a primary key identifies the row
	occurred_on TIMESTAMP WITHOUT TIME ZONE,
	latitude NUMERIC,
	longitude NUMERIC,
	"depth" NUMERIC,
	magnitude NUMERIC,
	calculation_method CHARACTER VARYING,
	network_id CHARACTER VARYING,
	place CHARACTER VARYING,
	cause CHARACTER VARYING
);

-- populate the table we just made with data from the csv
COPY earthquakes
FROM 'D:/data/earthquakes.csv' -- change this to wherever you put your earthquake data
DELIMITER ',' CSV HEADER; 

SELECT * FROM earthquakes; -- display the entire table