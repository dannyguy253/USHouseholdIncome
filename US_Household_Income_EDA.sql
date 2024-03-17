# US Housegold Income Exploratory Data Analysis

SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

SELECT state_name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY state_name
ORDER BY 3 DESC;

# Top 10 Largest States by Land
SELECT state_name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY state_name
ORDER BY 2 DESC
LIMIT 10;


# Top 10 Largest States by Water
SELECT state_name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY state_name
ORDER BY 3 DESC
LIMIT 10;



SELECT *
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0;

SELECT u.state_name, county, type, `Primary`, Mean, Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0;

# 5 Lowest Income by Mean
SELECT u.state_name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.state_name
ORDER BY 2
LIMIT 5;

SELECT u.state_name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.state_name
ORDER BY 3 ASC
LIMIT 10;

# Average Income by Type
SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY Type
ORDER BY 4 DESC;

SELECT *
FROM us_household_income
WHERE type = 'Community';


SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC;


# Average Household Income by State and City
SELECT u.state_name, city, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.State_name, city
ORDER BY 3 DESC;
