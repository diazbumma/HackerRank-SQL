SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTR(CITY, LENGTH(CITY), 1) = 'A' OR
SUBSTR(CITY, LENGTH(CITY), 1) = 'I' OR
SUBSTR(CITY, LENGTH(CITY), 1) = 'U' OR
SUBSTR(CITY, LENGTH(CITY), 1) = 'E' OR
SUBSTR(CITY, LENGTH(CITY), 1) = 'O';
