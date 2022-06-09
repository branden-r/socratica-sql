DROP TABLE IF EXISTS earthquakes;

CREATE TABLE earthquakes (
	earthquake_id INTEGER PRIMARY KEY,
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

COPY earthquakes
FROM 'D:/data/earthquakes.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM earthquakes;