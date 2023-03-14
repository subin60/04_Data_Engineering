CREATE DATABASE gans_e_bike;
USE gans_e_bike;

-- DROP TABLE cities;

CREATE TABLE cities (
    city_id int, 
    city VARCHAR(20), 
    country VARCHAR(20),
    latitude float,
	longitude float,
    population int,
    PRIMARY KEY (city_id)
);

-- DROP TABLE weather;

CREATE TABLE weather (
	weather_id INT NOT NULL AUTO_INCREMENT,
    city_id int, 
    city VARCHAR(50), 
    country VARCHAR(50),
    forecast_time DATETIME,
	outlook VARCHAR(50),
    detailed_outlook VARCHAR(50),
    temperature float,
    temperature_feels_like float,
    clouds float,
    rain float,
    snow float,
    wind_speed float,
    wind_deg float,
    humidity int,
    pressure int,
	sea_level int,
    grnd_level int,
    information_retrieved_at DATETIME,
    PRIMARY KEY (weather_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);  

-- DROP TABLE icao_airport;

CREATE TABLE icao_airport (
    city_id int, 
    icao_code VARCHAR(20), 
    iata_code VARCHAR(20),
    country VARCHAR(20),
    arrival_airport VARCHAR(50),
    latitude float,
	longitude float,
    PRIMARY KEY (icao_code),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)    
);

-- DROP TABLE arrivals_airport;

CREATE TABLE arrivals_airport (
    arrivals_airport_id INT NOT NULL AUTO_INCREMENT,
    icao_code VARCHAR(20), 
    flight_number VARCHAR(20),
    airline_name VARCHAR(50),
    arrival_time DATETIME,
    arrival_terminal VARCHAR(20),
    departure_airport VARCHAR(50),
    aircraft_model VARCHAR(50),
    information_retrieved_at DATETIME,
    PRIMARY KEY (arrivals_airport_id),
    FOREIGN KEY (icao_code) REFERENCES icao_airport(icao_code)    
);

DROP TABLE weather;


SELECT * FROM cities;
SELECT * FROM icao_airport;
SELECT * FROM weather;
SELECT * FROM arrivals_airport;

SELECT city, country, forecast_time, outlook, detailed_outlook, temperature, humidity, information_retrieved_at
FROM weather;



