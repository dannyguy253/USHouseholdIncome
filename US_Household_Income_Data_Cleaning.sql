# US Household Income Data Cleaning

ALTER TABLE us_household_income_statistics
RENAME COLUMN `ï»¿id` TO `id`;


SELECT *
FROM us_project.us_household_income;

SELECT *
FROM us_project.us_household_income_statistics;

SELECT COUNT(id)
FROM us_project.us_household_income;

SELECT COUNT(id) 
FROM us_project.us_household_income_statistics;

# Identify duplicates
SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;


SELECT *
FROM (
SELECT row_id, id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
FROM us_household_income)  AS row_table
WHERE row_num > 1;


DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id, 
        id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
		FROM us_household_income
        ) AS row_table
WHERE row_num > 1);



SELECT id, COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1;


SELECT DISTINCT state_name
FROM us_household_income
ORDER BY 1;


UPDATE us_household_income
SET state_name = 'Georgia'
WHERE state_name = 'georia';


UPDATE us_household_income
SET state_name = 'Alabama'
WHERE state_name = 'alabama';


SELECT *
FROM us_household_income
WHERE PLACE = ''
ORDER BY 1;

SELECT *
FROM us_household_income
WHERE County = 'Autauga County'
ORDER BY 1;

SELECT Place, COUNT(County)
FROM us_household_income
WHERE County = 'Autauga County'
GROUP BY place;

UPDATE us_household_income
SET place = 'Autaugaville'
WHERE County = 'Autauga County' AND City = 'Vinemont';

SELECT type, COUNT(type)
FROM us_household_income
GROUP BY Type;

UPDATE us_household_income
SET type = 'Borough'
WHERE type = 'Boroughs';

SELECT Aland, AWater
FROM us_household_income
WHERE AWater IN (0,'', NULL) ;

SELECT Aland, AWater
FROM us_household_income
WHERE ALand IN (0,'', NULL) ;



